--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    mass integer,
    density numeric,
    is_active boolean,
    is_visible boolean,
    description text
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type_desc text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    speed integer,
    mass integer,
    gravity numeric,
    is_habitable boolean,
    is_visible boolean,
    description text,
    planet_id integer
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
    mass integer,
    size integer,
    orbit numeric,
    is_habitable boolean,
    is_visible boolean,
    description text,
    star_id integer
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
    temp integer,
    brightness integer,
    mass numeric,
    is_active boolean,
    is_visible boolean,
    description text,
    galaxy_id integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 1500, 7.5, true, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 2000, 8.1, true, true, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 45000, 900, 6.9, true, false, 'Bright galaxy with a central bulge');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, 1100, 7.2, true, true, 'Famous spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 90000, 1300, 7.8, true, true, 'Bright spiral galaxy in Ursa Major');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 50000, 800, 6.7, true, true, 'Small spiral galaxy near Andromeda');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Galaxies with a flat, rotating disk and spiral arms');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Galaxies that are ellipsoidal in shape and have little structure');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Galaxies without a distinct regular shape or structure');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 734, 1.62, false, true, 'Earth''s moon', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, 0.0057, false, true, 'Mars''s closer moon', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 2, 0.003, false, true, 'Mars''s smaller moon', 4);
INSERT INTO public.moon VALUES (4, 'Io', 17, 893, 1.796, false, true, 'Moon of Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 13, 480, 1.315, false, true, 'Moon of Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 10, 1482, 1.428, false, true, 'Moon of Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 9, 1076, 1.235, false, true, 'Moon of Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 1345, 1.352, false, true, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 8, 113, 0.113, false, true, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (10, 'Triton', 7, 214, 0.779, false, true, 'Moon of Neptune', 8);
INSERT INTO public.moon VALUES (11, 'Proxima b I', 3, 25, 0.12, false, false, 'Moon orbiting Proxima b', 9);
INSERT INTO public.moon VALUES (12, 'Alpha Centauri Bb I', 2, 30, 0.15, false, false, 'Moon orbiting Alpha Centauri Bb', 10);
INSERT INTO public.moon VALUES (13, 'Sirius Ab I', 4, 40, 0.18, false, false, 'Moon orbiting Sirius Ab', 11);
INSERT INTO public.moon VALUES (14, 'Sirius Ac I', 3, 45, 0.2, false, false, 'Moon orbiting Sirius Ac', 12);
INSERT INTO public.moon VALUES (15, 'Betelgeuse I a', 5, 50, 0.3, false, false, 'Moon orbiting Betelgeuse I', 13);
INSERT INTO public.moon VALUES (16, 'Rigel I a', 6, 60, 0.35, false, false, 'Moon orbiting Rigel I', 14);
INSERT INTO public.moon VALUES (17, 'Rigel II a', 5, 65, 0.4, false, false, 'Moon orbiting Rigel II', 15);
INSERT INTO public.moon VALUES (18, 'Vega I a', 4, 55, 0.25, false, false, 'Moon orbiting Vega I', 16);
INSERT INTO public.moon VALUES (19, 'Vega II a', 3, 50, 0.2, false, false, 'Moon orbiting Vega II', 17);
INSERT INTO public.moon VALUES (20, 'Vega III a', 3, 52, 0.22, false, false, 'Moon orbiting Vega III', 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 330, 4879, 0.39, false, true, 'Closest planet to the Sun', 4);
INSERT INTO public.planet VALUES (2, 'Venus', 4867, 12104, 0.72, false, true, 'Second planet from the Sun', 4);
INSERT INTO public.planet VALUES (3, 'Earth', 5972, 12742, 1.0, true, true, 'Our home planet', 4);
INSERT INTO public.planet VALUES (4, 'Mars', 641, 6779, 1.52, false, true, 'The red planet', 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898000, 139820, 5.2, false, true, 'Largest planet in Solar System', 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 568000, 116460, 9.58, false, true, 'Known for its rings', 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 86800, 50724, 19.2, false, true, 'Ice giant planet', 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 102000, 49244, 30.1, false, true, 'Farthest known planet', 4);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1300, 12000, 0.05, false, true, 'Exoplanet orbiting Proxima Centauri', 5);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 1400, 12500, 0.11, false, true, 'Exoplanet around Alpha Centauri B', 5);
INSERT INTO public.planet VALUES (11, 'Sirius Ab', 2000, 14000, 0.3, false, true, 'Exoplanet orbiting Sirius', 5);
INSERT INTO public.planet VALUES (12, 'Sirius Ac', 2100, 14500, 0.5, false, true, 'Second planet orbiting Sirius', 5);
INSERT INTO public.planet VALUES (13, 'Betelgeuse I', 5000, 15000, 1.2, false, false, 'Hypothetical planet around Betelgeuse', 5);
INSERT INTO public.planet VALUES (14, 'Rigel I', 4000, 14000, 2.1, false, false, 'Exoplanet orbiting Rigel', 6);
INSERT INTO public.planet VALUES (15, 'Rigel II', 4200, 14500, 2.8, false, false, 'Second exoplanet orbiting Rigel', 6);
INSERT INTO public.planet VALUES (16, 'Vega I', 3000, 13000, 0.9, false, true, 'Planet orbiting Vega', 6);
INSERT INTO public.planet VALUES (17, 'Vega II', 3100, 13500, 1.5, false, true, 'Second planet orbiting Vega', 6);
INSERT INTO public.planet VALUES (18, 'Vega III', 3200, 14000, 2.0, false, true, 'Third planet orbiting Vega', 6);
INSERT INTO public.planet VALUES (19, 'Vega IV', 3300, 14500, 2.5, false, true, 'Fourth planet orbiting Vega', 6);
INSERT INTO public.planet VALUES (20, 'Vega V', 3400, 15000, 3.0, false, true, 'Fifth planet orbiting Vega', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5500, 100, 1.0, true, true, 'Our star', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 5800, 90, 1.1, true, true, 'Nearby star system', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 6200, 120, 1.2, true, true, 'Brightest star in the sky', 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3500, 150, 20.0, true, true, 'Red supergiant star', 2);
INSERT INTO public.star VALUES (5, 'Rigel', 12000, 90, 18.0, true, true, 'Blue supergiant star', 3);
INSERT INTO public.star VALUES (6, 'Vega', 9600, 50, 2.1, true, true, 'Bright star in Lyra', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_type_name_key UNIQUE (name);


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

