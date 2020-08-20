--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-08-20 19:35:26

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
-- TOC entry 2833 (class 0 OID 692132)
-- Dependencies: 200
-- Data for Name: meal_types; Type: TABLE DATA; Schema: public; Owner: vindixit
--

INSERT INTO public.meal_types VALUES (1, 'Café da Manhã', '06:00:00', '09:00:00');
INSERT INTO public.meal_types VALUES (2, 'Almoço', '11:30:00', '14:00:00');
INSERT INTO public.meal_types VALUES (3, 'Jantar', '17:00:00', '19:00:00');
INSERT INTO public.meal_types VALUES (4, 'Lanche da Manhã', '09:00:00', '11:30:00');
INSERT INTO public.meal_types VALUES (5, 'Lanche da Tarde', '14:00:00', '17:00:00');
INSERT INTO public.meal_types VALUES (6, 'Ceia', '19:00:00', '21:00:00');
INSERT INTO public.meal_types VALUES (7, 'Lanche Noturno', '21:00:00', '06:00:00');


-- Completed on 2020-08-20 19:35:26

--
-- PostgreSQL database dump complete
--

