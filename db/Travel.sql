
DROP TABLE visits;
DROP TABLE cities;
DROP TABLE adventures;


CREATE TABLE adventures(
  id SERIAL4 PRIMARY KEY,
  country VARCHAR(255),
  continent VARCHAR(255)
);

CREATE TABLE cities(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  interest VARCHAR(255),
  adventure_id INT2 REFERENCES adventures(id) ON DELETE CASCADE
);

CREATE TABLE visits(
  id SERIAL4 PRIMARY KEY,
  arrival_date VARCHAR(255),
  duration INT2,
  adventure_id INT2 REFERENCES adventures(id) ON DELETE CASCADE,
  review VARCHAR(800)
);
