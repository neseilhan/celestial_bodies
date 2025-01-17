--Create Database and connect to it
------------------------------------------------------------
psql --username=freecodecamp --dbname=postgres;

CREATE DATABASE universe;

\c universe

-- Create tables
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    star_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INTEGER NOT NULL,
    planet_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INTEGER NOT NULL,
    moon_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE more_info (
    more_info_id SERIAL PRIMARY KEY,
    object_id INTEGER,
    name VARCHAR(20) UNIQUE NOT NULL,
    description TEXT
);

-- Add foreign keys
ALTER TABLE galaxy ADD FOREIGN KEY (star_id) REFERENCES star (star_id);
ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id);
ALTER TABLE star ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star (star_id);
ALTER TABLE planet ADD FOREIGN KEY (moon_id) REFERENCES moon (moon_id);
ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);

-- Insert data into the galaxy table
INSERT INTO galaxy (galaxy_id, star_id, name, area, volume, age, material, has_life, has_water) VALUES 
(1, 1, 'Milky Way', 1000, 2000, 13000.50, 'gas', true, true),
(2, 2, 'Andromeda', 1500, 2500, 10000.75, 'dust', false, false),
(3, 3, 'Triangulum', 800, 1800, 9000.25, 'gas', true, false),
(4, 4, 'Whirlpool', 1200, 2200, 11000.80, 'ice', false, true),
(5, 5, 'Pinwheel', 1300, 2300, 9500.60, 'solid', true, true),
(6, 6, 'Sombrero', 1400, 2400, 10500.70, 'dust', false, false);

-- Insert data into the star table
INSERT INTO star (star_id, galaxy_id, planet_id, name, area, volume, age, material, has_life, has_water) VALUES
(1, 1, 1, 'Sun', 500, 750, 4600.75, 'gas', true, true),
(2, 2, 2, 'Sirius', 600, 850, 3000.60, 'solid', false, false),
(3, 3, 3, 'Betelgeuse', 700, 950, 8000.90, 'gas', true, false),
(4, 4, 4, 'Rigel', 800, 1050, 5000.45, 'dust', false, true),
(5, 5, 5, 'Vega', 900, 1150, 6000.35, 'solid', true, true),
(6, 6, 6, 'Altair', 1000, 1250, 7000.25, 'gas', false, false);

-- Insert data into the planet table
INSERT INTO planet (planet_id, star_id, moon_id, name, area, volume, age, material, has_life, has_water) VALUES
(1,  1,  1, 'Earth', 510, 1083, 4500.75, 'rock', true, true),
(2,  2,  2, 'Mars', 144, 163, 4600.50, 'rock', false, false),
(3,  3,  3, 'Jupiter', 61420, 1431300, 4600.60, 'gas', false, true),
(4,  4,  4, 'Saturn', 42700, 827130, 4600.70, 'gas', false, false),
(5,  5,  5, 'Uranus', 8083, 683130, 4600.80, 'ice', false, true),
(6,  6,  6, 'Neptune', 7618, 627430, 4600.90, 'ice', false, false),
(7,  6,  7, 'Pluto', 17, 6.39, 4600.95, 'rock', false, false),
(8,  6,  8, 'Eris', 23, 2.16, 4600.85, 'rock', false, false),
(9,  6,  9, 'Haumea', 18, 4.01, 4600.75, 'rock', false, false),
(10, 6, 10, 'Makemake', 13, 3.24, 4600.65, 'rock', false, false),
(11, 6, 11, 'Ceres', 9, 0.945, 4600.55, 'rock', false, false),
(12, 6, 12, 'Ganymede', 87, 7.48, 4600.45, 'ice', false, false);

-- Insert data into the moon table
INSERT INTO moon (moon_id, planet_id, name, area, volume, age, material, has_life, has_water) VALUES 
(1,   1, 'Moon', 37.9, 21.9, 4500.75, 'rock', false, false),
(2,   2, 'Phobos', 0.006, 0.00072, 4600.50, 'rock', false, false),
(3,   3, 'Europa', 30.9, 15.9, 4600.60, 'ice', false, true),
(4,   4, 'Titan', 83.3, 71.4, 4600.70, 'ice', false, true),
(5,   5, 'Oberon', 76.8, 64.4, 4600.80, 'rock', false, false),
(6,   6, 'Triton', 23.5, 14.3, 4600.90, 'ice', false, false),
(7,   7, 'Charon', 11.3, 7.2, 4600.95, 'rock', false, false),
(8,   8, 'Dysnomia', 0.005, 0.00041, 4600.85, 'rock', false, false),
(9,   9, 'Hiʻiaka', 0.01, 0.00079, 4600.75, 'rock', false, false),
(10, 10, 'Nix', 0.003, 0.00024, 4600.65, 'rock', false, false),
(11, 11, 'Hydra', 0.002, 0.00018, 4600.55, 'rock', false, false),
(12, 11, 'Kerberos', 0.001, 0.00013, 4600.45, 'rock', false, false),
(13, 11, 'Styx', 0.0008, 0.00011, 4600.35, 'rock', false, false),
(14, 11, 'Enceladus', 0.004, 0.00033, 4600.25, 'ice', false, true),
(15, 11, 'Mimas', 0.003, 0.00025, 4600.15, 'rock', false, false),
(16, 11, 'Tethys', 0.006, 0.00052, 4600.05, 'ice', false, true),
(17, 11, 'Dione', 0.005, 0.00042, 4599.95, 'rock', false, true),
(18, 11, 'Rhea', 0.007, 0.00061, 4599.85, 'rock', false, true),
(19, 11, 'Iapetus', 0.02, 0.0018, 4599.75, 'rock', false, false),
(20, 11, 'Hyperion', 0.0004, 0.000033, 4599.65, 'rock', false, false);

-- Insert data into the more_info table
INSERT INTO more_info (more_info_id, object_id, name, description) VALUES
(1, 1, 'Galactic Info', 'This galaxy contains a high number of stars and planets.'),
(2, 2, 'Star Info', 'This star is known for its brightness and size.'),
(3, 3, 'Planet Info', 'This planet has potential for life due to its conditions.'),
(4, 4, 'Moon Info', 'This moon has an icy surface and potential subsurface ocean.'),
(5, 5, 'Additional Info', 'More information about this object will be provided later.');
