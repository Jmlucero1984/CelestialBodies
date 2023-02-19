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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visible_from_earth boolean NOT NULL,
    spacecraft_sent boolean,
    age_million_years integer,
    years_since_discovered integer,
    dist_from_earth_million_km numeric(10,2),
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visible_from_earth boolean NOT NULL,
    spacecraft_sent boolean,
    age_million_years integer,
    years_since_discovered integer,
    dist_from_earth_million_km numeric(10,2),
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
    visible_from_earth boolean NOT NULL,
    spacecraft_sent boolean,
    age_million_years integer,
    years_since_discovered integer,
    dist_from_earth_million_km numeric(10,2),
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
    visible_from_earth boolean NOT NULL,
    spacecraft_sent boolean,
    age_million_years integer,
    years_since_discovered integer,
    dist_from_earth_million_km numeric(10,2),
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visible_from_earth boolean NOT NULL,
    spacecraft_sent boolean NOT NULL,
    age_million_years integer,
    years_since_discovered integer,
    dist_from_earth_million_km numeric(10,2),
    description text,
    galaxy_id integer
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


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
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, 4603, 413, NULL, 'So called due to the white trails of celestials bodies...');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', false, false, NULL, 20, NULL, 'The closest to the Milky Waay');
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Elliptical', false, false, NULL, 29, NULL, 'An elliptical loop-shaped satellite galaxy');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', true, false, NULL, 411, NULL, 'The Andromeda and Milky Way galaxies are moving toward each other due to mutual gravitational attraction');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', true, false, NULL, 504, NULL, 'Discovered by Magellan 1519. The Large Magellanic Cloud, together with its apparent neighbor and relative, the Small Magellanic Cloud, are conspicuous objects in the southern hemisphere, looking like separated pieces of the Milky Way for the naked eye');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', true, false, NULL, 369, NULL, ' Spiral galaxy M33 is located in the triangle-shaped constellation Triangulum, earning it the nickname the Triangulum galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earths Moon', true, true, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', true, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', true, true, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Titania', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (5, 'Ariel', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (6, 'Umbre', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Oberon', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Puck', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Cresida', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Ofelia', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Trinculo', true, false, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Triton', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Talasa', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Nereida', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Neso', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Despina', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Galatea', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Psamate', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Proteo', true, false, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (21, 'Larisa', true, false, NULL, NULL, NULL, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', true, true, 4600, 9999999, 0.00, 'Home', 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, true, 4543, 413, 54.60, 'High probabilities once it had life', 1);
INSERT INTO public.planet VALUES (5, 'Venus', true, true, 4503, 413, 61.00, 'The second planet from the Sun. It is sometimes called Earths "sister" or "twin" planet as it is almost as large and has a similar composition', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', true, false, 4503, 242, 2600.00, 'The Ice Giant', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', true, false, 4503, 177, 4300.00, 'Mainly water fog, ammonia and methane', 1);
INSERT INTO public.planet VALUES (8, 'Saturn', true, true, 4503, 413, 1200.00, 'Pure gas', 1);
INSERT INTO public.planet VALUES (9, 'Jupiter', true, true, 4503, 413, 778.00, 'The biggest planet in the Solar System', 1);
INSERT INTO public.planet VALUES (10, 'Mercury', true, false, 4503, 392, 77.00, 'The hottest and the closest to the sun, a little burning planet', 1);
INSERT INTO public.planet VALUES (11, 'Kepler-90c', false, false, NULL, 10, NULL, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Kepler-90b', false, false, NULL, 10, NULL, NULL, 7);
INSERT INTO public.planet VALUES (13, 'Kepler-90d', false, false, NULL, 10, NULL, NULL, 7);
INSERT INTO public.planet VALUES (14, 'Kepler-90e', false, false, NULL, 10, NULL, NULL, 7);
INSERT INTO public.planet VALUES (15, 'Kepler-90f', false, false, NULL, 10, NULL, NULL, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, false, NULL, 9999999, NULL, 'Our main source of energy, it was there before we came, and will still be there after us', 1);
INSERT INTO public.star VALUES (2, 'Antares', true, false, NULL, 204, NULL, 'The star is so bright that it washed out its fainter companion, meaning that Antares B was not discovered until well into the telescopic age', 1);
INSERT INTO public.star VALUES (3, 'Bettel Geuse', true, false, NULL, 187, NULL, ' is one of the most luminous stars in the night sky. It is a variable star and usually has an apparent magnitude of about 0.6. However, in late 2019 it began dimming', 1);
INSERT INTO public.star VALUES (4, 'KW Sagittarii', true, false, NULL, 259, NULL, 'is located approximately 4,900 light years away from us, between the Sagittarius Star Cloud (Messier 24) and the Omega Nebula (Messier 17)', 1);
INSERT INTO public.star VALUES (5, 'Sirius', true, false, NULL, 161, NULL, 'Sirius is the brightest star in the night sky. Its name is derived from the Greek word Seirios, meaning lit, glowing  or scorchin', 2);
INSERT INTO public.star VALUES (6, 'Adhara', true, false, NULL, 31, NULL, 'The 2nd brightest naked eye star in the constellation Canis Major. With an apparent magnitude of 1.5, Adhara is the 22nd brightest star in the entire sky', 2);
INSERT INTO public.star VALUES (7, 'Kepler-90', false, false, NULL, 20, NULL, 'In the constellation of Draco. It is notable for possessing a planetary system that has the same number of observed planets as the Solar System', 1);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Solar System', true, true, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.system VALUES (2, 'Alpha Centauri', true, false, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.system VALUES (3, 'Proxima Centauri', true, false, NULL, NULL, NULL, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 3, true);


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
-- Name: system system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_key UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


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
-- Name: system system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

