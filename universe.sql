--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_name character varying(30) NOT NULL,
    galaxy_name character varying(30) NOT NULL,
    black_hole_id integer NOT NULL,
    size_in_million_km integer,
    age_in_billions_of_years integer,
    name character varying(30)
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_holes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(30) NOT NULL,
    description text NOT NULL,
    number_of_stars bigint,
    radius_in_light_years integer,
    name character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying(30) NOT NULL,
    description text NOT NULL,
    planet_name character varying(30),
    size_in_km integer,
    name character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying(30) NOT NULL,
    is_spherical boolean,
    is_gas_giant boolean,
    age_in_years bigint,
    distance_from_earth bigint,
    atmospheric_thickness_in_miles numeric,
    description text NOT NULL,
    name character varying(30),
    star_name character varying(30),
    number_of_moons integer,
    number_of_rings integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(30) NOT NULL,
    description text NOT NULL,
    galaxy_name character varying(30),
    category character varying(30),
    name character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_holes_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES ('sagittarius a', 'milky way', 1, 12, 15, NULL);
INSERT INTO public.black_hole VALUES ('central black hole', 'andromeda', 2, 5, 14, NULL);
INSERT INTO public.black_hole VALUES ('central black hole', 'cartwheel galaxy', 4, 5, 14, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 'The galaxy that invludes our solar system.', 1000000000, 52850, 'milky way');
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'a barred spiral galaxy.', 1000000000000, 220000, 'andromeda');
INSERT INTO public.galaxy VALUES (3, 'triangulum', 'a spiral galaxy 2.73 million lightyears from earth.', 40000000000, 300000, 'triangulum');
INSERT INTO public.galaxy VALUES (4, 'messier 81', 'a grand design spiral galaxy 12 million light years from earth.', 250000000000, 45000, 'messier 81');
INSERT INTO public.galaxy VALUES (5, 'sombrero galaxy', 'a peculiar galaxy of unclear classification.', 100000000000, 25000, 'sombrero galaxy');
INSERT INTO public.galaxy VALUES (6, 'cartwheel galaxy', 'a lenticular and ring galaxy 500 million light years from earth, in the constellation Sculptor.', 10000000000, 65000, 'cartwheel galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'the moon', 'the earths moon', 'earth', 3500, 'the moon');
INSERT INTO public.moon VALUES (6, 'phobos', 'mars largest moon. irregularly shaped and close to mars, completing an orbit faster than mars rotates, at 7 minutes 49 seconds', 'mars', 11, 'phobos');
INSERT INTO public.moon VALUES (9, 'deimos', 'the outermost of mars two moons', 'mars', 6, 'deimos');
INSERT INTO public.moon VALUES (10, 'europa', 'the 6th largest moon in the solar system', 'jupiter', 1500, 'europa');
INSERT INTO public.moon VALUES (11, 'ganymede', 'the largest moon in the solar system', 'jupiter', 2600, 'ganymede');
INSERT INTO public.moon VALUES (12, 'io', 'has the highest density of any moon and the strongest surface gravity', 'jupiter', 1800, 'io');
INSERT INTO public.moon VALUES (13, 'callisto', 'composed of equal amounts rock and ice', 'jupiter', 2400, 'callisto');
INSERT INTO public.moon VALUES (14, 'amalthea', 'irregularly shaped and reddish in colour', 'jupiter', 83, 'amalthea');
INSERT INTO public.moon VALUES (15, 'adrastea', 'obits jupiter quicker than a jupiter day', 'jupiter', 63, 'adrastea');
INSERT INTO public.moon VALUES (16, 'valetudo', 'a very small and recently discovered moon', 'jupiter', 1, 'valetudo');
INSERT INTO public.moon VALUES (17, 'thebe', 'discovered in 1979, irregularly shaped and reddish in colour', 'jupiter', 49, 'thebe');
INSERT INTO public.moon VALUES (18, 'elara', 'prograde irregular satelleite of jupiter', 'jupiter', 43, 'elara');
INSERT INTO public.moon VALUES (19, 'carme', 'retrograde irregular satelleite of jupiter', 'jupiter', 23, 'carme');
INSERT INTO public.moon VALUES (20, 'himalia', 'one of the largest planetary moons not imaged in detail', 'jupiter', 85, 'himalia');
INSERT INTO public.moon VALUES (21, 'eirene', 'retrograde irregular satelleite of jupiter', 'jupiter', 4, 'eirene');
INSERT INTO public.moon VALUES (22, 'callirrhoe', 'retrograde irregular satelleite of jupiter', 'jupiter', 10, 'callirrhoe');
INSERT INTO public.moon VALUES (23, 'dia', 'prograde irregular satelleite of jupiter', 'jupiter', 140, 'dia');
INSERT INTO public.moon VALUES (25, 'encladus', 'covered by fresh clean ice, making it one of the most reflective bodies in the solar system', 'saturn', 500, 'encladus');
INSERT INTO public.moon VALUES (24, 'titan', 'the only known moon to have a dense atmosphere', 'saturn', 2600, 'titan');
INSERT INTO public.moon VALUES (26, 'mimas', 'the smallest known astronomical body to be rounded in shape', 'saturn', 396, 'mimas');
INSERT INTO public.moon VALUES (27, 'dione', 'saturns 4th largest moon', 'saturn', 561, 'dione');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', true, false, 5000000000, 0, 60, 'the only known planet to harbour life', 'earth', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (2, 'venus', true, false, 4500000000, 38000000, 30, 'an extremely hot planet and the second closest to the sun', 'venus', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (4, 'mercury', true, false, 4500000000, 45000000, 1, 'the smallest planet inn the solar system and the closest to the sun.', 'mercury', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (5, 'mars', true, false, 4600000000, 33900000, 6, 'the red planet, and the fourth closest to the sun.', 'mars', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (6, 'jupiter', true, true, 4600000000, 365000000, 13030, 'a gas giant with a mass more than two and a half times all the other planets in the solar ystem combined', 'jupiter', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (7, 'saturn', true, true, 4500000000, 886000000, 124, 'the planet with the most extensive ring system in our solar system.', 'saturn', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (8, 'neptune', true, true, 4500000000, 4400000000, 6200, 'the eiighth and farthestplanet from the sun', 'neptune', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (9, 'pluto', true, false, 4600000000, 5000000000, 1, 'a dwarf planet in the kuiper belt', 'pluto', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (10, 'uranus', true, true, 4500000000, 1600000000, 31068, 'the seventh planet from the sun. a gas giant', 'uranus', 'the sun', NULL, NULL);
INSERT INTO public.planet VALUES (12, 'proxima centauri b', true, false, 44800000000, 0, 34600000, 'habitable planet close to a red dwarf star', 'proxima centauri b', 'proxima centauri', NULL, NULL);
INSERT INTO public.planet VALUES (44, 'tres-2b', true, true, 5000000, 500000, 500000, 'the darkest known exoplanet, reflecting only 1% of light that its it, and also one of the largest.', 'tres-2b', 'stephenson 218', NULL, NULL);
INSERT INTO public.planet VALUES (45, 'kepler-7b', true, true, 5000000, 500000, 500000, 'hotter and significantly larger tthan the sun', 'kepler-7b', 'stephenson 218', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'the sun', 'the center of our solar system', 'milky way', 'yellow dwarf', 'the sun');
INSERT INTO public.star VALUES (2, 'hd 2492', 'a triple star system in the andromeda galaxy', 'andromeda', 'red giant', 'hd 2492');
INSERT INTO public.star VALUES (4, 'stephenson 218', 'the biggest star in the milky way', 'milky way', 'red hypergiant', 'stephenson 218');
INSERT INTO public.star VALUES (5, 'J0207', 'ancient white dwarf in triangulum galaxy.', 'triangulum', 'white dwarf', 'J0207');
INSERT INTO public.star VALUES (6, 'alpheratz', 'hot  blue star in andromeda.', 'andromeda', 'blue star', 'alpheratz');
INSERT INTO public.star VALUES (7, 'proxima centauri', 'closest star to earth other than the sun.', 'milky way', 'red dwarf', 'proxima centauri');


--
-- Name: black_holes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 27, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 45, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: black_hole black_hole_black_hole_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_black_hole_id_key UNIQUE (black_hole_id);


--
-- Name: black_hole black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_id UNIQUE (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (planet_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (star_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole galaxy_name; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT galaxy_name FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--