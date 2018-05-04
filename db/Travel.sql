DROP TABLE visitors;
DROP TABLE countries;
DROP TABLE cities;

CREATE TABLE countries(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  arrival_date VARCHAR(255),
  duration INT2
);

CREATE TABLE visitors(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE cities(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  interest VARCHAR(255),
  country_id REFERENCES countries(id) ON DELETE CASCADE
);
