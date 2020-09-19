package db

import (
	hd "diaria/handlers"
)

func InitMealTypes() {
	db = hd.Db
	db.Exec("INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (1, 'Café da Manhã', '06:00:00', '09:00:00')")
	db.Exec("INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (2, 'Almoço', '11:30:00', '14:00:00')")
	db.Exec("INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (3, 'Jantar', '17:00:00', '19:00:00')")
	db.Exec("INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (4, 'Lanche da Manhã', '09:00:00', '11:30:00')")
	db.Exec("INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (5, 'Lanche da Tarde', '14:00:00', '17:00:00')")
	db.Exec("INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (6, 'Ceia', '19:00:00', '21:00:00')")
	db.Exec("INSERT INTO public.meal_types (id, name, start_at, end_at) VALUES (7, 'Lanche Noturno', '21:00:00', '06:00:00')")
}
