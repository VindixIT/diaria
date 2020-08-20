--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-08-20 19:37:47

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
-- TOC entry 2841 (class 1262 OID 642500)
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
-- TOC entry 2835 (class 0 OID 642683)
-- Dependencies: 197
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: vindixit
--

INSERT INTO public.meals VALUES (16, 1, 0, '07:15:00', NULL, '2020-08-18');
INSERT INTO public.meals VALUES (17, 7, 0, '21:37:00', NULL, '2020-08-19');
INSERT INTO public.meals VALUES (14, 1, 0, '07:03:00', NULL, '2020-08-18');
INSERT INTO public.meals VALUES (10, 2, 0, '13:32:00', NULL, '2020-08-17');
INSERT INTO public.meals VALUES (15, 1, 0, '07:08:00', NULL, '2020-08-18');


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 196
-- Name: meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vindixit
--

SELECT pg_catalog.setval('public.meals_id_seq', 17, true);


-- Completed on 2020-08-20 19:37:47

--
-- PostgreSQL database dump complete
--

