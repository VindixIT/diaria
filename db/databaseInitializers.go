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
	//	createDropTable()
	createTable()
	createAdmin()
	createPKey()
	createFKey()
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
}

func createPKey() {
	db.Exec("ALTER TABLE ONLY public.items ADD CONSTRAINT items_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.foods ADD CONSTRAINT foods_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.meal_types ADD CONSTRAINT meal_types_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.meals ADD CONSTRAINT meals_pkey PRIMARY KEY (id)")
	db.Exec("ALTER TABLE ONLY public.users ADD CONSTRAINT users_pkey PRIMARY KEY (id)")
}

func createAdmin() {
	query := "INSERT INTO public.users (id, username, password, role) " +
		" VALUES (1, 'aria', '$2a$14$C1DIYDsmE0QHjje4wR5uwOAC7m8/YAUe8DYw/yuKIAQgRDibeCDMy', 'admin')"
	log.Println(query)
	db.Exec(query)
}

func createSeq() {
	// Sequence FOODS_ID_SEQ
	db.Exec("CREATE SEQUENCE IF NOT EXISTS public.foods_id_seq " +
		" START WITH 1" +
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
		" START WITH 1" +
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
		" START WITH 1" +
		" INCREMENT BY 1" +
		" NO MINVALUE" +
		" NO MAXVALUE" +
		" CACHE 1")
}

func createDropTable() {
	db.Exec(" DROP TABLE public.users")
}

func createTable() {

	// Table FOODS
	db.Exec(" CREATE TABLE public.foods (" +
		" id integer DEFAULT nextval('public.foods_id_seq'::regclass) NOT NULL, " +
		" name character varying(255) NOT NULL, " +
		" measure_id integer, " +
		" qtd double precision, " +
		" cho double precision, " +
		" kcal double precision, " +
		" measure character varying(255) " +
		" )")

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
			" date date)")

	// Table USERS
	db.Exec(
		" CREATE TABLE public.users ( " +
			" id integer NOT NULL, " +
			" username character varying(255) NOT NULL, " +
			" password character varying(255) NOT NULL, " +
			" role character varying(255) )")

}
