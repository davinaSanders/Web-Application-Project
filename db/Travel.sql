DROP TABLE visitors;
DROP TABLE countries;

CREATE TABLE countries(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
);

CREATE TABLE visitors(
  id SERIAL4 PRIMARY KEY,
  nick_name VARCHAR(255),
  country_id INT2 REFERENCES countries(id) ON DELETE CASCADE
);
