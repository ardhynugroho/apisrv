import functools
from flask import Blueprint
from flasgger.utils import swag_from

bp = Blueprint('auth', __name__, url_prefix='/auth')

@bp.route('/login', methods=('GET','POST'))
@swag_from("oas/auth.login.get.yaml", methods=['GET'])
@swag_from("oas/auth.login.post.yaml", methods=['POST'])
def login():
    
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None
        user = db.execute(
            'SELECT * FROM user WHERE username = ?', (username,)
        ).fetchone()

        if user is None:
            error = 'Incorrect username.'
        elif not check_password_hash(user['password'], password):
            error = 'Incorrect password.'

        if error is None:
            session.clear()
            session['user_id'] = user['id']
            response = make_response(redirect(url_for('index')))

            """ 
                generate auth token
                dan set auth header & cookies
            """
            token = jwt.encode({
                'role': user['role']
                , 'secretKey': user['secretKey']
                }
                , 'secret'
                , algorithm="HS256")
            response.headers['Authorization'] = token
            response.set_cookie('Authorization', token)

            return response

        flash(error)

    return render_template('auth/login.html')