DROP TABLE flights;
DROP TABLE wish_lists;
DROP TABLE oil_workers;
DROP TABLE oil_companys;
DROP TABLE rigs;

CREATE TABLE oil_workers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_num VARCHAR(255)
);

CREATE TABLE rigs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  distance INT,
  country VARCHAR(255)
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  oil_worker_id INT REFERENCES oil_workers(id) ON DELETE CASCADE,
  rig_id INT REFERENCES rigs(id) ON DELETE CASCADE,
  date VARCHAR(255)
);

CREATE TABLE wish_lists (
  id SERIAL PRIMARY KEY,
  oil_worker_id INT REFERENCES oil_workers(id) ON DELETE CASCADE,
  rig_id INT REFERENCES rigs(id) ON DELETE CASCADE
);

CREATE TABLE oil_companys (
  id SERIAL PRIMARY KEY,
  rig_id INT REFERENCES rigs(id) ON DELETE CASCADE,
  name VARCHAR(255),
  type VARCHAR(255)
);