DROP TABLE flights;
DROP TABLE oil_workers;
DROP TABLE rigs;

CREATE TABLE oil_workers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_num INT
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
  date VARCHAR(255),
  status TEXT
);