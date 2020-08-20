--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-08-20 19:36:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2839 (class 1262 OID 642500)
-- Name: aria; Type: DATABASE; Schema: -; Owner: vindixit
--

CREATE DATABASE aria WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE aria OWNER TO vindixit;

\connect aria

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2833 (class 0 OID 692138)
-- Dependencies: 201
-- Data for Name: measures; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.measures VALUES (2, 'colher de sopa cheia');
INSERT INTO public.measures VALUES (3, 'colher de chá');


-- Completed on 2020-08-20 19:36:06

--
-- PostgreSQL database dump complete
--

