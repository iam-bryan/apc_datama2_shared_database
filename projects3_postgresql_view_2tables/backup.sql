--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10

-- Started on 2019-12-05 08:48:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16759)
-- Name: skim; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA skim;


ALTER SCHEMA skim OWNER TO datama2mi181;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 250 (class 1259 OID 16989)
-- Name: _course; Type: TABLE; Schema: skim; Owner: datama2mi181
--

CREATE TABLE skim._course (
    id integer NOT NULL,
    course_name character varying(7) DEFAULT NULL::character varying,
    course_type character varying(13) DEFAULT NULL::character varying,
    course_time character varying(19) DEFAULT NULL::character varying,
    _professional_id smallint,
    _student_id smallint
);


ALTER TABLE skim._course OWNER TO datama2mi181;

--
-- TOC entry 251 (class 1259 OID 16995)
-- Name: _course_id_seq; Type: SEQUENCE; Schema: skim; Owner: datama2mi181
--

CREATE SEQUENCE skim._course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skim._course_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 251
-- Name: _course_id_seq; Type: SEQUENCE OWNED BY; Schema: skim; Owner: datama2mi181
--

ALTER SEQUENCE skim._course_id_seq OWNED BY skim._course.id;


--
-- TOC entry 252 (class 1259 OID 16997)
-- Name: _professional1; Type: TABLE; Schema: skim; Owner: datama2mi181
--

