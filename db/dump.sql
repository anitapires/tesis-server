--
-- File generated with SQLiteStudio v3.0.7 on mié. may. 25 18:26:39 2016
--
-- Text encoding used: UTF-8
--
-- Table: drawings
DROP TABLE IF EXISTS drawings;
CREATE TABLE drawings (id SERIAL PRIMARY KEY, color VARCHAR (255));

-- Table: sections
DROP TABLE IF EXISTS sections;
CREATE TABLE sections (id SERIAL PRIMARY KEY, drawing_id INTEGER REFERENCES drawings (id) ON DELETE CASCADE NOT NULL, latitude VARCHAR (255) NOT NULL, longitude VARCHAR (255) NOT NULL);

INSERT INTO drawings (id, color) VALUES (1, '#0000FF');

INSERT INTO sections (id, drawing_id, latitude, longitude) VALUES (1, 1, '-34.911038', '-57.954474');
INSERT INTO sections (id, drawing_id, latitude, longitude) VALUES (2, 1, '-34.909615', '-57.941537');
INSERT INTO sections (id, drawing_id, latitude, longitude) VALUES (3, 1, '-34.920203', '-57.941868');
