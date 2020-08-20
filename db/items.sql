--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-08-20 19:38:33

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
-- TOC entry 2835 (class 0 OID 692179)
-- Dependencies: 205
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.items VALUES (25, 10, 0, 12, 0.800000000000000044, 21.0700000000000003, 1);
INSERT INTO public.items VALUES (28, 15, 0, 0, 0, 32, 15);
INSERT INTO public.items VALUES (29, 14, 0, 43, 4.29999999999999982, 19.3500000000000014, 112);
INSERT INTO public.items VALUES (30, 14, 0, 0, 32, 22.8599999999999994, 49);
INSERT INTO public.items VALUES (32, 15, 0, 22, 0, 3.29999999999999982, 12);
INSERT INTO public.items VALUES (33, 15, 0, 321, 67.4099999999999966, 353.100000000000023, 17);
INSERT INTO public.items VALUES (38, 16, 0, 200, 26.6700000000000017, 117.329999999999998, 2);
INSERT INTO public.items VALUES (41, 16, 0, 111, 7.40000000000000036, 194.870000000000005, 1);
INSERT INTO public.items VALUES (42, 17, 0, 0, 12, 1.33000000000000007, 9);


-- Completed on 2020-08-20 19:38:33

--
-- PostgreSQL database dump complete
--