CREATE TABLE skim._professional1 (
    id integer NOT NULL,
    prof_fname character varying(7) DEFAULT NULL::character varying,
    prof_lname character varying(8) DEFAULT NULL::character varying,
    prof_address character varying(13) DEFAULT NULL::character varying,
    prof_email character varying(22) DEFAULT NULL::character varying,
    prof_date_of_hire character varying(10) DEFAULT NULL::character varying,
    prof_phone_number bigint,
    prof_type character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE skim._professional1 OWNER TO datama2mi181;

--
-- TOC entry 253 (class 1259 OID 17006)
-- Name: _professional1_id_seq; Type: SEQUENCE; Schema: skim; Owner: datama2mi181
--

CREATE SEQUENCE skim._professional1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skim._professional1_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 253
-- Name: _professional1_id_seq; Type: SEQUENCE OWNED BY; Schema: skim; Owner: datama2mi181
--

ALTER SEQUENCE skim._professional1_id_seq OWNED BY skim._professional1.id;


--
-- TOC entry 254 (class 1259 OID 17008)
-- Name: _student; Type: TABLE; Schema: skim; Owner: datama2mi181
--

CREATE TABLE skim._student (
    id integer NOT NULL,
    student_fname character varying(6) DEFAULT NULL::character varying,
    student_lname character varying(7) DEFAULT NULL::character varying,
    student_date_of_birth character varying(10) DEFAULT NULL::character varying,
    student_address character varying(14) DEFAULT NULL::character varying,
    student_email character varying(20) DEFAULT NULL::character varying,
    student_phone_number bigint
);


ALTER TABLE skim._student OWNER TO datama2mi181;

--
-- TOC entry 255 (class 1259 OID 17016)
-- Name: _student_id_seq; Type: SEQUENCE; Schema: skim; Owner: datama2mi181
--

CREATE SEQUENCE skim._student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skim._student_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 255
-- Name: _student_id_seq; Type: SEQUENCE OWNED BY; Schema: skim; Owner: datama2mi181
--

ALTER SEQUENCE skim._student_id_seq OWNED BY skim._student.id;


--
-- TOC entry 384 (class 1259 OID 24821)
-- Name: outline; Type: VIEW; Schema: skim; Owner: datama2mi181
--

CREATE VIEW skim.outline AS
 SELECT _professional1.prof_fname,
    _professional1.prof_lname,
    _course.course_name,
    _course.course_time,
    _course.course_type
   FROM (skim._course
     JOIN skim._professional1 ON ((_course._professional_id = _professional1.id)));


ALTER TABLE skim.outline OWNER TO datama2mi181;

--
-- TOC entry 3272 (class 2604 OID 17022)
-- Name: _course id; Type: DEFAULT; Schema: skim; Owner: datama2mi181
--

ALTER TABLE ONLY skim._course ALTER COLUMN id SET DEFAULT nextval('skim._course_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 17023)
-- Name: _professional1 id; Type: DEFAULT; Schema: skim; Owner: datama2mi181
--

ALTER TABLE ONLY skim._professional1 ALTER COLUMN id SET DEFAULT nextval('skim._professional1_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 17024)
-- Name: _student id; Type: DEFAULT; Schema: skim; Owner: datama2mi181
--

ALTER TABLE ONLY skim._student ALTER COLUMN id SET DEFAULT nextval('skim._student_id_seq'::regclass);


--
-- TOC entry 3433 (class 0 OID 16989)
-- Dependencies: 250
-- Data for Name: _course; Type: TABLE DATA; Schema: skim; Owner: datama2mi181
--

INSERT INTO skim._course VALUES (1, 'MATH', 'GENERAL', '2018-10-30 18:00:00', 1, 1);
INSERT INTO skim._course VALUES (2, 'SCIENCE', 'STEM', '2018-10-18 12:00:00', 2, 2);
INSERT INTO skim._course VALUES (3, 'ARTS', 'CREATIVE ARTS', '2018-02-17 14:30:00', 3, 3);


--
-- TOC entry 3435 (class 0 OID 16997)
-- Dependencies: 252
-- Data for Name: _professional1; Type: TABLE DATA; Schema: skim; Owner: datama2mi181
--

INSERT INTO skim._professional1 VALUES (1, 'Jackson', 'Huge', '123 ABC', 'jhuge@gmail.com', '2018-10-28', 9174865237, 'DEAN');
INSERT INTO skim._professional1 VALUES (2, 'Hugo', 'Jackman', '123 CDE', 'hugojack@gmail.com', '2016-05-18', 97686317, 'ASST.PROF');
INSERT INTO skim._professional1 VALUES (3, 'Jackson', 'Michigan', 'Rosevelt 123', 'michijackson@gmail.com', '2014-03-03', 9176863187, 'PARTTIMER');


--
-- TOC entry 3437 (class 0 OID 17008)
-- Dependencies: 254
-- Data for Name: _student; Type: TABLE DATA; Schema: skim; Owner: datama2mi181
--

INSERT INTO skim._student VALUES (1, 'Adam', 'Rogers', '1965', 'DEF 13 Street', 'adamrogers@gmail.com', 9178657948);
INSERT INTO skim._student VALUES (2, 'Scout', 'Antonio', '1971', 'ABD 12 Avenue', 'roro@gmail.com', 9279557785);
INSERT INTO skim._student VALUES (3, 'Jeremy', 'Tan', '1975', 'Abra Street', 'jeretan@gmail.com', 9479557201);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 251
-- Name: _course_id_seq; Type: SEQUENCE SET; Schema: skim; Owner: datama2mi181
--

SELECT pg_catalog.setval('skim._course_id_seq', 6, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 253
-- Name: _professional1_id_seq; Type: SEQUENCE SET; Schema: skim; Owner: datama2mi181
--

SELECT pg_catalog.setval('skim._professional1_id_seq', 6, true);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 255
-- Name: _student_id_seq; Type: SEQUENCE SET; Schema: skim; Owner: datama2mi181
--

SELECT pg_catalog.setval('skim._student_id_seq', 9, true);


--
-- TOC entry 3287 (class 2606 OID 25046)
-- Name: _professional1 professional_unique; Type: CONSTRAINT; Schema: skim; Owner: datama2mi181
--

ALTER TABLE ONLY skim._professional1
    ADD CONSTRAINT professional_unique UNIQUE (id);


--
-- TOC entry 3289 (class 2606 OID 25034)
-- Name: _student student_unique; Type: CONSTRAINT; Schema: skim; Owner: datama2mi181
--

ALTER TABLE ONLY skim._student
    ADD CONSTRAINT student_unique UNIQUE (id);


--
-- TOC entry 3291 (class 2606 OID 25066)
-- Name: _course course_professional_id_fkey; Type: FK CONSTRAINT; Schema: skim; Owner: datama2mi181
--

ALTER TABLE ONLY skim._course
    ADD CONSTRAINT course_professional_id_fkey FOREIGN KEY (_professional_id) REFERENCES skim._professional1(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3290 (class 2606 OID 25035)
-- Name: _course course_student_id_fkey; Type: FK CONSTRAINT; Schema: skim; Owner: datama2mi181
--

ALTER TABLE ONLY skim._course
    ADD CONSTRAINT course_student_id_fkey FOREIGN KEY (_student_id) REFERENCES skim._student(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2019-12-05 08:48:51

--
-- PostgreSQL database dump complete
--

