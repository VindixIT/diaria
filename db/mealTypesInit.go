package db

import (
	hd "beerwh/handlers"
)

func InitMealTypes() {
	db = hd.Db
	db.Exec("INSERT INTO public.meal_types (name, start_at, end_at) VALUES ('Café da Manhã', '06:00:00', '09:00:00')")
	db.Exec("INSERT INTO public.meal_types (name, start_at, end_at) VALUES ('Almoço', '11:30:00', '14:00:00')")
	db.Exec("INSERT INTO public.meal_types (name, start_at, end_at) VALUES ('Jantar', '17:00:00', '19:00:00')")
	db.Exec("INSERT INTO public.meal_types (name, start_at, end_at) VALUES ('Lanche da Manhã', '09:00:00', '11:30:00')")
	db.Exec("INSERT INTO public.meal_types (name, start_at, end_at) VALUES ('Lanche da Tarde', '14:00:00', '17:00:00')")
	db.Exec("INSERT INTO public.meal_types (name, start_at, end_at) VALUES ('Ceia', '19:00:00', '21:00:00')")
	db.Exec("INSERT INTO public.meal_types (name, start_at, end_at) VALUES ('Lanche Noturno', '21:00:00', '06:00:00')")
	db.Exec("SELECT pg_catalog.setval('public.meal_type_id_seq', 8, true)")
}
