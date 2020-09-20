package db

import (
	"database/sql"
	hd "diaria/handlers"
	"log"
)

var db *sql.DB

func Initialize() {
	db = hd.Db
	createSeq()
	createTables()
	createFeatures()
	createRoleAdmin()
	createRoleFeatures()
	createAdmin()
	createPKey()
	createFKey()
	createUniqueKey()
}

func createRoleAdmin() {
	query := " INSERT INTO roles (id, name) " +
		" SELECT 1, 'Admin' " +
		" WHERE NOT EXISTS (SELECT id FROM roles WHERE name = 'Admin')"
	log.Println(query)
	db.Exec(query)
}

func createRoleFeatures() {
	query := " INSERT INTO features_roles (id, role_id, feature_id) VALUES (1, 1, 1) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (2, 1, 2) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (3, 1, 3) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (4, 1, 4) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (5, 1, 5) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (6, 1, 6) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (7, 1, 7) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (8, 1, 8) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (9, 1, 9) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (10, 1, 10) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (11, 1, 11) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (12, 1, 12) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (13, 1, 13) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (14, 1, 14) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (15, 1, 15) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (16, 1, 16) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (17, 1, 17) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (18, 1, 18) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (19, 1, 19) "
	//log.Println(query)
	db.Exec(query)
	query = " INSERT INTO features_roles (id, role_id, feature_id) VALUES (20, 1, 20) "
	//log.Println(query)
	db.Exec(query)
}

func createFKey() {
	db.Exec("ALTER TABLE ONLY public.items " +
		" ADD CONSTRAINT foods_fkey FOREIGN KEY (food_id) " +
		" REFERENCES public.foods(id) " +
		" ON UPDATE RESTRICT ON DELETE RESTRICT")
	db.Exec("ALTER TABLE ONLY public.meals " +
		" ADD CONSTRAINT meal_types_fkey FOREIGN KEY (meal_type_id) " +
		" REFERENCES public.meal_types(id) ON UPDATE RESTRICT ON DELETE RESTRICT")
	db.Exec("ALTER TABLE ONLY public.items " +
		" ADD CONSTRAINT meals_fkey FOREIGN KEY (meal_id)  " +
		" REFERENCES public.meals(id) ON UPDATE RESTRICT ON DELETE RESTRICT")
	db.Exec("ALTER TABLE ONLY public.foods " +
		" ADD CONSTRAINT measures_fkey FOREIGN KEY (measure_id)  " +
		" REFERENCES public.measures(id) ON UPDATE RESTRICT ON DELETE RESTRICT")
	db.Exec("ALTER TABLE ONLY public.features_roles " +
		" ADD CONSTRAINT features_fkey FOREIGN KEY (feature_id)" +
		" REFERENCES public.features (id) MATCH SIMPLE" +
		" ON UPDATE RESTRICT" +
		" ON DELETE RESTRICT")
	db.Exec("ALTER TABLE ONLY public.features_roles " +
		" ADD CONSTRAINT roles_fkey FOREIGN KEY (role_id)" +
		" REFERENCES public.roles (id) MATCH SIMPLE" +
		" ON UPDATE RESTRICT" +
		" ON DELETE RESTRICT")
	db.Exec("ALTER TABLE ONLY public.meals ADD CONSTRAINT authors_fkey FOREIGN KEY (author_id)" +
		" REFERENCES public.users (id) MATCH SIMPLE" +
		" ON UPDATE RESTRICT" +
		" ON DELETE RESTRICT")

}

func createPKey() {
	db.Exec("ALTER TABLE ONLY public.items ADD CONSTRAINT items_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.foods ADD CONSTRAINT foods_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.meal_types ADD CONSTRAINT meal_types_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.meals ADD CONSTRAINT meals_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.measures ADD CONSTRAINT measures_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.users ADD CONSTRAINT users_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.roles ADD CONSTRAINT roles_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.features ADD CONSTRAINT features_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.features_roles ADD CONSTRAINT features_roles_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.bonds ADD CONSTRAINT bonds_pkey PRIMARY KEY (id)")
}

func createAdmin() {
	query := "INSERT INTO users (id, username, password, email, mobile, name, role_id)" +
		" SELECT 1, 'aria', '$2a$14$C1DIYDsmE0QHjje4wR5uwOAC7m8/YAUe8DYw/yuKIAQgRDibeCDMy', " +
		" 'aria@vindixit.com', '61 984385415', 'Ária Ohashi', 1" +
		" WHERE NOT EXISTS (SELECT id FROM users WHERE username = 'aria')"
	log.Println(query)
	db.Exec(query)
}

func createSeq() {
	// Sequence FOODS_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.foods_id_seq " +
		" START WITH 1260" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence ITEMS_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.items_id_seq " +
		" START WITH 1" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence MEAL_TYPE_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.meal_type_id_seq " +
		" START WITH 7" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence MEALS_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.meals_id_seq " +
		" START WITH 1" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence MEASURES_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.measures_id_seq " +
		" START WITH 165" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence ROLES_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.roles_id_seq " +
		" START WITH 1" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence FEATURES_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.features_id_seq " +
		" START WITH 18" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence FEATURES_ROLES_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.features_roles_id_seq " +
		" START WITH 18" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence BONDS_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.bonds_id_seq " +
		" START WITH 1" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
	// Sequence USERS_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.users_id_seq " +
		" START WITH 2" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
}

