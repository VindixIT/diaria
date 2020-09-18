--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-09-18 15:03:51

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
-- Name: foods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foods_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foods_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 203 (class 1259 OID 692157)
-- Name: foods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foods (
    id integer DEFAULT nextval('public.foods_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    measure_id integer,
    qtd double precision,
    cho double precision,
    kcal double precision,
    measure character varying(255)
);


ALTER TABLE public.foods OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 692207)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 692179)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 692123)
-- Name: meal_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meal_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_type_id_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 692132)
-- Name: meal_types; Type: TABLE; Schema: public; Owner: vindixit
--

CREATE TABLE public.meal_types (
    id integer DEFAULT nextval('public.meal_type_id_seq'::regclass) NOT NULL,
    name character varying(20) NOT NULL,
    start_at time without time zone,
    end_at time without time zone
);


ALTER TABLE public.meal_types OWNER TO vindixit;

--
-- TOC entry 197 (class 1259 OID 642683)
-- Name: meals; Type: TABLE; Schema: public; Owner: vindixit
--

CREATE TABLE public.meals (
    id integer NOT NULL,
    meal_type_id integer,
    bolus double precision,
    start_at time without time zone,
    end_at time without time zone,
    date date
);


ALTER TABLE public.meals OWNER TO vindixit;

--
-- TOC entry 196 (class 1259 OID 642681)
-- Name: meals_id_seq; Type: SEQUENCE; Schema: public; Owner: vindixit
--

CREATE SEQUENCE public.meals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meals_id_seq OWNER TO vindixit;

--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 196
-- Name: meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vindixit
--

ALTER SEQUENCE public.meals_id_seq OWNED BY public.meals.id;


