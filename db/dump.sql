--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: drawings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE drawings (
    id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE drawings OWNER TO postgres;

--
-- Name: drawgins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE drawings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE drawings_id_seq OWNER TO postgres;

--
-- Name: drawgins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE drawings_id_seq OWNED BY drawings.id;


--
-- Name: points; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE points (
    id integer NOT NULL,
    section_id integer NOT NULL,
    latitude numeric(11,8) NOT NULL,
    longitude numeric(11,8) NOT NULL
);


ALTER TABLE points OWNER TO postgres;

--
-- Name: points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE points_id_seq OWNER TO postgres;

--
-- Name: points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE points_id_seq OWNED BY points.id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sections (
    id integer NOT NULL,
    drawing_id integer NOT NULL,
    color text
);


ALTER TABLE sections OWNER TO postgres;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sections_id_seq OWNER TO postgres;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY drawings ALTER COLUMN id SET DEFAULT nextval('drawgins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY points ALTER COLUMN id SET DEFAULT nextval('points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: drawgins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('drawgins_id_seq', 2, true);


--
-- Data for Name: drawings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO drawings VALUES (1, NULL);
INSERT INTO drawings VALUES (2, NULL);


--
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO points VALUES (1, 1, -34.91103800, -57.95447400);
INSERT INTO points VALUES (2, 1, -34.90961500, -57.94153700);
INSERT INTO points VALUES (3, 1, -34.92020300, -57.94186800);
INSERT INTO points VALUES (4, 2, -34.92148910, -57.95637650);
INSERT INTO points VALUES (5, 2, -34.92152720, -57.96323710);
INSERT INTO points VALUES (6, 2, -34.91961560, -57.96172530);
INSERT INTO points VALUES (7, 2, -34.92030520, -57.96064140);
INSERT INTO points VALUES (8, 2, -34.91942560, -57.95966400);
INSERT INTO points VALUES (9, 2, -34.91717750, -57.96243580);


--
-- Name: points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('points_id_seq', 9, true);


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sections VALUES (1, 1, '#232323');
INSERT INTO sections VALUES (2, 2, '#ffae00');


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sections_id_seq', 2, true);


--
-- Name: drawgins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY drawings
    ADD CONSTRAINT drawgins_pkey PRIMARY KEY (id);


--
-- Name: points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: points_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY points
    ADD CONSTRAINT points_section_id_fkey FOREIGN KEY (section_id) REFERENCES sections(id) ON DELETE CASCADE;


--
-- Name: sections_drawing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_drawing_id_fkey FOREIGN KEY (drawing_id) REFERENCES drawings(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