func createDropTable() {
	db.Exec(" DROP TABLE public.users")
}

func createTables() {
	// Table MEASURES
	db.Exec("CREATE TABLE public.measures ( " +
		"id integer DEFAULT nextval('public.measures_id_seq'::regclass) NOT NULL, " +
		"name character varying(255) NOT NULL)")

	// Table FOODS
	db.Exec(" CREATE TABLE public.foods (" +
		" id integer DEFAULT nextval('public.foods_id_seq'::regclass) NOT NULL, " +
		" name character varying(25) NOT NULL, " +
		" measure_id integer, " +
		" qtd double precision, " +
		" cho double precision, " +
		" kcal double precision, " +
		" measure character varying(255), " +
		" approved boolean DEFAULT false)")

	// Table ITEMS
	db.Exec(
		" CREATE TABLE public.items ( " +
			" id integer DEFAULT nextval('public.items_id_seq'::regclass) NOT NULL, " +
			" meal_id integer, " +
			" quantidade_medida_usual double precision, " +
			" quantidade_g_ml double precision, " +
			" cho double precision, " +
			" kcal double precision, " +
			" food_id integer )")

	// Table MEAL_TYPES
	db.Exec(
		" CREATE TABLE public.meal_types ( " +
			" id integer DEFAULT nextval('public.meal_type_id_seq'::regclass) NOT NULL, " +
			" name character varying(20) NOT NULL, " +
			" start_at time without time zone, " +
			" end_at time without time zone )")

	// Table MEALS
	db.Exec(
		" CREATE TABLE public.meals ( " +
			" id integer NOT NULL  DEFAULT nextval('meals_id_seq'::regclass), " +
			" meal_type_id integer, " +
			" bolus double precision, " +
			" start_at time without time zone, " +
			" end_at time without time zone, " +
			" date date, " +
			" author_id integer)")

	// Table ROLES
	db.Exec(
		" CREATE TABLE IF NOT EXISTS public.roles  (" +
			" id integer DEFAULT nextval('public.roles_id_seq'::regclass) NOT NULL," +
			" name character varying(255) NOT NULL)")

	// Table FEATURES
	db.Exec(
		" CREATE TABLE IF NOT EXISTS public.features  (" +
			" id integer DEFAULT nextval('public.features_id_seq'::regclass) NOT NULL," +
			" name character varying(255) NOT NULL," +
			" code character varying(255) NOT NULL)")

	// Table FEATURES_ROLES
	db.Exec(
		" CREATE TABLE public.features_roles (" +
			" id integer DEFAULT nextval('features_roles_id_seq'::regclass)," +
			" feature_id integer," +
			" role_id integer)")

	// Table USERS
	db.Exec(
		" CREATE TABLE IF NOT EXISTS public.users (" +
			" id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL," +
			" username character varying(255) NOT NULL," +
			" password character varying(255) NOT NULL," +
			" email character varying(255) NOT NULL," +
			" mobile character varying(255) NOT NULL," +
			" role_id integer NOT NULL," +
			" name character varying(255))")

	// Table BONDS
	db.Exec(
		" CREATE TABLE public.bonds (" +
			" id integer DEFAULT nextval('bonds_id_seq'::regclass)," +
			" service_provider_id integer," +
			" service_consumer_id integer)")

}

func createUniqueKey() {
	db.Exec(" ALTER TABLE ONLY public.features_roles" +
		" ADD CONSTRAINT feature_role_unique_key UNIQUE (role_id, feature_id)")
	db.Exec(" ALTER TABLE ONLY public.bonds" +
		" ADD CONSTRAINT bond_unique_key UNIQUE (service_provider_id, service_consumer_id)")
}

func createFeatures() {
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (1, 'Listar Tipos de Refeições', 'listMealTypes')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (2, 'Criar Tipo de Refeição', 'createMealType')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (3, 'Listar Refeições', 'listMeals')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (4, 'Criar Refeição', 'createMeal')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (5, 'Listar Papéis', 'listRoles')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (6, 'Criar Papel', 'createRole')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (7, 'Listar Itens', 'listItems')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (8, 'Criar Item', 'createItem')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (9, 'Listar Funcionalidades', 'listFeatures')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (10, 'Criar Funcionalidade', 'createFeature')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (11, 'Listar Medidas', 'listMeasures')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (12, 'Criar Medida', 'createMeasure')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (13, 'Listar Alimentos', 'listFoods')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (14, 'Criar Alimento', 'createFood')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (15, 'Listar Usuários', 'listUsers')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (16, 'Criar Usuário', 'createUser')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (17, 'Listar Minhas Refeições', 'listMyMeals')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (18, 'Listar Meus Vínculos', 'listMyBonds')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (19, 'Criar Vínculo', 'createBond')")
	db.Exec("INSERT INTO public.features (id, name, code) VALUES (20, 'Listar Refeicoes dos Clientes', 'listBondsMeals')")
}
