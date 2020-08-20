--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-08-20 20:01:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE aria;
--
-- TOC entry 2863 (class 1262 OID 642500)
-- Name: aria; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE aria WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


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
-- TOC entry 204 (class 1259 OID 692172)
-- Name: foods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.foods_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


SET default_with_oids = false;

--
-- TOC entry 203 (class 1259 OID 692157)
-- Name: foods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.foods (
    id integer DEFAULT nextval('public.foods_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    measure_id integer,
    qtd double precision,
    cho double precision,
    kcal double precision,
    measure character varying(255),
    CONSTRAINT teste CHECK ((measure_id = id))
);


--
-- TOC entry 206 (class 1259 OID 692207)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 205 (class 1259 OID 692179)
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id integer DEFAULT nextval('public.items_id_seq'::regclass) NOT NULL,
    meal_id integer,
    quantidade_medida_usual double precision,
    quantidade_g_ml double precision,
    cho double precision,
    kcal double precision,
    food_id integer
);


--
-- TOC entry 199 (class 1259 OID 692123)
-- Name: meal_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meal_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 200 (class 1259 OID 692132)
-- Name: meal_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meal_types (
    id integer DEFAULT nextval('public.meal_type_id_seq'::regclass) NOT NULL,
    name character varying(20) NOT NULL,
    start_at time without time zone,
    end_at time without time zone
);


--
-- TOC entry 197 (class 1259 OID 642683)
-- Name: meals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meals (
    id integer NOT NULL,
    meal_type_id integer,
    bolus double precision,
    start_at time without time zone,
    end_at time without time zone,
    date date
);


--
-- TOC entry 196 (class 1259 OID 642681)
-- Name: meals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 196
-- Name: meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meals_id_seq OWNED BY public.meals.id;


--
-- TOC entry 202 (class 1259 OID 692143)
-- Name: measures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 201 (class 1259 OID 692138)
-- Name: measures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.measures (
    id integer DEFAULT nextval('public.measures_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 692112)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    "Id" integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255)
);


--
-- TOC entry 2715 (class 2604 OID 642686)
-- Name: meals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meals ALTER COLUMN id SET DEFAULT nextval('public.meals_id_seq'::regclass);


--
-- TOC entry 2732 (class 2606 OID 692183)
-- Name: items Items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "Items_pkey" PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 692162)
-- Name: foods foods_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foods_pk PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 692185)
-- Name: meal_types meal_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meal_types
    ADD CONSTRAINT meal_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 642688)
-- Name: meals meals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT meals_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 692142)
-- Name: measures measures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.measures
    ADD CONSTRAINT measures_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 692119)
-- Name: users pk_Id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "pk_Id" PRIMARY KEY ("Id");


--
-- TOC entry 2733 (class 2606 OID 692186)
-- Name: meals fk_meal_types; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT fk_meal_types FOREIGN KEY (meal_type_id) REFERENCES public.meal_types(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2736 (class 2606 OID 692201)
-- Name: items foods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT foods_fkey FOREIGN KEY (food_id) REFERENCES public.foods(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2735 (class 2606 OID 692191)
-- Name: items meals_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT meals_fkey FOREIGN KEY (meal_id) REFERENCES public.meals(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2734 (class 2606 OID 692163)
-- Name: foods measure_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT measure_id FOREIGN KEY (measure_id) REFERENCES public.measures(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2020-08-20 20:01:54

--
-- PostgreSQL database dump complete
--

