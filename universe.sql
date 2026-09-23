-- Create the database
CREATE DATABASE universe;

\c universe;

-- 1. Galaxy Table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years NUMERIC,
    is_spherical BOOLEAN
);

-- 2. Star Table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    distance_from_earth NUMERIC,
    mass NUMERIC,
    is_active BOOLEAN
);

-- 3. Planet Table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    radius NUMERIC,
    has_life BOOLEAN,
    planet_types VARCHAR(50)
);

-- 4. Moon Table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    diameter INT,
    distance_from_planet INT,
    is_spherical BOOLEAN
);

-- 5. Fifth Table (Required by freeCodeCamp)
CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(50)UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    orbital_period INT,
    is_visible BOOLEAN
);

-- Insert sample data to satisfy the tests
INSERT INTO galaxy (name, description, age_in_millions_of_years, is_spherical) VALUES 
('Milky Way', 'Our home galaxy', 13600, false),
('Andromeda', 'Nearest major galaxy', 10000, false),
('Triangulum', 'Member of Local Group', 12000, false),
('Sombrero', 'Unbarred spiral galaxy', 13000, false),
('Whirlpool', 'Interacting grand-design spiral galaxy', 400, false),
('Messier 87', 'Supergiant elliptical galaxy', 13000, true);

INSERT INTO star (name, galaxy_id, distance_from_earth, mass, is_active) VALUES 
('Sun', 1, 0, 1.0, true),
('Proxima Centauri', 1, 4.2, 0.12, true),
('Sirius', 1, 8.6, 2.02, true),
('Betelgeuse', 1, 642, 16.5, false),
('Rigel', 1, 863, 21.0, true),
('Alpheratz', 2, 97, 3.6, true);

INSERT INTO planet (name, star_id, radius, has_life, planet_types) VALUES 
('Earth', 1, 6371, true, 'Terrestrial'),
('Mars', 1, 3389.5, false, 'Terrestrial'),
('Jupiter', 1, 69911, false, 'Gas Giant'),
('Saturn', 1, 58232, false, 'Gas Giant'),
('Venus', 1, 6051.8, false, 'Terrestrial'),
('Mercury', 1, 2439.7, false, 'Terrestrial'),
('Uranus', 1, 25362, false, 'Ice Giant'),
('Neptune', 1, 24622, false, 'Ice Giant'),
('Proxima b', 2, 7163, false, 'Exoplanet'),
('Sirius b-1', 3, 5000, false, 'Dwarf'),
('Betelgeuse I', 4, 12000, false, 'Exoplanet'),
('Rigel Prime', 5, 15000, false, 'Exoplanet');

INSERT INTO moon (name, planet_id, diameter, distance_from_planet, is_spherical) VALUES 
('Moon', 1, 3474, 384400, true),
('Phobos', 2, 22, 6000, false),
('Deimos', 2, 12, 23460, false),
('Io', 3, 3643, 421700, true),
('Europa', 3, 3121, 671034, true),
('Ganymede', 3, 5268, 1070412, true),
('Callisto', 3, 4820, 1882700, true),
('Titan', 4, 5149, 1221870, true),
('Enceladus', 4, 504, 237948, true),
('Mimas', 4, 396, 185539, true),
('Rhea', 4, 1527, 527108, true),
('Dione', 4, 1122, 377396, true),
('Tethys', 4, 1062, 294619, true),
('Iapetus', 4, 1469, 3560820, true),
('Miranda', 7, 471, 129390, true),
('Ariel', 7, 1158, 190900, true),
('Umbriel', 7, 1169, 266000, true),
('Titania', 7, 1577, 435910, true),
('Oberon', 7, 1522, 583520, true),
('Triton', 8, 2706, 354759, true);

INSERT INTO comet (name, star_id, orbital_period, is_visible) VALUES 
('Halley', 1, 75, true),
('Hale-Bopp', 1, 2533, true),
('Encke', 1, 3, false);