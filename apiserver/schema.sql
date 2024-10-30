DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  serviceYear INTEGER,
  role TEXT NOT NULL,
  secretKey TEXT,
  nik TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

INSERT INTO user (username, nik, password, name, email, serviceYear, role, secretKey) VALUES ('user001', 7483923455637465, 'pbkdf2:sha256:600000$39XMLCD9k2FxIxel$65b5107e330afe8a25b68947a4796f6ff966f3cece094f26e224dc45ffb96971', 'Ogah',  'ogah@abc.id',  2, 'user',  'FLAG-28A7C2BD-FA9E-445D-A22B-801FE72AF451');
INSERT INTO user (username, nik, password, name, email, serviceYear, role, secretKey) VALUES ('user002', 7423438475637465, 'pbkdf2:sha256:600000$qFAk1taqZVuM2r0t$7d9a1a7fd53806c20a0ea30d6115fadae81b084b52fb4e37a1914e0087513f06', 'Unyil', 'unyil@efg.id', 4, 'user',  'FLAG-A87B65CC-1FCE-4E07-B069-1153F99140F6');
INSERT INTO user (username, nik, password, name, email, serviceYear, role, secretKey) VALUES ('user003', 7839284788874565, 'pbkdf2:sha256:600000$h2rw7oc8DpQNCstn$51aa6c6846833ffa3af8161d7e3f6114715597bbb374bdbff5ff0e41ce733ab0', 'Usro',  'usro@hij.id',  3, 'user',  'FLAG-E07358D9-2CF8-4E8C-91CF-067F4FA11D2D');
INSERT INTO user (username, nik, password, name, email, serviceYear, role, secretKey) VALUES ('user004', 7409384475637465, 'pbkdf2:sha256:600000$PxjDMVGZs981FK2S$779a7d57e312ac9597a2f10979409130d727680c4fe44ad4d0458213cda7067d', 'Ableh', 'ableh@klm.id', 3, 'admin', 'FLAG-474931AE-5B03-4524-970A-734F8AE6F7D1');
INSERT INTO user (username, nik, password, name, email, serviceYear, role, secretKey) VALUES ('user005', 7483927329387465, 'pbkdf2:sha256:600000$1wKmkbZqBJTku07t$1af3dd05a5f3da66b312c269ce14f211f3a92f6709b871af8e0651b7c9745e0a', 'Ucrit', 'ucrit@nop.id', 1, 'admin', 'FLAG-85CA685A-10EF-446A-862B-60FE569E71FA');
