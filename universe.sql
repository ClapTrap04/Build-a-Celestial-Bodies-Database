--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric,
    composition text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    galaxy_types text,
    star_count integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    description text,
    number_of_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    galaxy_id integer NOT NULL,
    stellar_mass numeric,
    luminosity numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'Ceres', 945, 'Mixture of ice, stone, and organic matter', 1);
INSERT INTO public.asteroids VALUES (2, 'Pallas', 512, 'Mainly silicates with metal and ice impurities', 1);
INSERT INTO public.asteroids VALUES (3, 'Vesta', 525, 'Primarily composed of silicate rocks', 1);
INSERT INTO public.asteroids VALUES (4, 'Juno', 234, 'Mainly stone and metals', 1);
INSERT INTO public.asteroids VALUES (5, 'Eros', 34.4, 'Mainly silicate rocks with iron and nickel impurities', 2);
INSERT INTO public.asteroids VALUES (6, 'Apophis', 325, 'Mainly stone, possibly with ice impurities', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.5, 'SBb', 200000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Nebula', 5.5, 'Sb', 140000000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 13.5, 'Irr', 10000000);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 13.5, 'dwarf', 1000000);
INSERT INTO public.galaxy VALUES (5, 'NGC 4945', 100, 'SBc', 100000000);
INSERT INTO public.galaxy VALUES (6, 'IC 10', 10, 'dwarf irregular', 1000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 'Only known natural satellite of Earth', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 'One of two natural satellites of Mars, named after Greek god of fear', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 'Second of two natural satellites of Mars, named after Greek god of terror', 2);
INSERT INTO public.moon VALUES (4, 'Io', true, 'One of four Galilean satellites of Jupiter, named after mythological lover', 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 'Second of Galilean satellites of Jupiter, named after mythological princess', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 'Largest satellite in Solar System, third of Galilean satellites of Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 'Fourth of Galilean satellites of Jupiter, named after mythological nymph', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', true, 'First of opened satellites of Saturn, named after giant from Greek mythology', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 'Second opened satellite of Saturn, named after sea monster from Greek mythology', 6);
INSERT INTO public.moon VALUES (10, 'Titan', true, 'Largest satellite of Saturn and second in size in Solar System', 6);
INSERT INTO public.moon VALUES (11, 'Hyperion', true, 'Fourth opened satellite of Saturn, named after titan from Greek mythology', 6);
INSERT INTO public.moon VALUES (12, 'Triton', true, 'Largest satellite of Neptune, named after Greek sea god', 8);
INSERT INTO public.moon VALUES (13, 'Proteus', true, 'Satellite of Neptune discovered in 1989, named after ancient Greek sea god', 8);
INSERT INTO public.moon VALUES (14, 'Triton II', true, 'Small satellite of Neptune discovered in 2019, named after mythical creature', 8);
INSERT INTO public.moon VALUES (15, 'Charon', true, 'Only known satellite of Pluto, named after ferryman of souls in underworld', 9);
INSERT INTO public.moon VALUES (16, 'Styx', true, 'One of five known satellites of Pluto, named after river in underworld', 9);
INSERT INTO public.moon VALUES (17, 'Nyx', true, 'Another satellite of Pluto, named after goddess of night in Greek mythology', 9);
INSERT INTO public.moon VALUES (18, 'Cerberus', true, 'Yet another satellite of Pluto, named after three-headed dog from Greek mythology', 9);
INSERT INTO public.moon VALUES (19, 'Orcus', true, 'Name of one of satellites of Pluto, after Roman god of underworld', 9);
INSERT INTO public.moon VALUES (20, 'Hydra', true, 'Last satellite of Pluto, named after mythical sea monster', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Third planet from the Sun, the only known planet with life', 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Fourth planet from the Sun with two natural satellites, Phobos and Deimos', 2, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'Second planet from the Sun, known for its sulfuric acid clouds and extreme temperatures', 0, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', false, 'Closest to the Sun planet, known for its high temperature and fast rotation around its axis', 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Largest planet in the Solar system, known for its numerous moons and powerful storms', 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Sixth planet from the Sun, known for its rings and many moons', 82, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Seventh planet from the Sun with unique ring structure and unusual climate conditions', 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Eighth planet from the Sun, known for its blue color and strong winds', 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Ninth planet from the Sun, formerly considered the farthest, now classified as a dwarf planet', 5, 1);
INSERT INTO public.planet VALUES (10, 'Eris', false, 'Largest known dwarf planet, discovered in 2005', 0, 2);
INSERT INTO public.planet VALUES (11, 'Haumea', false, 'Dwarf planet with two large natural satellites', 2, 2);
INSERT INTO public.planet VALUES (12, 'Makemake', false, 'One of the largest known dwarf planets', 0, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 8.6, 1, 2.0, 26);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 4.3, 1, 1.1, 1.5);
INSERT INTO public.star VALUES (3, 'Vega', 25.0, 1, 2.1, 40);
INSERT INTO public.star VALUES (4, 'Arcturus', 36.7, 1, 1.8, 110);
INSERT INTO public.star VALUES (5, 'Canopus', 310.0, 2, 10.0, 5000);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 640.0, 2, 20.0, 100000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroids asteroids_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

