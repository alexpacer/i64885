

CREATE TABLE victims (
  _id       SERIAL UNIQUE,
  name      TEXT NOT NULL,
  contact   JSON,
  location  JSON
);

CREATE TABLE attorney (
  _id       SERIAL UNIQUE,
  name      TEXT NOT NULL,
  contact   JSON,
  location  JSON,
  hours     JSON,
  tags      JSON
);

CREATE TABLE tags (
  _id       SERIAL UNIQUE,
  name      TEXT NOT NULL
);
  
CREATE TABLE issuies (
  _id       SERIAL UNIQUE,
  person    INTEGER,
  attorney  INTEGER,
  failback  JSON,
  detail    TEXT,
  tags      JSON,
  status    INTEGER
);

CREATE TABLE status (
  _id       SERIAL UNIQUE,
  status    TEXT
);
