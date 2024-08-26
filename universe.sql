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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    distance_to_milky_way_in_light_years double precision,
    age_in_billions_of_years double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: lgm; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.lgm (
    lgm_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100)
);


ALTER TABLE public.lgm OWNER TO freecodecamp;

--
-- Name: lgm_lgm_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.lgm_lgm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lgm_lgm_id_seq OWNER TO freecodecamp;

--
-- Name: lgm_lgm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.lgm_lgm_id_seq OWNED BY public.lgm.lgm_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    weight_in_earth_moons integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    have_life boolean,
    weight_in_number_of_earths double precision,
    number_of_moons integer,
    age_in_billions_of_years double precision,
    star_id integer NOT NULL,
    has_atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    distance_to_earth_in_light_years numeric(10,2),
    age_in_billions_of_years double precision,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: lgm lgm_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lgm ALTER COLUMN lgm_id SET DEFAULT nextval('public.lgm_lgm_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 0, 13.51);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way', 2537000, 10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 3000000, 12);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral galaxy', 23000000, 10);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unbarred spiral galaxy in Virgo constellation', 29000000, 13);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy in Ursa Major', 21000000, 13.2);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Peculiar galaxy with a supermassive black hole', 13000000, 13);
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'Giant elliptical galaxy in the Virgo Cluster', 53000000, 14);
INSERT INTO public.galaxy VALUES (9, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 163000, 13.5);
INSERT INTO public.galaxy VALUES (10, 'Small Magellanic Cloud', 'Dwarf galaxy near the Milky Way', 200000, 13.4);


--
-- Data for Name: lgm; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.lgm VALUES (1, 'baba', 'yobo');
INSERT INTO public.lgm VALUES (2, 'mama', 'kadogo');
INSERT INTO public.lgm VALUES (3, 'bossman', 'fafa');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'bobo', 'full tide', 1, 2);
INSERT INTO public.moon VALUES (2, 'bob', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (3, 'bob3', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (4, 'bob33', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (5, 'bob343', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (6, 'bob3543', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (7, 'bob35743', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (8, 'bob365743', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (9, 'bo5b365743', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (10, 'bo5b3657453', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (11, 'bo54b3657453', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (12, 'bo54b3657453f', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (13, 'bo54b365743f', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (14, 'bo54b36573f', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (15, 'bo54b3657f', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (16, 'bo54b36570f', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (17, 'bo54b365670f', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (18, 'b8o54b365670f', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (19, 'b8o54b365670f9', 'full tide', 1, 1);
INSERT INTO public.moon VALUES (20, 'yeba', 'baye', 2, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Only known planet with life', true, 1, 1, 4.54, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet', false, 0.107, 2, 4.6, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in the Solar System', false, 317.8, 79, 4.6, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Famous for its rings', false, 95.2, 83, 4.5, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Potentially habitable exoplanet', NULL, 1.27, 0, 4.85, 6, NULL);
INSERT INTO public.planet VALUES (6, 'Gliese 581g', 'Super-Earth in the habitable zone', NULL, 4.3, 0, 7, 3, NULL);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 'First known planet in the habitable zone', NULL, 2.4, 0, 4, 5, NULL);
INSERT INTO public.planet VALUES (8, 'Titan', 'Largest moon of Saturn, thick atmosphere', false, 0.0225, 0, 4.5, 4, NULL);
INSERT INTO public.planet VALUES (9, 'Europa', 'Moon of Jupiter, possible subsurface ocean', false, 0.008, 0, 4.5, 3, NULL);
INSERT INTO public.planet VALUES (10, 'Tatooine', 'Fictional planet with twin suns', false, 1.1, 0, 5, 9, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'First Earth-sized planet in the habitable zone of another star', NULL, 1.2, 0, 4.5, 7, NULL);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Also known as Osiris, a hot Jupiter exoplanet', NULL, 0.69, 0, 4, 8, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Brightest star in the night sky', 8.60, 0.242, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red supergiant in Orion', 642.50, 8, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Closest star system to Earth', 4.37, 5.3, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'Bright star in the Lyra constellation', 25.30, 0.455, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue supergiant in Orion', 860.00, 8, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Closest known star to the Sun', 4.24, 4.85, 1);
INSERT INTO public.star VALUES (7, 'Altair', 'Bright star in Aquila constellation', 16.70, 1.2, 3);
INSERT INTO public.star VALUES (8, 'Aldebaran', 'Brightest star in Taurus', 65.30, 6.7, 2);
INSERT INTO public.star VALUES (9, 'Spica', 'Brightest star in Virgo', 250.00, 101.1, 3);
INSERT INTO public.star VALUES (10, 'Polaris', 'North Star', 323.00, 4.6, 4);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 1, false);


--
-- Name: lgm_lgm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.lgm_lgm_id_seq', 1, false);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 2, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 1, false);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 1, false);


--
-- Name: galaxy galaxies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_name_key UNIQUE (name);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: lgm lgm_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lgm
    ADD CONSTRAINT lgm_name_key UNIQUE (name);


--
-- Name: lgm lgm_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lgm
    ADD CONSTRAINT lgm_pkey PRIMARY KEY (lgm_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moons_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