--
-- TOC entry 202 (class 1259 OID 692143)
-- Name: measures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measures_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 692138)
-- Name: measures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measures (
    id integer DEFAULT nextval('public.measures_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.measures OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 692112)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2715 (class 2604 OID 642686)
-- Name: meals id; Type: DEFAULT; Schema: public; Owner: vindixit
--

ALTER TABLE ONLY public.meals ALTER COLUMN id SET DEFAULT nextval('public.meals_id_seq'::regclass);


--
-- TOC entry 2863 (class 0 OID 692157)
-- Dependencies: 203
-- Data for Name: foods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (6, 'Abaráv', 155, 170, 24, 414, 'unidade média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (291, 'Castanha de caju ', 19, 3, 1, 13, '01 unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (293, 'Castanha do pará', 19, 6, 1, 42, '01 unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (390, 'Coração de frango', 19, 5, 0, 7, '01 unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (791, 'Nozes', 19, 5, 1, 35, '01 unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (903, 'Pinhão', 19, 10, 5, 25, '01 unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (14, 'Abobrinha, italiana, cozida ', 78, 20, 0, 3, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (15, 'Abobrinha, italiana, crua ', 78, 20, 1, 4, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (16, 'Abobrinha, paulista, crua', 78, 20, 2, 6, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (37, 'Alcachofra', 120, 20, 1, 6, 'pedaco médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (50, 'Alho-poró cru', 130, 20, 3, 11, 'porcao pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (54, 'Ameixa preta fresca', 155, 42, 4, 18, 'unidade media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (59, 'Amendoim, torrado, salgado', 45, 34, 5, 194, '2 colheres de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (71, 'Bananada', 155, 40, 27, 115, 'unidade media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (80, 'Batata doce frita', 101, 65, 39, 249, 'fatia media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (2, 'Abacaxi', 101, 75, 10, 44, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (3, 'Abacaxi em calda', 101, 64, 19, 78, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (7, 'Abiu cru', 157, 100, 15, 62, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (8, 'Abobora cabotian, cozida', 78, 36, 3, 14, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (26, 'Acerola', 157, 12, 1, 4, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (109, 'Beiju de queijo com manteiga', 155, 150, 87, 518, 'unidade média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (89, 'Batata fritas (Mc Donalds®)', 127, 0, 49, 412, 'porção grande ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (107, 'Beiju', 155, 100, 87, 359, 'unidade media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (94, 'Batata smiles Mccain®', 22, 21, 7, 42, '01 unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (112, 'Bem casado', 22, 40, 25, 160, '01 unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (117, 'Beterraba crua', 79, 16, 1, 7, 'colher de sopa cheia ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (127, 'Big tasty (Mc Donalds®)', 157, 0, 43, 841, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (178, 'Bolinho de estudante (Bolinho Ana Maria®)', 155, 80, 49, 292, 'unidade média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (183, 'Bolo de aipim com coco', 101, 80, 37, 243, 'fatia media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (174, 'Bolinho de bacalhau', 155, 15, 3, 42, 'unidade media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (189, 'Bolo de casamento', 10, 75, 42, 285, '01 fatia pequena ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (222, 'Brigadeiro', 19, 30, 16, 103, '01 unidade médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (203, 'Bolo Merengue', 103, 50, 11, 116, 'fatia peqquena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (231, 'Café infusão 10%', 159, 50, 1, 4, 'xicara de café ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (236, 'Cajá-umbu', 155, 22, 2, 10, 'unidade media ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (307, 'Cereal de arroz e milho Nestlé®', 78, 7, 6, 27, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (309, 'Cereal infantil 3 frutas Nestlé®', 78, 7, 6, 27, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (267, 'Carne assada', 120, 90, 0, 259, 'pedaco medio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (297, 'CBO (McDonalds®)', 157, 0, 56, 665, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (316, 'Cereja fresca', 157, 4, 1, 4, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (300, 'Cenoura cozida', 76, 25, 2, 8, 'colher de sopa cheia ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (328, 'Charutinho de folha de uva', 132, 100, 3, 99, 'porcao');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (329, 'Charutinho de repolho', 132, 100, 2, 67, 'porcao');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (249, 'Camarão frito', 78, 20, 0, 37, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (263, 'Caqui', 155, 110, 22, 95, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (408, 'Croissant de queijo', 155, 80, 32, 388, 'unidade média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (332, 'Cheddar McMelt (Mc Donalds®)', 157, 0, 29, 481, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (336, 'Cheeseburguer (Mc Donalds®)', 157, 0, 30, 295, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (342, 'Chicken bacon crispy McWrap (Mc Donalds®)', 157, 249, 54, 565, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (343, 'Chicken bacon grilled McWrap (Mc Donalds®)', 157, 235, 32, 440, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (344, 'Chicken classic crispy Sandwich (Mc Donalds®)', 157, 0, 55, 510, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (345, 'Chicken Junior Sandwich (Mc Donalds®)', 157, 0, 38, 380, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (373, 'Ciriguela', 157, 20, 4, 15, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (383, 'Colomba Pascal gotas de chocolate (Bauducco®)', 104, 80, 40, 350, 'fatia ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (407, 'Croissant de chocolate', 156, 57, 24, 237, 'unidade pequena ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (439, 'Docinhos variados (média)', 19, 30, 16, 125, '01 unidade média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (418, 'Damasco, geléia de', 78, 20, 13, 52, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (470, 'Falafel (bolinho de grão de bico)', 132, 100, 20, 155, 'porção ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (562, 'Hamburguer (Mc Donalds®)', 157, 0, 29, 245, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (566, 'Hamburguer simples ', 157, 0, 29, 245, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (554, 'Graviola', 132, 100, 16, 62, 'porção ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (505, 'File ao molho madeira', 18, 180, 12, 227, '01 unidade pequena ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (494, 'Feijoada caseira', 83, 225, 24, 346, 'concha média cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (622, 'Leite condensado', 78, 15, 8, 49, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (623, 'Leite condensado desnatado', 78, 15, 9, 42, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (654, 'Macadâmica natural ', 78, 15, 3, 97, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (619, 'Laranja lima', 155, 90, 10, 41, 'unidade media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (627, 'Leite de soja Ades®', 93, 200, 8, 82, 'copo ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (653, 'Maçã, suco de', 93, 200, 22, 97, 'copo ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (685, 'McChicken (Mc Donalds®)', 157, 177, 40, 424, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (686, 'McColosso caramelo (Mc Donalds®)', 157, 142, 52, 291, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (687, 'McColosso chocolate  (Mc Donalds®)', 157, 137, 47, 274, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (688, 'McFish (Mc Donalds®)', 157, 151, 37, 362, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (689, 'McFlurry ovomaltine (Mc Donalds®)', 157, 200, 68, 425, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (690, 'McNíco (Mc Donalds®)', 157, 282, 37, 600, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (707, 'Milk shake clássico de chocolate (Bobs®)', 91, 700, 177, 846, 'copo grande ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (708, 'Milk shake clássico de morango (Bobs®)', 91, 700, 136, 734, 'copo grande ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (709, 'Milk shake crocante de ovomaltine (Bobs®)', 91, 700, 157, 852, 'copo grande ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (671, 'Manjar', 101, 90, 36, 255, 'fatia media');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (703, 'Michui de frango', 132, 100, 1, 132, ' porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (661, 'Maizena', 76, 20, 17, 70, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (762, 'Molho tártaro gourmet', 78, 20, 1, 105, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (798, 'Omelete', 148, 65, 2, 110, 'um ovo ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (746, 'Molho de iogurte', 5, 15, 2, 12, '01 colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (745, 'Molho de alho calve', 76, 15, 2, 55, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (830, 'Pão de cachorro-quente', 157, 58, 31, 170, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (840, 'Pão de milho com 50% de farinha de trigo', 157, 70, 42, 204, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (841, 'Pão de milho de forma Panco®', 157, 32, 19, 96, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (842, 'Pão de milho industrializado', 157, 70, 43, 201, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (843, 'Pão de passas', 157, 50, 26, 136, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (847, 'Pão doce', 157, 50, 28, 134, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (848, 'Pão francês', 157, 50, 28, 135, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (881, 'Peixe grelhado', 28, 100, 0, 180, '1 posta ou lé');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (904, 'Pipoca doce', 141, 20, 20, 95, 'saco medio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (865, 'Patê de Foie Gras, enlatado, defumado', 3, 8, 0, 22, '01 colher de cha cheia ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (844, 'Pão de queijo', 156, 20, 9, 87, 'unidade pequena ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (826, 'Pão careca doce', 157, 50, 28, 134, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (827, 'Pão colonial italiano', 99, 50, 27, 128, 'fatia grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (972, 'Quarteirão (Mc Donalds®)', 157, 0, 35, 533, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (950, 'Polpetone a parmeggiana', 22, 150, 12, 280, '01 unidade  ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (908, 'Pirão de farinha de mandioca', 76, 30, 9, 36, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1043, 'Salgadinho de soja Jasmine®', 78, 20, 4, 98, ' colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (994, 'Quindim', 155, 35, 15, 111, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1094, 'Sopa caldo verde', 84, 130, 7, 80, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1095, 'Sopa de cebola (creme)', 84, 130, 6, 58, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1096, 'Sopa de cogumelo (creme)', 84, 130, 12, 139, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1097, 'Sopa de creme de ervilha enlatada', 84, 130, 27, 152, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1098, 'Sopa de ervilha', 84, 130, 26, 165, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1099, 'Sopa de espinafre (creme)', 84, 130, 5, 110, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1100, 'Sopa de feijão branco', 84, 130, 18, 126, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1101, 'Sopa de frango', 84, 130, 3, 46, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1102, 'Sopa de legumes com carne', 84, 130, 8, 100, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1103, 'Sopa de lentilhas enlatada', 84, 130, 16, 108, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1104, 'Sopa de macarrão', 84, 130, 19, 132, 'concha média ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1113, 'Sorvete de casquinha baunilha (McDonalds®)', 157, 0, 32, 192, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1114, 'Sorvete de casquinha chocolate (McDonalds®)', 157, 0, 31, 192, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1115, 'Sorvete de casquinha mista (McDonalds®)', 157, 0, 31, 192, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1090, 'Shitake frito', 5, 10, 7, 50, '01 colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1220, 'Tremoço em conserva', 78, 20, 3, 24, 'colher de sopa ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1198, 'Tender', 9, 100, 0, 146, '01 fatia na');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1214, 'Torta de limão', 103, 90, 34, 217, 'fatia pequena ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1211, 'Torta de banana (Mc Donalds®)', 157, 0, 34, 228, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1203, 'Top sundae caramelo (Mc Donalds®)', 157, 0, 77, 508, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1204, 'Top sundae chocolate (Mc Donalds®)', 157, 0, 65, 475, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1205, 'Top sundae morango (Mc Donalds®)', 157, 0, 73, 478, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1215, 'Torta de maçã (Mc Donalds®)', 157, 0, 26, 198, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1208, 'Torradas aperitivo', 22, 2, 1, 7, '01 unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1168, 'Sundae caramelo (McDonalds®)', 157, 0, 51, 323, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1170, 'Sundae chocolate (McDonalds®)', 157, 0, 40, 290, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1171, 'Sundae morango (McDonalds®)', 157, 0, 47, 292, 'unidade ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1151, 'Suco de laranja Del Valle®', 91, 300, 29, 116, 'copo grande ');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1245, 'Vinho quente', 7, 150, 24, 98, '01 copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (9, 'Abobora Cabotian, crua', 78, 36, 4, 17, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (10, 'Abóbora dágua (picada)', 76, 36, 0, 10, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (11, 'Abóbora doce (picada)', 76, 36, 4, 18, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (12, 'Abóbora moranga (picada)', 76, 36, 1, 7, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (13, 'Abobrinha recheada', 157, 100, 6, 89, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (17, 'Abricó-do-pará', 101, 100, 13, 64, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (19, 'Açai natural Frooty ®', 57, 60, 13, 62, '6 colheres de sopa rasas');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (20, 'Açaí (polpa)  com xarope de guarana e glicose', 145, 100, 21, 110, 'taça pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (22, 'Açaí, suco de', 89, 240, 72, 438, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (23, 'Acarajé', 155, 100, 22, 282, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (24, 'Acelga (picada)', 76, 6, 0, 2, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (25, 'Acém magro cozido', 120, 100, 0, 215, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (27, 'Achocolatado Diet Gold ®', 78, 9, 6, 35, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (28, 'Achocolatado Diet Linea ®', 78, 12, 5, 30, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (29, 'Açúcar branco renado', 76, 30, 30, 116, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (30, 'Açúcar cristal', 76, 24, 24, 96, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (31, 'Açúcar mascavo', 76, 19, 17, 70, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (32, 'Agrião (picado)', 76, 7, 0, 2, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (33, 'Agriao refogado', 76, 25, 1, 19, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (34, 'Água-de-coco verde', 90, 240, 10, 43, 'copo duplo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (35, 'Aipim cozido', 120, 100, 29, 120, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (36, 'Aipo inteiro (picado)', 76, 10, 0, 2, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (501, 'Figo', 155, 55, 8, 38, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (53, 'Ameixa em calda', 19, 7, 5, 20, '01 unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (55, 'Amêndoa', 19, 3, 1, 13, '01 unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (38, 'Alcaparra', 76, 27, 1, 10, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (39, 'Alface, americana, crua', 105, 10, 0, 1, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (40, 'Alface, crespa, crua', 105, 10, 0, 1, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (41, 'Alface, lisa, crua', 105, 10, 0, 1, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (42, 'Alface, lisa, crua', 105, 10, 0, 1, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (43, 'Alface, roxa, crua', 105, 10, 0, 1, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (44, 'Alface, roxa, crua', 105, 10, 0, 1, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (45, 'Alfajor  ao leite Cacau Show®', 157, 40, 23, 120, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (46, 'Alfajor® recheado com doce de leite', 157, 25, 15, 98, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (47, 'Alfavaca crua', 105, 10, 0, 3, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (48, 'Algodão Doce', 157, 30, 30, 116, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (49, 'Alho, cru', 46, 10, 3, 11, '2 dentes');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (51, 'Ambrosia', 44, 80, 33, 207, '2 colheres de sopa cheias');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (52, 'Ameixa de queijo', 157, 12, 7, 36, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (56, 'Amendoim caramelizado', 115, 20, 14, 95, 'pacote pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (57, 'Amendoim cozido', 45, 34, 7, 108, '2 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (58, 'Amendoim, grão, cru', 45, 34, 5, 194, '2 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (60, 'Amido de arroz', 76, 20, 17, 70, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (61, 'Amido de milho', 76, 20, 17, 69, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (62, 'Amora (branca, preta e vermelha)', 155, 8, 1, 5, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (63, 'Amora, geléia de', 76, 40, 23, 93, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (64, 'Amora (branca, preta e vermelha)', 155, 8, 1, 5, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (65, 'Bala Toe® Chocolate', 157, 6, 22, 151, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (66, 'Banana pacova madura cozida sem casca', 76, 35, 12, 48, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (67, 'Banana pacova madura frita (picada)', 76, 35, 18, 96, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (68, 'Banana pacova madura in natura (picada)', 76, 30, 11, 45, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (69, 'Banana pacova verde frita', 76, 35, 30, 138, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (70, 'Banana-caturra ou Nanica', 155, 86, 20, 79, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (72, 'Banana-da-terra crua', 153, 100, 27, 117, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (73, 'Banana-maçã', 155, 65, 15, 72, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (74, 'Banana-ouro', 156, 40, 9, 42, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (75, 'Banana-prata crua', 155, 50, 13, 49, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (76, 'Banha de porco', 76, 10, 0, 90, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (77, 'Barra de Cereal Diet Linea® Avela, Castanha e Chocolate', 157, 25, 17, 75, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (78, 'Barra de cereal Diet Linea® banana com aveia', 157, 25, 18, 65, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (79, 'Batata (Baked Potato®)', 157, 470, 83, 369, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (81, 'Batata frita  (Bobs®)', 127, 115, 41, 259, 'porção grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (82, 'Batata frita  (Bobs®)', 128, 95, 34, 214, 'porção média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (83, 'Batata frita  (Bobs®)', 130, 55, 20, 124, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (84, 'Batata frita (Burguer King®)', 132, 0, 37, 318, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (85, 'Batata frita (Habibs®)', 130, 40, 10, 86, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (86, 'Batata frita chips ', 137, 13, 6, 70, 'punhado');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (87, 'Batata fritas  (Mc Donalds®)', 130, 0, 25, 206, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (88, 'Batata fritas (Mc Donalds®)', 128, 0, 35, 288, 'porção média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (90, 'Batata fritas McFritas Kids (Mc Donalds®)', 132, 0, 11, 87, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (91, 'Batata inglesa cozida', 74, 80, 6, 68, 'colher de sopa cheia picada');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (92, 'Batata inglesa fritta®', 97, 65, 23, 182, 'escumadeira media cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (93, 'Batata inglesa Saute®', 76, 25, 4, 37, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (95, 'Batata, amido de', 76, 16, 13, 53, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (96, 'Batata, fécula de', 76, 20, 16, 66, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (97, 'Batata-baroa ou mandioquinha (picada)', 76, 35, 10, 44, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (98, 'Batata-doce amarela assada (picada)', 76, 30, 10, 43, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (99, 'Batata-doce branca cozida (picada)', 76, 30, 8, 38, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (100, 'Batata-doce cozida', 81, 42, 10, 43, 'colher sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (101, 'Batata-doce, doce de', 76, 40, 24, 94, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (102, 'Baton (chocolate ao leite Garoto®)', 157, 16, 9, 86, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (103, 'Beijinho', 155, 25, 11, 105, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (104, 'Beijinho', 156, 6, 3, 25, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (105, 'Beijinho diet', 156, 6, 2, 20, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (106, 'Beijinho-de-coco Nestle®', 78, 20, 11, 63, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (108, 'Beiju com Coco', 153, 125, 77, 622, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (110, 'Beirute Habibs®', 157, 415, 51, 714, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (111, 'Bekleua', 27, 100, 20, 290, '1 porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (113, 'Bergamota ou Mexerica', 153, 100, 15, 58, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (114, 'Berinjela cozida sem sal', 76, 25, 2, 8, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (115, 'Berinjela frita', 139, 13, 1, 10, 'rodela média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (116, 'Beterraba cozida (picada)', 76, 20, 2, 9, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (118, 'Bibs dog  (Habibs®)', 157, 105, 21, 246, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (119, 'Bibs salad (Habibs®)', 157, 300, 36, 209, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (120, 'Bife à milanesa', 156, 80, 8, 230, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (121, 'Bife de boi', 155, 100, 0, 228, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (122, 'Bife de fígado ', 155, 100, 6, 216, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (123, 'Bife Role', 153, 150, 4, 268, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (124, 'Big Bob picanha 100g (Bobs®)', 157, 235, 35, 513, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (125, 'Big Bob picanha 200g (Bobs®)', 157, 344, 38, 728, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (126, 'Big king  (Burguer King®)', 157, 0, 31, 555, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (128, 'Biscoito de água e sal ', 157, 8, 5, 34, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (129, 'Biscoito de aveia e mel Nestle®', 157, 6, 4, 26, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (130, 'Biscoito de polvilho (rosquinha)', 157, 3, 2, 13, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (131, 'Biscoito de queijo', 157, 12, 6, 51, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (132, 'Biscoito leite Nestlé®', 157, 8, 5, 38, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (133, 'Biscoito maisena Nestlé®', 157, 5, 4, 22, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (134, 'Biscoito maria Nestlé®', 157, 6, 4, 26, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (135, 'Biscoito milho verde Nestlé®', 157, 6, 4, 27, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (136, 'Biscoito passatempo® sem recheio', 157, 6, 4, 22, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (137, 'Biscoito prestígio recheado São Luiz  Nestlé®', 157, 15, 10, 71, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (138, 'Biscoito prestígio® wafer Nestlé®', 157, 8, 5, 43, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (139, 'Biscoito recheado chocolate', 157, 13, 9, 62, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (140, 'Biscoito salclic aperitivo São Luiz Nestle®', 157, 5, 3, 24, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (141, 'Biscoito salgado integral gergelim Piraquê®', 157, 7.5, 5, 38, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (142, 'Biscoito suíço creme de avelã São Luiz  Nestlé®', 157, 13, 7, 73, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (143, 'Biscoito tipo cookies Baunilha Toddy®', 157, 10, 6, 46, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (144, 'Biscoito tostines cream cracker São Luiz Nestlé®', 157, 8, 5, 37, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (145, 'Biscoito tostines® leite ', 157, 8, 6, 37, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (146, 'Biscoito tostines® recheado Chocolate', 157, 13, 9, 64, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (147, 'Biscoito tostines® surpresa fun', 157, 8, 6, 37, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (148, 'Biscoito tostines® wafer chocolate', 157, 8, 5, 42, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (149, 'Biscoitos de farinha integral', 157, 10, 7, 40, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (150, 'Biscoitos de glúten a 40%', 157, 10, 3, 29, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (151, 'Biscoitos de glúten puro', 157, 10, 8, 35, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (152, 'Bisnaguinha Seven Boys®', 157, 20, 11, 62, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (153, 'BKTM batata suprema (Burguer King®)', 132, 0, 59, 604, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (154, 'BKTM cheddar duplo (Burguer King®)', 157, 0, 54, 660, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (155, 'BKTM chicken crisp (Burguer King®)', 157, 0, 68, 667, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (156, 'BKTM chicken crisp furioso (Burguer King®)', 157, 0, 80, 930, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (157, 'BKTM chicken sandwich (Burguer King®)', 157, 0, 53, 609, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (158, 'BKTM sh (Burguer King®)', 157, 0, 63, 573, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (159, 'BKTM grilled chicken (Burguer King®)', 157, 0, 56, 508, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (160, 'BKTM nuggets (Burguer King®)', 132, 0, 12, 148, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (161, 'BKTM pepperoni (Burguer King®)', 157, 0, 30, 270, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (162, 'BKTM picanha (Burguer King®)', 157, 0, 53, 922, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (163, 'BKTM stacker triplo com bacon (Burguer King®)', 157, 0, 35, 1529, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (164, 'Blis Frutas Vermelhas ', 157, 180, 29, 158, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (165, 'Bliss morango', 157, 200, 31, 168, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (166, 'Bobs crispy (Bobs®)', 157, 251, 48, 641, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (167, 'Bobs picanha gourmet 100g (Bobs®)', 157, 258, 35, 480, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (258, 'Canjica pronta', 76, 25, 5, 29, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (168, 'Bobs picanha gourmet 200g (Bobs®)', 157, 373, 36, 727, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (169, 'Bolacha de nata Panco®', 157, 5, 4, 22, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (170, 'Bolacha sabor mais morango Trakinas®', 157, 12, 8, 61, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (171, 'Bolinha de queijo ', 156, 10, 3, 27, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (172, 'Bolinho de aipim com carne seca', 155, 45, 12, 86, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (173, 'Bolinho de arroz', 157, 40, 20, 164, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (175, 'Bolinho de bacalhau (Habibs®)', 157, 30, 5, 87, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (176, 'Bolinho de carne', 157, 50, 8, 67, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (177, 'Bolinho de chuva ', 156, 30, 13, 81, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (179, 'Bolinho de Presunto e Queijo', 157, 50, 12, 73, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (180, 'Bolinho de soja tipo salsicha 350g (Taamti) - Albee®', 56, 90, 28, 232, '4 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (181, 'Bolo alemão', 104, 60, 30, 227, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (182, 'Bolo branco simples', 101, 100, 55, 318, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (184, 'Bolo de arroz', 101, 70, 39, 197, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (185, 'Bolo de banana', 101, 70, 33, 211, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (186, 'Bolo de batata-doce', 101, 90, 43, 292, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (187, 'Bolo de Brigadeiro', 103, 50, 20, 147, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (188, 'Bolo de brigadeiro (festa) Amor aos Pedaços®', 103, 60, 33, 211, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (190, 'Bolo de cenoura', 101, 60, 38, 227, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (191, 'Bolo de cenoura com chocolate Dr. Otcker®', 101, 60, 38, 227, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (192, 'Bolo de chocolate (recheio/cobertura)', 101, 100, 54, 320, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (193, 'Bolo de Chocolate e Nozes', 103, 50, 17, 175, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (194, 'Bolo de chocolate sem glacê', 101, 60, 34, 306, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (195, 'Bolo de festa (recheio/cobertura)', 101, 100, 54, 320, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (196, 'Bolo de festa diet (recheio/cobertura)', 101, 80, 20, 220, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (197, 'Bolo de fubá', 101, 50, 20, 160, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (198, 'Bolo de limão', 101, 60, 37, 233, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (199, 'Bolo de mandioca (aipim)', 117, 100, 48, 324, 'pedaço grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (200, 'Bolo de milho ', 104, 100, 54, 290, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (201, 'Bolo de nozes ', 101, 50, 28, 200, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (202, 'Bolo Floresta Negra com Morango', 103, 50, 10, 106, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (204, 'Bolo Mousse de Chocolate', 103, 50, 20, 173, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (205, 'Bolo mousse de chocolate Amor aos Pedaços®', 103, 60, 23, 185, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (206, 'Bolo simples', 101, 60, 33, 263, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (207, 'Bombom Alpino', 157, 13, 8, 70, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (208, 'Bombom banana Caribe Garoto®', 157, 17, 12, 65, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (209, 'Bombom bopinho de torrone', 157, 10, 6, 54, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (210, 'Bombom charge Nestlé®', 157, 40, 24, 187, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (211, 'Bombom Copinho de Torrone', 157, 10, 6, 54, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (212, 'Bombom de Brigadeiro', 157, 10, 6, 48, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (213, 'Bombom diet Cacau Show®', 157, 13, 7, 56, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (214, 'Bombom Ferrero Rocher®', 157, 12, 6, 72, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (215, 'Bombom It coco Garoto®', 157, 17, 11, 80, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (216, 'Bombom Ouro Branco®', 157, 22, 13, 117, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (217, 'Bombom prestígio Nestle®', 157, 33, 21, 154, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (218, 'Bombom Sonho de Valsa®', 157, 22, 13, 113, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (219, 'Bombom Trufa de Cereja', 157, 10, 6, 45, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (220, 'Bombom trua de creme de cereja Cacau Show®', 157, 25, 12, 123, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (221, 'Brezel (Pretzel)', 41, 28, 23, 110, '17 unidades pequenos');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (223, 'Brigadeiro de Flocos', 157, 15, 9, 60, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (224, 'Brigadeiro de Morango', 157, 15, 9, 60, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (225, 'Broa de Milho', 157, 50, 25, 128, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (226, 'Brócolis com cottage (Baked Potato®)', 86, 80, 3, 31, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (227, 'Brócolis cozido (picado)', 76, 10, 0, 4, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (228, 'Cacau em pó Mae Terra®', 76, 10, 3, 31, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (229, 'Cachorro-quente (média)', 157, 125, 31, 330, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (230, 'Café com leite sem açúcar', 160, 200, 7, 88, 'xícara de chá cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (232, 'Café solúvel pó', 76, 4, 1, 6, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (233, 'Caipirinha sem açúcar', 93, 200, 54, 436, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (234, 'Cajá manga', 153, 75, 9, 38, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (235, 'Cajá polpa congelada', 132, 100, 12, 46, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (237, 'Cajú', 153, 100, 10, 43, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (238, 'Caju polpa congelada', 132, 100, 12, 46, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (239, 'Caju, suco concentrado', 89, 240, 25, 108, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (240, 'Cajuzinho', 156, 12, 6, 44, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (241, 'Calda de chocolate', 78, 10, 5, 31, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (242, 'Caldo de carne Knorr®', 157, 9, 2, 24, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (243, 'Caldo de galinha Knorr®', 157, 9, 1, 24, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (244, 'Caldo verde', 83, 130, 7, 79, 'concha média cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (245, 'Caldo-de-cana', 90, 240, 49, 201, 'copo duplo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (246, 'Camarão (Baked Potato®)', 86, 90, 0, 42, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (247, 'Camarão cozido', 153, 30, 0, 27, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (248, 'Camarão cozido', 78, 20, 0, 18, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (250, 'Camarão grande cru', 157, 30, 0, 25, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (251, 'Camembert (Baked Potato®)', 54, 60, 0, 188, '4 fatias');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (252, 'Camu-camu', 58, 48, 3, 15, '6 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (253, 'Canapé de capaccio', 17, 3, 2, 20, '01 torrada');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (254, 'Canela em pau Kitano®', 157, 2, 1, 5, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (255, 'Canelone de frango', 155, 45, 9, 87, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (256, 'Canelone de ricota ', 155, 30, 7, 74, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (257, 'Canja de galinha', 83, 130, 12, 110, 'concha média cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (259, 'Capelete de carne Frescarini®', 98, 50, 26, 141, 'escumadeira');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (260, 'Capelete de frango Frescarini®', 98, 50, 26, 140, 'escumadeira');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (261, 'Cappuccino classic 3 corações® po', 45, 20, 14, 84, '2 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (262, 'Cappuccino classic diet 3 corações® pó', 45, 14, 6, 66, '2 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (264, 'Cará cozido', 75, 35, 7, 28, 'colher de sopa cheia picado');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (265, 'Carambola', 153, 100, 11, 46, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (266, 'Caranguejo cozido', 132, 100, 0, 83, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (268, 'Carne bovina, acem, moído, cru', 76, 25, 0, 49, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (269, 'Carne bovina, costela assada', 120, 100, 0, 373, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (270, 'Carne bovina, picanha, com gordura, grelhada', 120, 100, 0, 289, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (271, 'Carne com chilli (Baked Potato®)', 86, 65, 28, 98, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (272, 'Carne de bezerro', 132, 100, 0, 115, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (273, 'Carne de boi moída', 76, 25, 0, 49, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (274, 'Carne de boi, lagarto cozido', 101, 100, 0, 222, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (276, 'Carne de boi, paleta', 132, 100, 0, 307, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (278, 'Carne de boi, picanha (Friboi®)', 132, 100, 1.89999999999999991, 323, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (279, 'Carne de cabrito magra', 120, 100, 0, 179, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (280, 'Carne de cordeiro magra', 120, 100, 0, 162, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (281, 'Carne de porco, lombo assado', 120, 100, 0, 210, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (282, 'Carne de vaca, maminha', 132, 100, 0, 159, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (283, 'Carne ensopada com legumes', 81, 35, 3, 57, 'colher sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (284, 'Carne vegetal (de soja)', 76, 25, 2, 29, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (286, 'Carpaccio de Haddock', 101, 15, 0, 17, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (287, 'Carpaccio de salmão', 101, 15, 0, 21, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (288, 'Caruru (hortaliça crua picada)', 76, 25, 2, 9, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (289, 'Caruru (prato baiano)', 78, 30, 1, 64, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (290, 'Casquinha de siri ', 157, 55, 1, 92, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (292, 'Castanha de pequi', 155, 14, 3, 12, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (294, 'Castanha portuguesa', 22, 10, 5, 21, '01 unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (295, 'Catchup', 76, 15, 4, 15, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (296, 'Catupiry', 101, 35, 0, 88, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (298, 'Cebola picada', 76, 10, 1, 4, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (299, 'Cebolinha crua (picada)', 76, 8, 0, 2, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (301, 'Cenoura crua ralada', 76, 12, 1, 4, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (302, 'Cenouritas (Mc Donalds®)', 132, 70, 3, 18, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (303, 'Centeio, farinha clara de ', 161, 102, 79, 355, 'xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (304, 'Cereal barra Nestlé® banana, aveia e mel', 157, 20, 11, 64, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (305, 'Cereal barra Nutry® coco com chocolate', 157, 22, 16, 90, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (306, 'Cereal barra Trio® light morango com chocolate', 157, 20, 15, 78, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (308, 'Cereal infantil 3 cereais Nestlé®', 78, 7, 5, 29, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (310, 'Cereal matinal  chocokrispis Kelloggs® ', 52, 30, 25, 110, '3/4 de xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (311, 'Cereal matinal all bran Kelloggs® ', 52, 40, 18, 108, '3/4 de xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (312, 'Cereal matinal corn flakes Kelloggs®', 31, 30, 24, 108, '1 xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (313, 'Cereal matinal crunch Nestlé®', 53, 30, 23, 120, '3/4 xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (314, 'Cereal matinal Kellness® granola tradicional ', 35, 40, 27, 147, '1/2 xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (315, 'Cereja em conserva', 157, 5, 2, 8, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (317, 'Cerveja ', 110, 350, 12, 143, 'lata');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (318, 'Cevada, infuso de', 160, 200, 5, 24, 'xícara de chá cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (319, 'Chá mate (infusão sem açúcar)', 160, 200, 1, 6, 'xícara de chá cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (320, 'Chá sem açúcar (média)', 160, 200, 1, 4, 'xícara de chá cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (321, 'Chambinho', 157, 45, 4, 40, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (322, 'Champanhe', 146, 100, 3, 82, 'taça');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (323, 'Champanhe tipo sidra', 146, 100, 3, 82, 'taça');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (324, 'Champignon (Backed Potato®)', 86, 60, 1, 6, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (325, 'Champignon (conserva)', 78, 10, 0, 2, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (326, 'Chandelle chocolate', 157, 75, 18, 151, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (327, 'Chantilly', 78, 20, 4, 60, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (277, 'Carne de boi, paleta cozida', 111, 100, 0, 194, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (285, 'Carpa assada', 111, 100, 0, 110, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (330, 'Charuto folha de uva Habibs®', 132, 245, 19, 263, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (331, 'Charuto repolho Habibs®', 132, 285, 23, 295, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (333, 'Cheeseburger', 157, 140, 40, 358, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (334, 'Cheeseburguer (Bobs®)', 157, 120, 30, 329, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (335, 'Cheeseburguer (Burguer King®)', 157, 116, 32, 280, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (337, 'Cheeseburguer com bacon (Burguer King®)', 157, 119, 32, 310, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (338, 'Cheeseburguer duplo com bacon (Burguer King®)', 157, 160, 32, 440, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (339, 'Cheesecake com Mirtilo® (sorvete)', 2, 60, 18, 140, '01 bola');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (340, 'Cheetos sabor natural', 23, 25, 17, 121, '1 e 1/2 xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (341, 'Chester', 104, 15, 0, 31, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (346, 'Chiclete', 157, 5, 4, 16, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (347, 'Chiclete sabor sortido Bubbaloo®', 157, 5, 4, 16, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (348, 'Chiclete Trident® tuti-frutti', 157, 2, 1, 3, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (349, 'Chicória refogada', 78, 45, 3, 39, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (350, 'Chimarrão', 94, 200, 0, 12, 'cuia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (351, 'Chocolate alpino diet Nestlé®', 157, 30, 17, 143, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (352, 'Chocolate ao leite', 60, 30, 18, 160, 'barra pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (353, 'Chocolate ao leite diet', 60, 30, 13, 157, 'barra pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (354, 'Chocolate ao leite diet Gold®', 157, 25, 14, 122, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (355, 'Chocolate Batom®', 157, 16, 10, 86, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (356, 'Chocolate Bis®', 157, 7, 5, 37, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (357, 'Chocolate Classic Zero açúcar', 30, 22, 8, 94, '1 unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (358, 'Chocolate Diamante Negro®', 60, 30, 19, 156, 'barra pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (359, 'Chocolate em pó', 78, 15, 9, 52, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (360, 'Chocolate Ferrero Rocher®', 157, 13, 6, 71, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (361, 'Chocolate quente com leite (Mc Donalds®)', 91, 250, 24, 178, 'copo grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (362, 'Chocolate Suflair® ', 157, 30, 15, 132, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (363, 'Chocolate Talento®', 36, 25, 13, 137, '1/4 barra');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (364, 'Chocolate Talento® diet', 60, 25, 12, 129, 'barra pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (365, 'Chocotone Bauducco®', 10, 100, 49, 396, '01 fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (366, 'Chopp escuro', 147, 290, 11, 148, 'tulipa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (367, 'Chouriço', 109, 60, 1, 227, 'gomo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (368, 'Chuchu à milanesa', 101, 70, 10, 127, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (369, 'Chuchu ao molho branco', 76, 30, 3, 28, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (370, 'Chucrute', 161, 120, 5, 24, 'xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (371, 'Churros com doce de leite', 150, 30, 13, 97, 'unidade aperitivo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (372, 'Cidra', 132, 100, 10, 40, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (374, 'Coalhada integral Itambé®', 135, 130, 17, 120, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (375, 'Coalhada seca natural Alibey®', 78, 15, 1, 19, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (376, 'Cobertura de chocolate ao leite Garoto®', 76, 25, 14, 140, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (377, 'Coca-Cola®', 93, 200, 20, 80, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (378, 'Cocada light Santa Helena®', 155, 70, 37, 405, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (379, 'Cocada queimada Brasil Caipira®', 157, 20, 11, 86, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (380, 'Coco fresco ralado', 161, 100, 15, 354, 'xícara');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (381, 'Coco-da-baía, água-de', 93, 200, 10, 44, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (382, 'Cogumelo em conserva', 78, 27, 1, 5, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (384, 'Colomba Pascal salgada', 132, 100, 20, 228, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (385, 'Conhaque', 95, 50, 0, 115, 'dose');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (386, 'Cookie aveia e passas (Subway®)', 157, 33, 28, 190, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (387, 'Cookie cheescake com framboesa (Subway®)', 157, 33, 28, 200, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (388, 'Cookie chocolate  (Subway®)', 157, 33, 29, 210, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (389, 'Cookies integral quinua e banana Taeq®', 58, 30, 17, 123, '6 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (391, 'Coração de galinha cozido', 155, 5, 0, 8, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (392, 'Costela de boi assada', 121, 30, 0, 136, 'pedaço pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (393, 'Couve crua', 105, 20, 1, 10, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (394, 'Couve refogada', 105, 25, 4, 36, 'folha média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (395, 'Couve-flor à milanesa', 138, 90, 11, 136, 'ramo médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (396, 'Couve-flor cozida', 138, 60, 4, 25, 'ramo médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (397, 'Coxa de frango assada', 113, 100, 0, 215, 'média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (398, 'Cream Cheese ', 78, 30, 1, 84, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (399, 'Creme de abacate sem açúcar', 81, 25, 3, 43, 'colher sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (400, 'Creme de amendoim', 77, 20, 4, 125, 'colher de sopa rasa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (401, 'Creme de leite', 77, 15, 1, 46, 'colher de sopa rasa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (402, 'Creme de milho', 76, 33, 5, 35, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (403, 'Creme vegetal de chantilly Vigor®', 78, 20, 2, 56, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (404, 'Cremogema chocolate', 76, 20, 17, 72, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (405, 'Crepe de maçã diet', 157, 100, 18, 110, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (406, 'Croissant', 153, 80, 32, 328, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (409, 'Croquete de carne/milho', 156, 10, 4, 35, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (410, 'Cuca alemã', 104, 100, 33, 209, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (411, 'Cup noodles®', 151, 65, 38, 300, 'unidade comercial');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (412, 'Cupuaçu (creme)', 76, 20, 5, 135, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (413, 'Curau de milho', 50, 140, 33, 162, '2/3 xícara de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (414, 'Curry', 76, 9, 5, 34, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (415, 'Cuscuz de milho ', 121, 85, 34, 161, 'pedaço pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (416, 'Cuscuz paulista', 10, 80, 34, 161, '01 fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (417, 'Damasco seco', 18, 7, 2, 9, '01 unidade  pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (419, 'Danette®', 157, 110, 25, 166, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (420, 'Dobradinha', 85, 100, 8, 111, 'concha pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (421, 'Doce de abacaxi', 76, 40, 32, 130, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (422, 'Doce de abóbora cremoso', 76, 40, 22, 80, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (423, 'Doce de abóbora e coco', 76, 40, 18, 83, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (424, 'Doce de arroz de leite', 76, 40, 13, 66, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (425, 'Doce de batata doce', 130, 30, 22, 121, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (426, 'Doce de buriti', 76, 50, 41, 165, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (427, 'Doce de cidra', 78, 50, 20, 81, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (428, 'Doce de coco', 76, 40, 21, 219, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (429, 'Doce de cupuaçu', 78, 40, 30, 118, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (430, 'Doce de goiaba', 76, 50, 21, 86, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (431, 'Doce de goiaba em calda Diet House®', 78, 20, 6, 23, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (432, 'Doce de laranja azeda', 76, 50, 40, 153, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (433, 'Doce de laranja Diet House®', 78, 20, 2, 9, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (434, 'Doce de leite', 76, 40, 22, 116, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (435, 'Doce de limão', 76, 50, 27, 107, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (436, 'Doce de mamão verde', 78, 40, 19, 78, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (437, 'Doce de manga', 76, 50, 27, 140, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (438, 'Doce de ovos', 76, 40, 6, 52, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (440, 'Doriana® cremosa', 78, 10, 0, 59, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (441, 'Doriana® light', 78, 10, 0, 32, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (442, 'Double cheddar (Bobs®)', 157, 210, 32, 484, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (443, 'Double cheddar (Habibs®)', 157, 335, 35, 668, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (444, 'Double cheeseburguer (Bobs®)', 157, 185, 33, 512, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (445, 'Double grill bacon (Bobs®)', 157, 488, 58, 1314, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (446, 'Drops comum', 157, 3, 3, 11, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (447, 'Empada de frango', 155, 55, 14, 197, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (448, 'Empada de Palmito', 157, 55, 14, 129, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (449, 'Empadão goiano', 155, 300, 48, 618, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (450, 'Empadinha', 156, 12, 4, 56, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (451, 'Enrolado de presunto e queijo', 155, 40, 15, 114, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (452, 'Enrolado de salsicha', 155, 27, 3, 79, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (453, 'Ervilha em conserva ', 76, 27, 4, 20, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (454, 'Ervilha verde cozida', 76, 30, 4, 26, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (455, 'Esha de carne aberta', 157, 75, 18, 125, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (456, 'Esha de carne aberta', 157, 75, 18, 125, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (457, 'Esha de carne fechada', 155, 80, 29, 203, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (458, 'Esha de espinafre (Habibs®)', 157, 80, 17, 122, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (459, 'Esha folhada de cheddar com pepperoni (Habibs®)', 157, 55, 11, 201, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (460, 'Esha folhada de cheddar com pepperoni (Habibs®)', 157, 55, 11, 201, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (461, 'Esha folhada de chocolate (Habibs®)', 157, 45, 16, 199, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (462, 'Esha folhada de chocolate (Habibs®)', 157, 45, 16, 199, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (463, 'Esha folhada de chocolate com M&Ms® (Habibs®)', 157, 65, 28, 295, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (464, 'Espinafre cru', 76, 20, 0, 4, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (465, 'Espinafre refogado', 79, 25, 2, 27, 'colher do sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (466, 'Estrogono de lé mignon (Backed Potato®)', 86, 85, 0, 146, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (467, 'Estrogonoe de carne', 79, 25, 1, 39, 'colher do sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (468, 'Estrogonoe de frango', 79, 25, 1, 43, 'colher do sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (469, 'Extrato de malte', 76, 15, 10, 42, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (471, 'Fanta® laranja', 93, 200, 22, 90, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (472, 'Farelo de trigo', 76, 9, 5, 28, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (473, 'Farinha dágua-do-pará', 88, 50, 41, 166, 'copo descartável pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (474, 'Farinha de arroz', 76, 17, 14, 60, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (475, 'Farinha de centeio integral', 76, 15, 11, 54, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (476, 'Farinha de mandioca', 76, 16, 14, 57, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (477, 'Farinha de milho', 76, 15, 12, 54, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (478, 'Farinha de milho integral', 76, 15, 11, 53, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (479, 'Farinha de rosca', 76, 15, 11, 61, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (480, 'Farinha de tapioca com coco e açúcar', 76, 25, 21, 107, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (481, 'Farinha de trigo ', 76, 20, 15, 71, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (482, 'Farinha láctea (Nestlé®)', 77, 8, 6, 30, 'colher de sopa rasa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (483, 'Farofa', 76, 15, 12, 71, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (484, 'Farofa com Bacon', 4, 45, 26, 206, '01 colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (485, 'Farofa com lingüiça', 76, 15, 7, 54, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (486, 'Farofa com tempero/óleo', 76, 15, 12, 71, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (487, 'Farofa de farinha de mandioca', 76, 25, 20, 96, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (488, 'Fatouche', 27, 100, 5, 163, '1 porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (489, 'Feijão branco cozido', 76, 17, 4, 20, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (490, 'Feijão carioquinha cozido', 76, 17, 3, 19, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (491, 'Feijão preto cozido', 76, 17, 2, 12, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (492, 'Feijão tropeiro', 76, 15, 7, 50, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (493, 'Feijão-fradinho', 76, 17, 2, 13, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (495, 'Fermento  biológico', 144, 15, 1, 14, 'tablete');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (496, 'Fermento em pó', 77, 10, 4, 17, 'colher de sopa rasa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (497, 'Fettuccine', 14, 110, 24, 150, '01 pegador');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (498, 'Fettuccine a bolonhesa (Perdigão®)', 132, 350, 49, 458, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (499, 'Fígado de boi grelhado', 61, 100, 4, 225, 'bife médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (500, 'Fígado de galinha cru', 155, 30, 1, 53, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (502, 'Figo cristalizado', 157, 30, 22, 86, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (503, 'Figo enlatado em calda', 157, 20, 10, 38, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (504, 'Filé a parmeggiana', 21, 150, 13, 490, '01 unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (506, 'Flocos de milho', 78, 10, 9, 38, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (507, 'Focaccia', 104, 50, 22, 136, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (508, 'Fogazza de calabresa (Habibs®)', 157, 70, 22, 186, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (509, 'Fogazza de mussarela (Habibs®)', 157, 70, 21, 200, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (510, 'Folhado de frango', 155, 40, 9, 109, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (511, 'Fondue de carne', 61, 90, 0, 180, 'bife médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (512, 'Fondue de chocolate ', 82, 30, 15, 105, 'colher sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (513, 'Fondue de queijo (Gramado®)', 73, 30, 1, 70, 'colher de sopa (molho)');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (514, 'Framboesa', 155, 15, 2, 8, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (515, 'Framboesa, doce em pasta', 76, 50, 35, 143, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (516, 'Framboesa, geléia de', 76, 34, 24, 97, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (518, 'Frango assado', 142, 65, 0, 78, 'sobrecoxa média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (519, 'Frango com requeijão (Backed Potato®)', 86, 85, 0, 110, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (520, 'Frango cozido', 142, 65, 0, 82, 'sobrecoxa média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (522, 'Frango frito', 142, 65, 0, 94, 'sobrecoxa média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (523, 'Franlitos (Bobs®)', 126, 120, 28, 272, 'porção de 6 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (524, 'Frigideira de repolho com camarão seco', 78, 25, 1, 25, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (525, 'Fruta - pão', 157, 100, 24, 96, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (526, 'Fruta-de-conde ou pinha', 156, 60, 8, 41, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (527, 'Frutas cristalizadas industrializadas', 76, 15, 12, 48, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (528, 'Fubá', 76, 20, 16, 71, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (529, 'Funghi', 76, 20, 10, 71, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (530, 'Galeto assado', 121, 95, 0, 115, 'pedaço pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (531, 'Galinha ao molho pardo', 120, 95, 1, 150, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (532, 'Galinhada com pequi', 71, 60, 13, 108, 'colher de servir');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (533, 'Gatorade® - média sabores', 107, 500, 24, 120, 'garrafa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (534, 'Gelatina de frutas em pó', 76, 25, 22, 97, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (535, 'Gelatina diet em pó ', 76, 14, 0, 1, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (536, 'Gelatina em pó com açúcar', 76, 14, 12, 55, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (537, 'Gelatina light  morango preparada', 76, 25, 0, 3, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (538, 'Geléia de damasco diet', 77, 22, 6, 19, 'colher de sopa rasa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (539, 'Geléia de frutas (média)', 76, 30, 18, 74, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (540, 'Geléia de mocotó', 76, 40, 12, 64, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (541, 'Geléia de mocotó dietética', 76, 40, 2, 22, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (542, 'Geléia de morango diet', 77, 22, 6, 25, 'colher de sopa rasa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (543, 'Germen de trigo', 76, 10, 4, 37, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (544, 'Glucose de milho', 72, 9, 6, 26, 'colher de sobremesa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (545, 'Goiaba', 155, 170, 20, 96, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (546, 'Goiabada', 103, 40, 27, 109, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (547, 'Goma de tapioca', 76, 20, 11, 46, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (548, 'Gordura vegetal hidrogenada', 76, 14, 0, 126, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (549, 'Gorgonzola (Backed Potato®)', 86, 60, 0, 288, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (550, 'Gran picanha 100g (Bobs®)', 157, 233, 27, 526, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (551, 'Gran picanha 200g (Bobs®)', 157, 348, 27, 755, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (552, 'Granola', 76, 11, 7, 51, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (553, 'Grão-de-bico cozido', 76, 22, 4, 25, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (555, 'Guaraná diet', 90, 240, 0, 0, 'copo duplo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (556, 'Guaraná Jesus®', 110, 350, 42, 168, 'lata');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (557, 'Guaraná Kuat®', 90, 240, 25, 98, 'copo duplo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (558, 'Guaraná refrigerante', 90, 240, 24, 96, 'copo duplo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (559, 'Guariroba', 76, 15, 2, 10, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (560, 'Guariroba refogada', 44, 60, 1, 22, '2 colheres de sopa cheias');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (561, 'Hamburguer - sanduíche', 157, 125, 40, 301, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (563, 'Hamburguer de carne bovina', 155, 56, 2, 139, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (564, 'Hamburguer de frango', 155, 56, 2, 131, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (565, 'Hamburguer de peru', 155, 56, 0, 82, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (567, 'Harumaki de carne', 157, 50, 8, 103, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (568, 'Harumaki de carne', 157, 50, 8, 103, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (569, 'Harumaki ladéla', 157, 50, 8, 158, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (570, 'Harumaki ladéla', 157, 50, 8, 158, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (571, 'Herbalife de baunilha', 76, 15, 7, 51, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (573, 'Homus', 76, 30, 14, 94, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (574, 'Homus (Habibs®)', 132, 240, 34, 360, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (575, 'Hossomaki de atum', 157, 110, 26, 164, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (576, 'Hossomaki de pepino', 157, 110, 26, 123, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (517, 'Frango à milanesa', 112, 100, 14, 311, 'filé pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (521, 'Frango lé cozido', 112, 100, 0, 163, 'filé pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (577, 'Hossomaki de pepino', 157, 110, 26, 123, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (578, 'Hossomaki de salmão', 157, 110, 26, 155, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (579, 'Inhame, raiz sem casca de (picado)', 76, 35, 8, 37, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (580, 'Iogurte Activia® light', 135, 100, 11, 62, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (581, 'Iogurte Activia® natural', 135, 170, 12, 132, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (582, 'Iogurte Activia® original', 135, 100, 16, 110, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (583, 'Iogurte Corpus® de morango light', 108, 170, 8, 69, 'garranha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (584, 'Iogurte Dan up®', 108, 180, 28, 157, 'garranha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (585, 'Iogurte de frutas (média)', 135, 100, 17, 90, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (586, 'Iogurte de frutas light (média)', 135, 100, 7, 42, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (587, 'Iogurte Grego Nestlé® light', 135, 90, 10, 78, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (588, 'Iogurte Grego Nestlé® tradicional', 135, 100, 15, 113, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (589, 'Iogurte Grego Vigor®', 135, 100, 16, 151, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (590, 'Iogurte Grego Vigor® zero', 135, 100, 5, 49, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (591, 'Iogurte Molico® total cálcio líquido (média)', 108, 170, 8, 73, 'garranha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (592, 'Iogurte Molico® total cálcio polpa (média)', 135, 100, 6, 42, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (593, 'Iogurte natural c/ mel', 93, 200, 36, 225, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (594, 'Iogurte natural desnatado (Fiore®) ', 93, 140, 6, 45, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (595, 'Iogurte natural desnatado (média)', 93, 185, 12, 85, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (596, 'Iogurte natural integral (média)', 93, 200, 12, 142, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (597, 'Iogurte petit suisse (média)', 157, 45, 9, 71, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (598, 'Isca de carne de porco', 76, 30, 0, 67, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (599, 'Isca frita de pirarucu', 96, 100, 16, 258, 'escumadeira cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (600, 'Jabuticaba', 157, 5, 1, 2, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (601, 'Jaca  ', 59, 12, 1, 3, 'bago  médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (602, 'Jambo', 155, 40, 5, 22, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (603, 'Jambu cozido', 76, 15, 2, 8, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (604, 'Jamelão ou jambolão', 155, 10, 1, 4, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (605, 'Jaraqui cru', 120, 100, 0, 129, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (606, 'Jenipapo', 120, 100, 26, 113, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (607, 'Jiló', 68, 60, 5, 31, 'colher (sopa) cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (608, 'Joelho de porco (Einsbein®)', 132, 100, 0, 215, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (609, 'Kafta na bandeja (Habibs®)', 132, 250, 14, 300, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (610, 'Kani kama cru', 157, 16, 0, 13, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (611, 'Kanimaki ', 157, 15, 4, 20, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (612, 'Kappamaki de pepino', 157, 15, 4, 18, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (613, 'Karo', 76, 15, 12, 49, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (614, 'Kasespatzle (macarrão com queijo)', 122, 130, 20, 198, 'pegador');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (615, 'Ketchup de tomate', 76, 20, 5, 23, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (616, 'Kinder ovo® maxi (Ovo de Páscoa)', 132, 25, 13, 143, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (617, 'Kiwi', 155, 76, 11, 51, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (618, 'Lagosta à Thermidor', 132, 100, 13, 460, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (620, 'Lasanha à bolonhesa', 98, 170, 27, 355, 'escumadeira');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (621, 'Lasanha de bacalhau e espinafre', 132, 200, 42, 503, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (624, 'Leite de cabra integral', 89, 240, 13, 223, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (625, 'Leite de coco industrializado ', 106, 200, 11, 516, 'garrafa pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (626, 'Leite de coco industrializado light', 106, 200, 6, 250, 'garrafa pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (628, 'Leite de soja zero Ades®', 93, 200, 3, 59, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (629, 'Leite de vaca desnatado', 89, 240, 12, 84, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (630, 'Leite de vaca desnatado em pó', 68, 10, 5, 35, 'colher (sopa) cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (631, 'Leite de vaca integral  em pó ', 68, 16, 6, 80, 'colher (sopa) cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (632, 'Leite de vaca integral pasteurizado', 89, 240, 12, 141, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (633, 'Lentilha cozida', 80, 18, 3, 19, 'colher sopa (cheia)');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (634, 'Licor', 67, 20, 6, 62, 'cálice');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (635, 'Limão', 76, 12, 1, 4, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (636, 'Limão, geléia de', 76, 15, 1, 7, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (637, 'Limonada s/ açúcar ', 93, 200, 10, 28, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (638, 'Língua de boi cozida', 101, 30, 0, 94, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (639, 'Língua de gato Kompenhagen®', 157, 6, 3, 36, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (640, 'Linguado assado', 133, 120, 0, 140, 'posta média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (641, 'Linguiça calabresa', 157, 40, 0, 146, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (642, 'Linguiça calabresa defumada', 157, 40, 0, 146, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (643, 'Linguiça de frango', 109, 60, 0, 146, 'gomo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (644, 'Linguiça de peru', 109, 60, 0, 83, 'gomo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (645, 'Linguiça paio', 157, 160, 0, 363, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (646, 'Lombo de porco assado', 117, 120, 0, 252, 'pedaço grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (647, 'Lombo de vitela assado/ cozido', 120, 50, 0, 113, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (648, 'Lula cozida', 155, 80, 0, 74, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (649, 'M&M®', 78, 12, 9, 61, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (650, 'M&M´s® amendoim', 78, 12, 8, 64, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (651, 'M&M´s® chocolate', 78, 12, 9, 61, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (652, 'Maçã com casca', 156, 90, 14, 58, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (655, 'Macarrão à bolonhesa', 96, 110, 22, 136, 'escumadeira cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (656, 'Macarrão ao alho e óleo', 96, 110, 35, 241, 'escumadeira cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (657, 'Macarrão caseiro cozido', 69, 50, 11, 54, 'colher de arroz cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (658, 'Macarrão instantâneo Maggi® lámen queijo', 116, 80, 50, 370, 'pacote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (659, 'Macarrão mini fusilli picolini Barrila®', 136, 80, 59, 280, 'prato');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (660, 'Macaúba crua', 49, 100, 14, 404, '2 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (662, 'Mamão formosa', 101, 100, 12, 45, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (663, 'Mamão papaya', 114, 160, 16, 64, 'meia unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (664, 'Mamão papaya', 76, 40, 3, 14, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (665, 'Mamão verde, doce de', 76, 40, 19, 78, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (666, 'Mandioca cozida (picada)', 76, 30, 9, 37, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (667, 'Mandioca frita', 117, 100, 50, 300, 'pedaço grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (668, 'Mandioquinha', 78, 25, 5, 20, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (669, 'Mané pelado', 120, 70, 37, 226, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (670, 'Manga espada', 155, 140, 22, 91, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (672, 'Manteiga ', 76, 32, 0, 235, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (673, 'Maracujá', 155, 45, 6, 31, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (674, 'Margarina', 76, 32, 0, 219, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (675, 'Maria mole', 132, 44, 33, 132, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (676, 'Marmelada', 101, 60, 40, 158, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (677, 'Marreco recheado assado', 37, 100, 3, 258, '1/4 unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (678, 'Marron-glacê', 101, 60, 35, 149, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (679, 'Marshmelow Dr. Oetker®', 76, 10, 9, 40, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (680, 'Martini', 95, 50, 2, 41, 'dose');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (681, 'Massa fresca semipronta para pizza', 149, 140, 80, 441, 'unidade (inteira)');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (682, 'Massa fresca semipronta para pizza brotinho', 157, 40, 23, 126, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (683, 'Massa pronta para pastel ', 47, 30, 16, 83, '2 discos de massa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (684, 'Matrinxã inteiro cru', 120, 100, 0, 246, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (691, 'McNuggets 10 (Mc Donalds®)', 123, 166, 27, 431, 'porção de 10 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (692, 'McNuggets 4 (Mc Donalds®)', 125, 66, 11, 173, 'porção de 4 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (693, 'McNuggets 6 (Mc Donalds®)', 126, 0, 16, 259, 'porção de 6 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (694, 'Melabie', 27, 100, 25, 162, '1 porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (695, 'Melado', 78, 16, 12, 47, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (696, 'Melancia', 101, 200, 11, 48, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (697, 'Melão', 99, 115, 7, 32, 'fatia grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (698, 'Melão cantalupo', 132, 100, 8, 34, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (699, 'Melão gaúcho', 103, 100, 7, 29, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (700, 'Merengue de morango', 128, 60, 52, 214, 'porção média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (702, 'Michui de Filé Mingnon', 27, 100, 2, 88, '1 porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (704, 'Michui de Frango', 27, 100, 2, 90, '1 porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (705, 'Milho em espiga com 1 c.sobremesa de  manteiga ', 157, 100, 32, 233, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (706, 'Milho verde em conserva enlatado', 76, 24, 5, 23, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (710, 'Milk shake de baunilha', 87, 290, 51, 330, 'copo de milk shake');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (711, 'Milk shake de chocolate', 87, 290, 61, 350, 'copo de milk shake');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (712, 'Minestrone (sopa)', 132, 300, 23, 283, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (713, 'Mingau (média)', 76, 37, 8, 50, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (714, 'Mini bolacha sabor chocolate Trakinas®', 157, 12, 8, 58, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (715, 'Mini bomba de avelã Cristallo®', 157, 15, 6, 41, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (716, 'Mini Bomba de Caramelo', 157, 10, 3, 25, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (717, 'Mini Bomba de Chocolate', 157, 10, 2, 23, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (718, 'Mini bomba de chocolate Cristallo®', 157, 15, 6, 43, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (719, 'Mini cenouras', 159, 125, 13, 54, 'xícara de café');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (720, 'Mini churro de doce de Leite (Habibs®)', 157, 20, 9, 56, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (721, 'Mini hamburguinho', 157, 60, 15, 123, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (722, 'Mini hot dog', 157, 60, 15, 165, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (723, 'Mini kibe frito de cremilly (Habibs®)', 157, 45, 8, 101, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (724, 'Mini pizza', 157, 60, 20, 182, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (725, 'Mini Torta de Limão', 157, 10, 5, 32, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (726, 'Mini Torta de Maçã', 157, 10, 3, 21, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (727, 'Mini Torta de Morango', 157, 10, 3, 21, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (728, 'Miojo sabor carne suave Nissin®', 116, 85, 49, 374, 'pacote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (729, 'Miojo sabor galinha Nissin®', 116, 85, 50, 369, 'pacote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (730, 'Miojo sabor legumes Nissin®', 116, 85, 51, 372, 'pacote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (731, 'Miolos', 76, 25, 0, 30, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (732, 'Missoshiro', 132, 300, 9, 70, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (733, 'Misto-quente', 157, 85, 29, 283, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (734, 'Miúdos de boi (dobradinha, livrelho)', 76, 35, 0, 44, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (735, 'Mix de frutas desidratadas Frutolla®', 45, 25, 6, 34, '2 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (736, 'Mjadra', 27, 52, 52, 314, '1 porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (737, 'Moela', 155, 18, 0, 29, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (738, 'Molho à bolonhesa', 76, 22, 2, 41, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (739, 'Molho agridoce (Mc Donalds®)', 132, 28, 10, 45, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (740, 'Molho barbecue  MasterFoods®', 45, 25, 5, 18, '2 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (741, 'Molho barbecue (Mc Donalds®)', 132, 28, 10, 46, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (742, 'Molho branco ', 78, 35, 5, 70, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (743, 'Molho caipira (Mc Donalds®)', 132, 28, 6, 50, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (744, 'Molho caseiro azeite/vinagre', 76, 13, 0, 113, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (747, 'Molho de mostarda light', 78, 15, 1, 10, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (748, 'Molho de pimenta', 76, 35, 3, 12, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (749, 'Molho de queijo com ervas light', 78, 13, 1, 8, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (750, 'Molho de tomate sabor pizza Pomarola®', 78, 20, 2, 8, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (751, 'Molho de tomate tradicional  340g Fugini®', 78, 20, 3, 13, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (752, 'Molho de tomate tradicional  340g Tarantella®', 78, 20, 2, 8, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (753, 'Molho de tomate tradicional 340g Pomarola®', 78, 20, 2, 8, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (754, 'Molho inglês', 76, 6, 1, 6, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (755, 'Molho madeira Uncle Bens®', 78, 30, 3, 13, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (756, 'Molho para carnes madeira 340g Predilecta® ', 51, 60, 5, 23, '3 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (757, 'Molho para salada tipo caesar  Masterfoods®', 78, 13, 2, 25, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (758, 'Molho pesto Genovese 190 g Barilla® ', 51, 60, 2, 320, '3 colheres de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (759, 'Molho pra salada tipo caesar ( Masterfoods®)', 78, 13, 2, 25, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (760, 'Molho pronto de pesto Hemmer®', 78, 20, 2, 105, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (761, 'Molho shoyo', 78, 6, 1, 5, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (763, 'Molho vermelho light', 72, 14, 1, 10, 'colher de sobremesa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (764, 'Mondongo (dobradinha)', 85, 100, 8, 111, 'concha pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (765, 'Moqueca de ovos', 132, 85, 3, 116, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (766, 'Moqueca de peixe', 132, 185, 4, 218, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (767, 'Morango', 155, 12, 1, 5, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (768, 'Mortadela', 101, 15, 0, 41, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (769, 'Mostarda folha cozida ', 76, 45, 2, 12, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (770, 'Mousse de chocolate', 76, 25, 8, 79, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (771, 'Mousse de maracujá', 76, 35, 11, 100, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (772, 'Mucilon de arroz', 76, 9, 8, 34, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (773, 'Mucilon de milho', 76, 9, 8, 34, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (774, 'Muffin de banana Suavipan®', 157, 40, 20, 141, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (775, 'Mungunzá', 86, 150, 29, 150, 'concha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (776, 'Nabo cozido (picado)', 76, 18, 1, 5, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (778, 'Néctar de manga Dell Valle®', 66, 200, 30, 118, 'caixinha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (779, 'Nectarina', 155, 100, 12, 49, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (780, 'Nescau®', 76, 16, 14, 61, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (781, 'Nêspera', 153, 40, 4, 20, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (782, 'Nesquick em pó Nestlé®', 76, 16, 15, 63, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (783, 'Nesquick® preparado, caixinha de', 29, 200, 29, 170, '1 und');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (784, 'Neston®', 76, 8, 6, 29, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (785, 'Nhoque', 8, 100, 21, 120, '01 escumadeira cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (786, 'Niguiri sushi de atum', 157, 30, 10, 59, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (787, 'Niguiri sushi de kani', 157, 30, 10, 51, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (788, 'Niguiri sushi de kani', 157, 30, 10, 51, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (789, 'Niguiri sushi de salmão', 157, 30, 10, 57, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (790, 'Ninho® soleil morango (bebida láctea)', 157, 200, 31, 170, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (792, 'Nuggets de frango tradicional Sadia®', 157, 25, 3, 53, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (793, 'Nuggets de legumes Sadia®', 157, 21, 5, 36, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (794, 'Nuggets de peixe Sadia®', 157, 23, 4, 41, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (795, 'Nutella®', 78, 20, 11, 106, 'colher de sopa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (796, 'Óleos vegetais', 76, 8, 0, 72, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (797, 'Olho de Sogra', 157, 10, 5, 34, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (799, 'Onion rings (Burguer King®)', 132, 0, 5, 319, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (800, 'Ovo de codorna', 157, 10, 0, 16, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (801, 'Ovo de galinha inteiro (cozido)', 155, 45, 0, 71, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (802, 'Ovo de galinha, clara cozida', 155, 30, 0, 15, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (803, 'Ovo de galinha, gema cozida', 155, 15, 0, 53, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (804, 'Ovo de Páscoa (média)', 26, 25, 15, 134, '1 pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (805, 'Ovo de Páscoa Amandita®', 132, 25, 15, 135, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (806, 'Ovo de Páscoa Bis®', 132, 25, 15, 130, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (807, 'Ovo de páscoa Diamante Negro®', 132, 25, 16, 128, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (808, 'Ovo de Páscoa Ferrero Rocher®', 132, 25, 9, 151, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (809, 'Ovo de Páscoa Kinder Ovo Maxi® ', 132, 25, 13, 143, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (810, 'Ovo de Páscoa Lacta®', 132, 25, 15, 131, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (811, 'Ovo de Páscoa Lacta® Diet', 132, 25, 15, 111, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (812, 'Ovo de Páscoa Shot®', 132, 25, 14, 134, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (813, 'Ovo de Páscoa Sonho de Valsa®', 132, 25, 15, 134, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (814, 'Ovomaltine®', 76, 14, 12, 53, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (815, 'Paçoca', 157, 30, 20, 115, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (816, 'Paçoca diet Airon®', 157, 20, 7, 79, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (817, 'Pacu inteiro cru', 120, 100, 0, 292, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (818, 'Paio', 157, 160, 5, 363, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (819, 'Palmito em conserva', 76, 15, 1, 3, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (820, 'Pamonha', 157, 160, 69, 413, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (821, 'Pamonha doce', 156, 130, 47, 335, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (822, 'Panettone frutas', 103, 25, 14, 88, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (823, 'Panqueca carne', 155, 80, 18, 229, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (824, 'Panqueca de batata (Kartoelpuer®)', 155, 30, 22, 97, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (825, 'Pão alemão integral  (Wickbold®)', 33, 50, 17, 99, '1/2 unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (828, 'Pão com tucumã', 157, 85, 28, 241, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (829, 'Pão de batata-inglesa', 155, 50, 29, 137, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (831, 'Pão de centeio integral', 155, 50, 23, 116, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (832, 'Pão de forma branco ', 157, 25, 12, 62, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (833, 'Pão de forma de aveia', 157, 25, 11, 59, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (834, 'Pão de forma de centeio', 157, 27, 13, 75, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (835, 'Pão de hambúrguer', 157, 70, 40, 188, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (836, 'Pão de leite', 157, 54, 30, 149, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (837, 'Pão de mel', 155, 15, 13, 76, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (838, 'Pão de mel doce de leite Cacau Show®', 157, 50, 30, 190, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (839, 'Pão de milho caseiro', 101, 70, 43, 200, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (845, 'Pão de queijo light Forno de Minas®', 155, 27, 9, 55, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (846, 'Pão de torresmo', 104, 70, 33, 375, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (849, 'Pão italiano', 11, 50, 28, 125, '01 fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (850, 'Pão ligth de quinua Sonda®', 48, 50, 21, 114, '2 fatias');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (851, 'Pão sírio integral Pita Bread®', 157, 53, 11, 53, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (852, 'Pão sírio Pita Bread®', 155, 58, 33, 158, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (853, 'Papinha de banana e aveia Nestlé®', 135, 120, 24, 104, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (854, 'Papinha de carne com legumes Nestlé®', 135, 155, 9, 83, 'pote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (855, 'Pasta de atum', 76, 35, 2, 112, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (856, 'Pasta de tofu', 76, 26, 2, 45, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (857, 'Pastel de belém (Habib´s®)', 157, 50, 14, 107, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (858, 'Pastel de carne', 155, 32, 5, 84, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (859, 'Pastel de queijo', 155, 25, 5, 75, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (860, 'Pastel de queijo de forno', 153, 40, 15, 185, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (861, 'Pastel português', 155, 35, 10, 149, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (862, 'Pastelzinho', 156, 8, 3, 24, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (863, 'Patê de atum Coqueiro®', 70, 10, 0, 17, 'colher de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (864, 'Patê de atum ligth Gomes da Costa®', 70, 10, 1, 12, 'colher de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (866, 'Patê de frango com ervas nas  Excelsior®', 70, 10, 1, 20, 'colher de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (867, 'Patê de peito de peru defumado Sadia®', 70, 10, 0, 22, 'colher de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (868, 'Patê de salmão Gomes da Costa®', 70, 10, 0, 15, 'colher de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (869, 'Pato no tucupi assado', 143, 100, 3, 303, 'sobrecoxa');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (870, 'Pavê de chocolate', 120, 85, 16, 154, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (871, 'Pavê de chocolate branco Amor aos Pedaços®', 104, 60, 20, 208, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (872, 'Pave de cholocale ao leite', 43, 85, 34, 200, '2 colheres de copa cheias');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (873, 'Pé-de-moleque', 155, 17, 10, 88, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (874, 'Pé-de-moleque (Norte)', 120, 100, 45, 336, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (875, 'Pé-de-moleque diet Airon®', 155, 14, 6, 61, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (876, 'Pé-de-moleque Santa Helena*®', 157, 17, 10, 88, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (877, 'Peito de peru defumado ligth Sadia®', 104, 20, 0, 21, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (878, 'Peito de peru defumado Perdigão®', 104, 25, 0, 41, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (882, 'Peixe na telha', 133, 230, 7, 262, 'posta média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (883, 'Pepino com casca (picles)', 38, 50, 2, 12, '1/4 xícara de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (884, 'Pepino cru', 103, 3, 0, 1, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (885, 'Pequi refogado', 55, 70, 9, 143, '4 unidades médias');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (886, 'Pêra crua ', 155, 130, 19, 80, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (887, 'Pernil assado', 24, 100, 1.69999999999999996, 94, '1 fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (888, 'Pernil suíno temperado seara®', 42, 100, 2, 140, '2 ¹/² fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (889, 'Peru (carne branca assada)', 120, 32, 0, 57, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (890, 'Pescada inteira crua', 120, 100, 0, 111, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (891, 'Pêssego amarelo', 155, 60, 6, 29, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (892, 'Pessego em calda', 12, 30, 6, 25, '01 metade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (893, 'Picolé abacaxi Kibon®', 157, 59, 16, 65, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (894, 'Picolé chicabon Kibon®', 157, 65, 19, 106, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (895, 'Picolé de coco la frutta Nestlé®', 157, 58, 13, 90, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (896, 'Picolé de morango la frutta Nestlé®', 157, 60, 8, 36, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (897, 'Picolé de uva la frutta Nestlé®', 157, 61, 15, 62, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (898, 'Picolé fruttare limão Kibon®', 157, 58, 13, 51, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (899, 'Picolé mega clássico Nestlé®', 157, 77, 22, 238, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (900, 'Picolé mega trufas Nestlé®', 157, 77, 27, 258, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (901, 'Pimenta-malagueta', 76, 15, 1, 6, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (902, 'Pimentão ', 76, 13, 1, 7, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (905, 'Pipoca no óleo/manteiga com sal', 141, 20, 14, 90, 'saco médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (906, 'Pipoca salgada', 141, 20, 14, 90, 'saco médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (907, 'Piquiá', 156, 50, 15, 179, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (880, 'Peixe do mar cozido (média)', 111, 120, 0, 117, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (910, 'Pirarucu de casaca', 96, 110, 25, 293, 'escumadeira cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (911, 'Pirulito', 157, 20, 19, 74, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (912, 'Pistache', 157, 1, 0, 4, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (913, 'Pitanga', 157, 15, 1, 7, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (914, 'Pitaya', 157, 200, 14, 84, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (915, 'Pizza Brasileira', 101, 111, 25, 268, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (916, 'Pizza Califórnia', 101, 100, 26, 213, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (917, 'Pizza de Alcachofra', 101, 100, 21, 273, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (918, 'Pizza de atum', 101, 100, 21, 258, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (919, 'Pizza de bacon', 101, 100, 22, 288, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (920, 'Pizza de bacon com requeijão ', 101, 123, 26, 244, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (921, 'Pizza de banana com canela', 101, 100, 40, 207, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (922, 'Pizza de brigadeiro', 101, 100, 59, 402, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (923, 'Pizza de calabresa', 101, 100, 21, 240, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (924, 'Pizza de camarão', 101, 100, 21, 268, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (925, 'Pizza de champignon', 101, 100, 22, 222, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (926, 'Pizza de chocolate ao leite', 101, 100, 54, 483, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (927, 'Pizza de chocolate branco', 101, 100, 41, 443, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (928, 'Pizza de doce de leite', 101, 100, 51, 423, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (929, 'Pizza de Escarola', 101, 100, 22, 294, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (930, 'Pizza de frango', 101, 100, 22, 229, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (931, 'Pizza de frango com catupiry ', 101, 111, 25, 274, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (932, 'Pizza de marguerita ', 101, 119, 27, 274, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (933, 'Pizza de mussarela', 101, 100, 22, 278, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (934, 'Pizza de mussarela de búfala, rúcula e tomate seco', 101, 100, 22, 165, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (935, 'Pizza de palmito com mussarela', 101, 100, 25, 220, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (936, 'Pizza de pepperoni ', 101, 102, 26, 274, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (937, 'Pizza de portuguesa', 101, 125, 24, 246, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (938, 'Pizza de Prestígio', 101, 100, 55, 420, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (939, 'Pizza de quatro queijos', 101, 100, 27, 277, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (940, 'Pizza de Romeu e Julieta', 101, 100, 27, 266, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (941, 'Pizza de Rúcula', 101, 100, 22, 255, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (942, 'Pizza Napolitana', 101, 100, 20, 207, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (943, 'Pizza Toscana', 101, 100, 20, 227, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (944, 'Pizza Vegetariana ', 101, 111, 22, 192, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (945, 'Polenguinho', 157, 20, 0, 67, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (946, 'Polenta com molho de carne', 98, 100, 8, 59, 'escumadeira');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (947, 'Polenta cozida', 120, 30, 3, 20, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (948, 'Polenta frita', 121, 20, 2, 18, 'pedaço pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (949, 'Polenta mole', 6, 100, 8, 59, '01 concha pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (951, 'Polvilho', 76, 16, 14, 56, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (952, 'Polvo cru', 132, 200, 4, 160, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (953, 'Porco frito com rodelas de limão', 132, 100, 0, 311, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (954, 'Prato do chef picanha 160g (Bobs®)', 132, 300, 29, 608, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (955, 'Prato primavera (Habibs®)', 157, 435, 27, 460, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (956, 'Prato verão (Habibs®)', 157, 330, 35, 420, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (957, 'Premium salad (McDonalds®)', 132, 0, 3, 104, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (958, 'Premium salad crispy (McDonalds®)', 132, 0, 17, 317, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (959, 'Premium salad grill (McDonalds®)', 132, 0, 3, 227, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (960, 'Presunto cozido', 101, 15, 0, 22, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (961, 'Presunto de peru', 101, 15, 0, 15, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (962, 'Pringles® original', 157, 2, 1, 10, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (963, 'Pringles® sabor cebola', 157, 2, 1, 10, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (964, 'Pudim de leite', 101, 50, 12, 91, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (965, 'Pudim de passas', 101, 50, 14, 95, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (966, 'Pudim de tapioca', 99, 110, 19, 263, 'fatia grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (967, 'Pudim de tapioca com leite condensado', 99, 90, 40, 150, 'fatia grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (968, 'Pupunha', 155, 25, 5, 41, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (969, 'Purê de batata', 76, 45, 8, 56, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (970, 'Purê de inhame', 76, 40, 7, 49, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (971, 'Purê de tomate', 76, 45, 5, 22, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (973, 'Queijadinha de coco', 155, 35, 9, 72, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (974, 'Queijo de coalho em espeto', 157, 30, 0, 100, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (975, 'Queijo gorgonzola nacional', 101, 38, 0, 151, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (976, 'Queijo mussarela', 101, 15, 0, 42, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (977, 'Queijo parmesão', 13, 15, 0, 54, '01 pedaço pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (978, 'Queijo parmesão nacional', 76, 15, 0, 61, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (979, 'Queijo prato', 101, 15, 0, 60, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (980, 'Queijo provolone nacional', 101, 15, 0, 51, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (981, 'Queijo roquefort nacional', 101, 30, 0, 120, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (982, 'Queijo suiço', 101, 30, 0, 120, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (983, 'Queijo tipo requeijão', 101, 30, 0, 89, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (984, 'Queijo tipo ricota nacional', 101, 30, 0, 54, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (985, 'Queijo tofu', 121, 10, 0, 7, 'pedaço pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (986, 'Queijo-de-minas frescal', 101, 30, 0, 73, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (987, 'Queijo-de-minas frescal light', 101, 30, 0, 46, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (988, 'Quentão ', 32, 100, 34, 295, '1/2 copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (989, 'Quiabo cozido sem sal', 76, 40, 3, 15, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (990, 'Quibe assado', 132, 100, 15, 172, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (991, 'Quibe frito (Habibs®)', 157, 85, 14, 152, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (992, 'Quiche de Presunto e Queijo', 157, 50, 10, 259, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (993, 'Quiche de queijo ', 21, 30, 11, 227, '01 unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (995, 'Quinua em flocos Mãe Terra®', 34, 40, 29, 159, '1/2 xícara de chá');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (996, 'Rã, carne de (desada)', 76, 10, 0, 7, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (997, 'Rabada crua', 155, 40, 0, 155, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (998, 'Rabanada', 155, 60, 48, 249, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (999, 'Rapadura', 120, 55, 48, 194, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1000, 'Ratatouille', 132, 107, 6, 77, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1001, 'Ravióli de carne', 98, 50, 26, 141, 'escumadeira');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1002, 'Ravióli de carne', 98, 50, 26, 141, 'escumadeira');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1003, 'Ravióli de mussarela', 8, 100, 20, 210, '01 escumadeira cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1004, 'Ravióli de queijo', 98, 50, 19, 149, 'escumadeira');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1005, 'Refrigerante', 90, 240, 24, 96, 'copo duplo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1006, 'Refrigerante citrus (Schweppes®)', 110, 350, 42, 170, 'lata');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1007, 'Refrigerante dietético', 89, 240, 0, 1, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1008, 'Repolho cozido (picado)', 76, 10, 0, 1, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1009, 'Repolho cru (picado)', 76, 10, 0, 2, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1010, 'Requeijão comum', 76, 30, 0, 106, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1011, 'Requeijão cremoso', 76, 30, 1, 106, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1012, 'Requeijão cremoso light', 76, 30, 1, 54, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1013, 'Risole de Queijo', 157, 50, 8, 112, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1014, 'Risoto', 76, 25, 5, 41, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1015, 'Risoto a milanes ', 4, 25, 19, 95, '01 colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1016, 'Risoto de camarão', 4, 25, 6, 45, '01 colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1017, 'Risoto de frango', 76, 25, 6, 45, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1018, 'Roll cake de chocolate', 157, 38, 22, 143, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1019, 'Romã', 157, 150, 23, 84, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1020, 'Rosquinhas de leite', 155, 7, 4, 27, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1021, 'Sagu', 76, 20, 17, 70, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1022, 'Sagu com creme de baunilha', 132, 100, 37, 159, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1023, 'Sakemaki', 157, 15, 3, 22, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1024, 'Salad caesar (Burguer King®)', 132, 0, 2, 53, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1025, 'Salada (McDonalds®)', 132, 0, 1, 8, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1026, 'Salada agadir', 132, 100, 3, 167, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1027, 'Salada Agadir', 132, 100, 3, 167.22999999999999, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1028, 'Salada almanara®', 132, 100, 12, 292, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1029, 'Salada Almanara®', 132, 100, 12, 293, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1030, 'Salada caesar (Bobs®)', 132, 100, 5, 74, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1031, 'Salada de atum (sanduiche) -Bobs®', 157, 154, 25, 377, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1032, 'Salada de batata com maionese', 76, 38, 7, 58, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1033, 'Salada de batatas (Kartoelsalat®)', 76, 30, 5, 82, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1034, 'Salada de frango (sanduiche) - Bobs®', 157, 154, 25, 356, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1035, 'Salada de frutas', 76, 20, 3, 10, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1036, 'Salada de frutas', 16, 120, 18, 65, '01 potinho pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1037, 'Salada de frutas completa ', 145, 100, 13, 52, 'taça pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1038, 'Salada de legumes com maionese', 76, 35, 5, 34, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1039, 'Salada tropical (Bobs®)', 132, 99, 7, 26, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1040, 'Salada tropical com tiras de hamburguer (Bobs®)', 132, 277, 10, 289, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1041, 'Salada verde (Burguer King®)', 132, 0, 1, 115, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1042, 'Salame', 101, 20, 0, 59, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1044, 'Salgadinho Pingo douro sabor baicon Elma Chips®', 76, 20, 11, 100, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1045, 'Salmão defumado', 132, 100, 20, 233, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1047, 'Salpicão de frango', 76, 25, 2, 61, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1048, 'Salsão/aipo cru', 76, 15, 0, 3, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1049, 'Salsicha comum', 155, 35, 0, 116, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1050, 'Salsicha de frango Sadia®', 155, 35, 1, 74, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1051, 'Salsicha de peru light Sadia®', 155, 35, 1, 58, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1052, 'Salsicha envasada (em conserva)', 155, 35, 0, 64, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1053, 'Salsichão', 155, 100, 3, 312, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1054, 'Salsichão (Wurst®)', 155, 100, 3, 312, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1055, 'Sanduíche americano', 155, 190, 28, 278, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1056, 'Sanduiche de almondegas  (Subway®)', 124, 379, 61, 498, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1057, 'Sanduíche de atum', 155, 120, 33, 372, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1058, 'Sanduiche de atum (Subway®)', 124, 260, 56, 414, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1059, 'Sanduiche de BNT (Subway®)', 124, 237, 47, 420, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1060, 'Sanduiche de carne (Subway®)', 124, 249, 46, 386, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1061, 'Sanduiche de churrasco (Subway®)', 124, 266, 48, 447, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1062, 'Sanduíche de frango', 155, 120, 33, 299, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1063, 'Sanduiche de frango (Subway®)', 124, 241, 46, 315, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1064, 'Sanduiche de frango defumado c/ cream cheese (Subway®)', 124, 259, 47, 450, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1065, 'Sanduiche de frango teriyaki (Subway®)', 124, 283, 61, 379, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1066, 'Sanduiche de frutos do mar (Subway®)', 124, 260, 63, 413, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1067, 'Sanduiche de italiano (Subway®)', 124, 222, 47, 404, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1068, 'Sanduiche de mussarela de búfala  (Subway®)', 124, 261, 55, 450, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1069, 'Sanduiche de peito de peru (Bobs®)', 157, 161, 25, 278, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1070, 'Sanduiche de peito de peru (Subway®)', 124, 234, 47, 300, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1071, 'Sanduiche de pizza sub (Subway®)', 124, 250, 50, 418, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1046, 'Salmão grelhado', 25, 100, 0, 171, '1 filé pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1072, 'Sanduiche de pizzaiolo (Subway®)', 124, 215, 48, 331, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1073, 'Sanduiche de presunto (Subway®)', 124, 222, 46, 286, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1074, 'Sanduiche de presunto e peito de peru (Subway®)', 124, 245, 47, 312, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1075, 'Sanduiche de rosbife (Subway®)', 124, 237, 46, 315, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1076, 'Sanduiche de subway club TM (Subway®)', 124, 275, 47, 350, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1077, 'Sanduiche de subway melt TM (Subway®)', 124, 270, 47, 419, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1078, 'Sanduíche natural', 155, 120, 29, 265, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1079, 'Sanduíche queijo quente', 157, 85, 33, 300, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1080, 'Sanduiche vegetariano  (Subway®)', 124, 177, 46, 239, 'porção de 15cm');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1081, 'Sapoti', 156, 60, 16, 58, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1082, 'Saquê', 95, 50, 3, 11, 'dose');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1083, 'Sardinha assada', 132, 100, 0, 164, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1084, 'Sardinha enlatada em molho de tomate', 155, 33, 0, 63, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1085, 'Sardinha enlatada em óleo', 155, 33, 0, 65, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1086, 'Sardinha frita', 155, 33, 1, 120, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1087, 'Sardinha inteira crua', 132, 100, 0, 144, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1088, 'Sashimi de atum', 104, 10, 0, 15, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1089, 'Sashimi de salmão', 104, 10, 0, 15, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1091, 'Shoyo', 76, 12, 1, 9, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1092, 'Siri', 156, 16, 0, 15, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1093, 'Soja cozida', 76, 17, 2, 29, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1105, 'Sopa de milho na mateiga 19g  Knorr Quick®', 157, 19, 12, 77, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1106, 'Sorvete  massa de morango Nestlé®', 62, 100, 27, 186, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1107, 'Sorvete (casquinha) baunilha  (Bobs®)', 157, 124, 39, 220, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1108, 'Sorvete copo light Kibon®', 157, 63, 4, 39, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1109, 'Sorvete copo sundae morango Kibon®', 157, 84, 25, 164, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1110, 'Sorvete cornetto brigadeiro Kibon®', 157, 79, 23, 239, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1111, 'Sorvete cornetto caramelo Kibon®', 157, 75, 28, 224, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1112, 'Sorvete cornetto crocante Kibon®', 157, 72, 27, 247, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1116, 'Sorvete de flocos Nestlé®', 64, 60, 14, 121, 'bola');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1117, 'Sorvete de frutas', 157, 50, 15, 63, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1118, 'Sorvete de massa crocante crunch Nestlé®', 62, 100, 36, 187, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1119, 'Sorvete de massa de abacaxi Nestlé®', 63, 80, 27, 161, 'bola média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1120, 'Sorvete de massa de chiclete Nestlé®', 62, 100, 25, 195, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1121, 'Sorvete de massa de creme Nestlé®', 63, 80, 20, 144, 'bola média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1122, 'Sorvete eskibon  Kibon®', 157, 48, 12, 159, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1123, 'Sorvete la fruta Nestlé®', 62, 100, 27, 108, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1124, 'Sorvete massa galak Nestlé®', 63, 80, 20, 162, 'bola média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1125, 'Sorvete moça doce de leite Nestlé®', 62, 100, 27, 181, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1126, 'Sorvete moça esta brigadeiro Neslté®', 62, 100, 31, 221, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1127, 'Sorvete prestígio Nestlé®', 62, 100, 24, 229, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1128, 'Sorvete sedução manjar branco Nestlé®', 62, 100, 27, 195, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1129, 'Sorvete sedução mousse chocolate Nestlé®', 62, 100, 36, 230, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1130, 'Sorvete sedução romeu e julieta Nestlé®', 62, 100, 29, 185, 'bola grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1131, 'Sorvete sem parar Nestlé®', 152, 110, 39, 217, 'unidade copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1132, 'Sorvete troppo chocolate Nestlé®', 157, 79, 25, 224, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1133, 'Sorvete troppo crocante Nestlé®', 157, 76, 29, 229, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1134, 'Sorvete troppo flocos Nestlé®', 157, 76, 28, 214, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1135, 'Sorvete troppo morango Nestlé®', 157, 79, 30, 942, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1136, 'Spaghetti ao sugo', 14, 110, 22, 170, '01 pegador');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1137, 'Steak tartare', 15, 100, 2, 199, '01 porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1138, 'SteakhouseTM burguer (Burguer King®)', 157, 0, 57, 936, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1139, 'SteakhouseTM junior (Burguer King®)', 157, 0, 33, 560, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1140, 'Strogono de carne', 76, 25, 0, 43, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1141, 'Strogono de frango', 76, 25, 0, 50, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1142, 'Strudel de Amêndoas  (Hungaria®)', 130, 100, 45, 285, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1143, 'Strudel de Frango com Catupiry  (Hungaria®)', 130, 100, 31, 546, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1144, 'Strudel de frango com catupiry  Hungaria®', 130, 100, 31, 546, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1145, 'Strudel de maçã ', 99, 220, 59, 396, 'fatia grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1146, 'Strudel de Maçã (Hungaria®)', 130, 100, 30, 157, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1147, 'Suco de abacaxi com açúcar', 89, 240, 25, 103, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1148, 'Suco de acerola com açúcar', 89, 240, 14, 62, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1149, 'Suco de laranja (envasado)', 89, 240, 26, 116, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1150, 'Suco de laranja (fresco)', 89, 240, 31, 140, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1152, 'Suco de laranja,cenoura sem açúcar', 89, 240, 31, 137, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1153, 'Suco de mamão com açúcar', 89, 240, 22, 91, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1154, 'Suco de manga com açúcar', 89, 240, 23, 96, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1155, 'Suco de manga light Dell Valle®', 93, 200, 9, 37, 'copo');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1156, 'Suco de maracujá com açúcar', 89, 240, 17, 70, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1157, 'Suco de melão com açúcar', 89, 240, 20, 82, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1158, 'Suco de morango', 89, 240, 11, 52, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1159, 'Suco de morango com açúcar', 89, 240, 22, 96, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1160, 'Suco de pessego', 89, 240, 8, 38, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1161, 'Suco de tomate', 89, 240, 11, 58, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1162, 'Suco de tomate enlatado', 89, 240, 10, 49, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1163, 'Suco de uva engarrafado', 89, 240, 36, 151, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1164, 'Suco de uva Kapo ®', 66, 200, 23, 106, 'caixinha');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1165, 'Sucrilhos', 76, 5, 5, 19, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1166, 'Suflê de espinafre', 76, 55, 1, 89, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1167, 'Suflê de legumes', 76, 55, 5, 70, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1169, 'Sundae chocolate (Bobs®)', 157, 172, 80, 463, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1172, 'Super McShake coco (Mc Donalds®)', 92, 300, 50, 312, 'copo pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1173, 'Super McShake flocos (Mc Donalds®)', 92, 300, 63, 334, 'copo pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1174, 'Super McShake morango (Mc Donalds®)', 92, 300, 64, 336, 'copo pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1175, 'Sushi', 155, 22, 14, 57, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1176, 'Sushi de Atum', 157, 30, 7, 40, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1177, 'Sushi de Salmao', 157, 30, 7, 38, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1178, 'Suspiro', 155, 10, 9, 38, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1179, 'Sustagem', 76, 16, 10, 62, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1180, 'Tablete Alpino® Diet', 157, 30, 17, 143, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1181, 'Taça Habibs®', 157, 330, 69, 554, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1182, 'Tainha', 134, 100, 0, 204, 'posta pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1183, 'Tâmara seca', 157, 10, 7, 28, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1184, 'Tambaqui (lé cru)', 120, 100, 0, 151, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1185, 'Tangerina', 155, 135, 15, 67, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1186, 'Tapioca pronta', 156, 100, 43, 174, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1187, 'Tapioquinha com queijo e coco ralado', 156, 100, 62, 430, 'unidade pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1188, 'Tapioquinha com tucumã', 155, 100, 48, 360, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1189, 'Tartar de salmão', 157, 63, 1, 178, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1190, 'Tartar de salmão com molho sour cream', 132, 100, 5, 265, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1191, 'Tarte de bacalhau', 155, 90, 27, 282, 'unidade média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1192, 'Tatu (carne) recheado com lingüiça', 104, 100, 3, 259, 'fatia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1193, 'Temaki (média)', 157, 120, 24, 258, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1194, 'Temaki de Atum', 157, 100, 18, 157, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1195, 'Temaki de Salmao', 157, 100, 18, 190, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1196, 'Tempero Maggi® amaciante de carnes', 76, 10, 2, 14, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1197, 'Tempero Maggi® fondor', 76, 10, 2, 14, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1199, 'Terrine ligth (peito de peru)', 132, 130, 14, 131, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1200, 'Tiramissu ', 132, 100, 21, 364, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1201, 'Tiramissú de frutas', 146, 200, 23, 138, 'taça');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1202, 'Tomate, purê de (enlatado)', 76, 20, 1, 8, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1206, 'Torradas', 157, 8, 5, 25, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1207, 'Torradas alho,água e sal Casa Victoriana®', 40, 30, 16, 150, '10 unidades');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1209, 'Torresmo', 76, 10, 0, 54, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1210, 'Torta Alemã', 103, 50, 16, 192, 'fatia pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1212, 'Torta de carne ', 101, 85, 16, 209, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1213, 'Torta de frango', 101, 85, 16, 200, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1216, 'Torta holandesa', 130, 60, 22, 181, 'porção pequena');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1217, 'Torta mousse de limão  Miss Daisy®', 39, 60, 16, 121, '1/8 do pacote');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1218, 'Torta quente (Burguer King®)', 157, 0, 24, 142, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1219, 'Tortellini com recheio de carne', 132, 190, 33, 367, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1221, 'Trigo cozido', 76, 25, 6, 28, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1222, 'Trigo em grão', 76, 25, 20, 91, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1223, 'Trigo, bolo de', 101, 60, 36, 203, 'fatia média');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1224, 'Triplo cheese (Bobs®)', 157, 245, 35, 694, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1225, 'Trufa de chocolate', 153, 30, 15, 140, 'unidade grande');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1226, 'Tucumã descascado', 76, 30, 2, 142, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1227, 'Tucunaré (lé cru)', 120, 100, 0, 102, 'pedaço médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1228, 'Tutu de feijão', 76, 20, 7, 43, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1229, 'Uramaki califórnia ', 157, 20, 10, 47, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1230, 'Uramaki salmão', 157, 22, 10, 62, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1231, 'Uramaki salmão', 157, 22, 10, 62, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1232, 'Uva comum', 157, 8, 1, 6, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1233, 'Uva do tipo européia', 65, 100, 18, 79, 'cacho pequeno');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1234, 'Uva itália (uva verde)', 157, 8, 1, 6, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1235, 'Uva passa', 4, 18, 14, 55, '01 colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1236, 'Vaca atolada', 83, 100, 3, 259, 'concha média cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1237, 'Vagem comum em conserva', 76, 20, 1, 4, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1238, 'Vagem cozida', 76, 20, 2, 8, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1239, 'Vatapá', 157, 100, 9, 127, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1240, 'Vinagre', 76, 10, 0, 2, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1241, 'Vinho (média)', 146, 150, 6, 26, 'taça');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1242, 'Vinho branco', 146, 150, 5, 21, 'taça');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1243, 'Vinho branco seco', 146, 150, 0, 99, 'taça');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1244, 'Vinho de jenipapo', 146, 150, 38, 152, 'taça');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1246, 'Vitamina de fruta com suco', 89, 240, 49, 223, 'copo duplo cheio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1247, 'Waffer®- média sabores', 157, 7.5, 3, 21, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1248, 'Whopper JR® com queijo (Burguer King®)', 157, 0, 31, 464, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1249, 'Whopper® com queijo (Burguer King®)', 157, 0, 52, 757, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1250, 'Whopper® duplo com queijo  (Burguer King®)', 157, 0, 52, 978, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1251, 'Xinxim de galinha', 132, 150, 1, 358, 'porção');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1252, 'Yakult®', 157, 80, 11, 50, 'unidade');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (1, 'Abacate (picado)', 76, 45, 3, 79, 'colher de sopa cheia');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (909, 'Pirarucu', 111, 100, 0, 120, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (275, 'Carne de boi, maminha', 111, 100, 0, 199, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (572, 'Hipoglosso (peixe) cozido', 111, 100, 0, 127, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (701, 'Merluza assada', 111, 100, 0, 122, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (777, 'Namorado cozido', 111, 100, 0, 121, 'filé médio');
INSERT INTO public.foods (id, name, measure_id, qtd, cho, kcal, measure) VALUES (879, 'Peixe de água doce cozido (média)', 111, 120, 0, 117, 'filé médio');


--
-- TOC entry 2865 (class 0 OID 692179)
-- Dependencies: 205
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (25, 10, 0, 12, 0.800000000000000044, 21.0700000000000003, 1);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (28, 15, 0, 0, 0, 32, 15);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (29, 14, 0, 43, 4.29999999999999982, 19.3500000000000014, 112);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (30, 14, 0, 0, 32, 22.8599999999999994, 49);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (32, 15, 0, 22, 0, 3.29999999999999982, 12);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (33, 15, 0, 321, 67.4099999999999966, 353.100000000000023, 17);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (38, 16, 0, 200, 26.6700000000000017, 117.329999999999998, 2);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (41, 16, 0, 111, 7.40000000000000036, 194.870000000000005, 1);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (42, 17, 0, 0, 12, 1.33000000000000007, 9);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (47, 23, 0, 32, 4.70999999999999996, 182.590000000000003, 54);
INSERT INTO public.items (id, meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES (48, 23, 0, 200, 0, 55.5600000000000023, 7);


--
-- TOC entry 2860 (class 0 OID 692132)
-- Dependencies: 200
-- Data for Name: meal_types; Type: TABLE DATA; Schema: public; Owner: vindixit
--

INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (1, 'Café da Manhã', '06:00:00', '09:00:00');
INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (2, 'Almoço', '11:30:00', '14:00:00');
INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (3, 'Jantar', '17:00:00', '19:00:00');
INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (4, 'Lanche da Manhã', '09:00:00', '11:30:00');
INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (5, 'Lanche da Tarde', '14:00:00', '17:00:00');
INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (6, 'Ceia', '19:00:00', '21:00:00');
INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (7, 'Lanche Noturno', '21:00:00', '06:00:00');


--
-- TOC entry 2857 (class 0 OID 642683)
-- Dependencies: 197
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: vindixit
--

INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (16, 1, 0, '07:15:00', NULL, '2020-08-18');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (17, 7, 0, '21:37:00', NULL, '2020-08-19');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (18, 4, 0, '11:27:00', NULL, '2020-08-24');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (19, 4, 0, '11:27:00', NULL, '2020-08-24');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (20, 4, 0, '11:27:00', NULL, '2020-08-24');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (23, 7, 23, '21:39:00', NULL, '2020-08-24');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (14, 1, 0, '07:03:00', NULL, '2020-08-18');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (10, 2, 0, '13:32:00', NULL, '2020-08-17');
INSERT INTO public.meals (id, meal_type_id, bolus, start_at, end_at, date) VALUES (15, 1, 0, '07:08:00', NULL, '2020-08-18');


--
-- TOC entry 2861 (class 0 OID 692138)
-- Dependencies: 201
-- Data for Name: measures; Type: TABLE DATA; Schema: public; Owner: postgres
--

db.Exec("INSERT INTO public.measures (id, name) VALUES (3, '01 colher de chá cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (9, '01 fatia fina');
db.Exec("INSERT INTO public.measures (id, name) VALUES (28, '1 posta ou filé');
db.Exec("INSERT INTO public.measures (id, name) VALUES (2, '01 bola');
db.Exec("INSERT INTO public.measures (id, name) VALUES (4, '01 colher de sopa cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (5, '01 colher de sopa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (6, '01 concha pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (7, '01 copo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (8, '01 escumadeira cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (10, '01 fatia pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (11, '01 fatia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (12, '01 metade');
db.Exec("INSERT INTO public.measures (id, name) VALUES (13, '01 pedaço pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (14, '01 pegador');
db.Exec("INSERT INTO public.measures (id, name) VALUES (15, '01 porção pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (16, '01 potinho pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (17, '01 torrada');
db.Exec("INSERT INTO public.measures (id, name) VALUES (18, '01 unidade  pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (19, '01 unidade média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (21, '01 unidade pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (22, '01 unidade');
db.Exec("INSERT INTO public.measures (id, name) VALUES (23, '1 e 1/2 xícara');
db.Exec("INSERT INTO public.measures (id, name) VALUES (24, '1 fatia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (26, '1 pedaço médio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (27, '1 porção');
db.Exec("INSERT INTO public.measures (id, name) VALUES (29, '1 und');
db.Exec("INSERT INTO public.measures (id, name) VALUES (30, '1 unidade');
db.Exec("INSERT INTO public.measures (id, name) VALUES (31, '1 xícara');
db.Exec("INSERT INTO public.measures (id, name) VALUES (32, '1/2 copo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (33, '1/2 unidade');
db.Exec("INSERT INTO public.measures (id, name) VALUES (34, '1/2 xícara de chá');
db.Exec("INSERT INTO public.measures (id, name) VALUES (35, '1/2 xícara');
db.Exec("INSERT INTO public.measures (id, name) VALUES (36, '1/4 barra');
db.Exec("INSERT INTO public.measures (id, name) VALUES (37, '1/4 unidade');
db.Exec("INSERT INTO public.measures (id, name) VALUES (38, '1/4 xícara de chá');
db.Exec("INSERT INTO public.measures (id, name) VALUES (39, '1/8 do pacote');
db.Exec("INSERT INTO public.measures (id, name) VALUES (40, '10 unidades');
db.Exec("INSERT INTO public.measures (id, name) VALUES (41, '17 unidades pequenos');
db.Exec("INSERT INTO public.measures (id, name) VALUES (42, '2 ¹/² fatia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (43, '2 colheres de copa cheias');
db.Exec("INSERT INTO public.measures (id, name) VALUES (44, '2 colheres de sopa cheias');
db.Exec("INSERT INTO public.measures (id, name) VALUES (45, '2 colheres de sopa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (46, '2 dentes');
db.Exec("INSERT INTO public.measures (id, name) VALUES (47, '2 discos de massa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (48, '2 fatias');
db.Exec("INSERT INTO public.measures (id, name) VALUES (49, '2 unidades');
db.Exec("INSERT INTO public.measures (id, name) VALUES (50, '2/3 xícara de chá');
db.Exec("INSERT INTO public.measures (id, name) VALUES (51, '3 colheres de sopa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (52, '3/4 de xícara');
db.Exec("INSERT INTO public.measures (id, name) VALUES (53, '3/4 xícara');
db.Exec("INSERT INTO public.measures (id, name) VALUES (54, '4 fatias');
db.Exec("INSERT INTO public.measures (id, name) VALUES (55, '4 unidades médias');
db.Exec("INSERT INTO public.measures (id, name) VALUES (56, '4 unidades');
db.Exec("INSERT INTO public.measures (id, name) VALUES (57, '6 colheres de sopa rasas');
db.Exec("INSERT INTO public.measures (id, name) VALUES (58, '6 unidades');
db.Exec("INSERT INTO public.measures (id, name) VALUES (59, 'bago  médio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (60, 'barra pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (61, 'bife médio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (62, 'bola grande');
db.Exec("INSERT INTO public.measures (id, name) VALUES (63, 'bola média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (64, 'bola');
db.Exec("INSERT INTO public.measures (id, name) VALUES (65, 'cacho pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (66, 'caixinha');
db.Exec("INSERT INTO public.measures (id, name) VALUES (67, 'cálice');
db.Exec("INSERT INTO public.measures (id, name) VALUES (68, 'colher (sopa) cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (69, 'colher de arroz cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (70, 'colher de chá');
db.Exec("INSERT INTO public.measures (id, name) VALUES (71, 'colher de servir');
db.Exec("INSERT INTO public.measures (id, name) VALUES (72, 'colher de sobremesa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (73, 'colher de sopa (molho)');
db.Exec("INSERT INTO public.measures (id, name) VALUES (74, 'colher de sopa cheia picada');
db.Exec("INSERT INTO public.measures (id, name) VALUES (75, 'colher de sopa cheia picado');
db.Exec("INSERT INTO public.measures (id, name) VALUES (76, 'colher de sopa cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (77, 'colher de sopa rasa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (78, 'colher de sopa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (79, 'colher do sopa cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (80, 'colher sopa (cheia)');
db.Exec("INSERT INTO public.measures (id, name) VALUES (81, 'colher sopa cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (82, 'colher sopa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (83, 'concha média cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (84, 'concha média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (85, 'concha pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (86, 'concha');
db.Exec("INSERT INTO public.measures (id, name) VALUES (87, 'copo de milk shake');
db.Exec("INSERT INTO public.measures (id, name) VALUES (88, 'copo descartável pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (89, 'copo duplo cheio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (90, 'copo duplo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (91, 'copo grande');
db.Exec("INSERT INTO public.measures (id, name) VALUES (92, 'copo pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (93, 'copo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (94, 'cuia média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (95, 'dose');
db.Exec("INSERT INTO public.measures (id, name) VALUES (96, 'escumadeira cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (97, 'escumadeira media cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (98, 'escumadeira');
db.Exec("INSERT INTO public.measures (id, name) VALUES (99, 'fatia grande');
db.Exec("INSERT INTO public.measures (id, name) VALUES (101, 'fatia média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (103, 'fatia pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (104, 'fatia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (105, 'folha média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (106, 'garrafa pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (107, 'garrafa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (108, 'garranha');
db.Exec("INSERT INTO public.measures (id, name) VALUES (109, 'gomo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (110, 'lata');
db.Exec("INSERT INTO public.measures (id, name) VALUES (113, 'média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (114, 'meia unidade');
db.Exec("INSERT INTO public.measures (id, name) VALUES (115, 'pacote pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (116, 'pacote');
db.Exec("INSERT INTO public.measures (id, name) VALUES (117, 'pedaço grande');
db.Exec("INSERT INTO public.measures (id, name) VALUES (120, 'pedaço médio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (121, 'pedaço pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (122, 'pegador');
db.Exec("INSERT INTO public.measures (id, name) VALUES (123, 'porção de 10 unidades');
db.Exec("INSERT INTO public.measures (id, name) VALUES (124, 'porção de 15cm');
db.Exec("INSERT INTO public.measures (id, name) VALUES (125, 'porção de 4 unidades');
db.Exec("INSERT INTO public.measures (id, name) VALUES (126, 'porção de 6 unidades');
db.Exec("INSERT INTO public.measures (id, name) VALUES (127, 'porção grande');
db.Exec("INSERT INTO public.measures (id, name) VALUES (128, 'porção média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (130, 'porção pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (132, 'porção');
db.Exec("INSERT INTO public.measures (id, name) VALUES (133, 'posta média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (134, 'posta pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (135, 'pote');
db.Exec("INSERT INTO public.measures (id, name) VALUES (136, 'prato');
db.Exec("INSERT INTO public.measures (id, name) VALUES (137, 'punhado');
db.Exec("INSERT INTO public.measures (id, name) VALUES (138, 'ramo médio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (139, 'rodela média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (141, 'saco médio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (142, 'sobrecoxa média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (143, 'sobrecoxa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (144, 'tablete');
db.Exec("INSERT INTO public.measures (id, name) VALUES (145, 'taça pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (146, 'taça');
db.Exec("INSERT INTO public.measures (id, name) VALUES (147, 'tulipa');
db.Exec("INSERT INTO public.measures (id, name) VALUES (148, 'um ovo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (149, 'unidade (inteira)');
db.Exec("INSERT INTO public.measures (id, name) VALUES (150, 'unidade aperitivo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (151, 'unidade comercial');
db.Exec("INSERT INTO public.measures (id, name) VALUES (152, 'unidade copo');
db.Exec("INSERT INTO public.measures (id, name) VALUES (153, 'unidade grande');
db.Exec("INSERT INTO public.measures (id, name) VALUES (155, 'unidade média');
db.Exec("INSERT INTO public.measures (id, name) VALUES (156, 'unidade pequena');
db.Exec("INSERT INTO public.measures (id, name) VALUES (157, 'unidade');
db.Exec("INSERT INTO public.measures (id, name) VALUES (158, 'xicara de café');
db.Exec("INSERT INTO public.measures (id, name) VALUES (25, '1 filé pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (111, 'filé médio');
db.Exec("INSERT INTO public.measures (id, name) VALUES (112, 'filé pequeno');
db.Exec("INSERT INTO public.measures (id, name) VALUES (159, 'xícara de café');
db.Exec("INSERT INTO public.measures (id, name) VALUES (160, 'xícara de chá cheia');
db.Exec("INSERT INTO public.measures (id, name) VALUES (161, 'xícara');
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2858 (class 0 OID 692112)
db.Exec("-- Dependencies: 198
db.Exec("-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("INSERT INTO public.users (id, username, password, role) VALUES (1, 'aria', '$2a$14$C1DIYDsmE0QHjje4wR5uwOAC7m8/YAUe8DYw/yuKIAQgRDibeCDMy', 'admin');
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2873 (class 0 OID 0)
db.Exec("-- Dependencies: 204
db.Exec("-- Name: foods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("SELECT pg_catalog.setval('public.foods_id_seq', 1254, true);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2874 (class 0 OID 0)
db.Exec("-- Dependencies: 206
db.Exec("-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("SELECT pg_catalog.setval('public.items_id_seq', 49, true);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2875 (class 0 OID 0)
db.Exec("-- Dependencies: 199
db.Exec("-- Name: meal_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("SELECT pg_catalog.setval('public.meal_type_id_seq', 7, true);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2876 (class 0 OID 0)
db.Exec("-- Dependencies: 196
db.Exec("-- Name: meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vindixit
db.Exec("--
db.Exec("
db.Exec("SELECT pg_catalog.setval('public.meals_id_seq', 23, true);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2877 (class 0 OID 0)
db.Exec("-- Dependencies: 202
db.Exec("-- Name: measures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("SELECT pg_catalog.setval('public.measures_id_seq', 3, true);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2731 (class 2606 OID 692183)
db.Exec("-- Name: items Items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.items
db.Exec("    ADD CONSTRAINT "Items_pkey" PRIMARY KEY (id);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2729 (class 2606 OID 692162)
db.Exec("-- Name: foods foods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.foods
db.Exec("    ADD CONSTRAINT foods_pkey PRIMARY KEY (id);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2725 (class 2606 OID 692185)
db.Exec("-- Name: meal_types meal_types_pkey; Type: CONSTRAINT; Schema: public; Owner: vindixit
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.meal_types
db.Exec("    ADD CONSTRAINT meal_types_pkey PRIMARY KEY (id);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2721 (class 2606 OID 642688)
db.Exec("-- Name: meals meals_pkey; Type: CONSTRAINT; Schema: public; Owner: vindixit
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.meals
db.Exec("    ADD CONSTRAINT meals_pkey PRIMARY KEY (id);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2727 (class 2606 OID 692142)
db.Exec("-- Name: measures measures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.measures
db.Exec("    ADD CONSTRAINT measures_pkey PRIMARY KEY (id);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2723 (class 2606 OID 692119)
db.Exec("-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.users
db.Exec("    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2734 (class 2606 OID 692201)
db.Exec("-- Name: items foods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.items ADD CONSTRAINT foods_fkey FOREIGN KEY (food_id) REFERENCES public.foods(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2732 (class 2606 OID 692186)
db.Exec("-- Name: meals meal_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vindixit
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.meals ADD CONSTRAINT meal_types_fkey FOREIGN KEY (meal_type_id) REFERENCES public.meal_types(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
db.Exec("
db.Exec("
db.Exec("--
db.Exec("-- TOC entry 2733 (class 2606 OID 692191)
db.Exec("-- Name: items meals_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
db.Exec("--
db.Exec("
db.Exec("ALTER TABLE ONLY public.items ADD CONSTRAINT meals_fkey FOREIGN KEY (meal_id) REFERENCES public.meals(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
db.Exec("
db.Exec("
db.Exec("-- Completed on 2020-09-18 15:03:52
db.Exec("
db.Exec("--
db.Exec("-- PostgreSQL database dump complete
db.Exec("--
db.Exec("
db.Exec("