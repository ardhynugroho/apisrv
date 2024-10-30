import os

from flask import Flask, jsonify
from flasgger import Swagger
from flasgger.utils import swag_from

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'db.sqlite'),
    )
    
    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass
    
    from . import db
    db.init_app(app)

    from . import auth
    app.register_blueprint(auth.bp)

    swagger = Swagger(app)
    @app.route("/hello/<yourname>")
    @swag_from("oas/hello.yaml")
    def hello(yourname):
        return jsonify({'msg':'Halo '+yourname})
    
    return app