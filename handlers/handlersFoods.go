package handlers

import (
	mdl "diaria/models"
	sec "diaria/security"
	"html/template"
	"log"
	"net/http"
	"strconv"
)

func CreateFoodHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Create Food")
	if r.Method == "POST" {
		name := r.FormValue("Name")
		measure := r.FormValue("Measure")
		qtd := r.FormValue("Qtd")
		cho := r.FormValue("Cho")
		kcal := r.FormValue("Kcal")
		sqlStatement := "INSERT INTO foods(name, measure, qtd, cho, kcal) VALUES ($1, $2, $3, $4, $5) RETURNING id"
		id := 0
		err := Db.QueryRow(sqlStatement, name, measure, qtd, cho, kcal).Scan(&id)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		log.Println("INSERT: Id: " + strconv.Itoa(id) + " | Name: " + name + " | Measure: " + measure + " | Qtd: " + qtd + " | Cho: " + cho + " | Kcal: " + kcal)
	}
	http.Redirect(w, r, "/listFoods", 301)
}

func UpdateFoodHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Update Food")
	if r.Method == "POST" {
		id := r.FormValue("Id")
		name := r.FormValue("Name")
		measure := r.FormValue("Measure")
		qtd := r.FormValue("Qtd")
		cho := r.FormValue("Cho")
		kcal := r.FormValue("Kcal")
		sqlStatement := "UPDATE foods SET name=$1, measure=$2, qtd=$3, cho=$4, kcal=$5 WHERE id=$6"
		updtForm, err := Db.Prepare(sqlStatement)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		updtForm.Exec(name, measure, qtd, cho, kcal, id)
		log.Println("UPDATE: Id: " + id + " | Name: " + name + " | Measure: " + measure + " | Qtd: " + qtd + " | Cho: " + cho + " | Kcal: " + kcal)
	}
	http.Redirect(w, r, "/listFoods", 301)
}

func DeleteFoodHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Delete Food")
	if r.Method == "POST" {
		id := r.FormValue("Id")
		sqlStatement := "DELETE FROM foods WHERE id=$1"
		deleteForm, err := Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)
		sec.CheckInternalServerError(err, w)
		log.Println("DELETE: Id: " + id)
	}
	http.Redirect(w, r, "/listFoods", 301)
}

func ListFoodsHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("List Alimentos")
	//sec.IsAuthenticated(w, r)
	rows, err := Db.Query("SELECT id, name, measure, qtd, cho, kcal FROM foods order by id asc")
	sec.CheckInternalServerError(err, w)
	var funcMap = template.FuncMap{
		"multiplication": func(n float64, f float64) float64 {
			return n * f
		},
		"addOne": func(n int) int {
			return n + 1
		},
	}
	var foods []mdl.Food
	var food mdl.Food
	for rows.Next() {
		err = rows.Scan(&food.Id, &food.Name, &food.Measure, &food.Qtd, &food.Cho, &food.Kcal)
		sec.CheckInternalServerError(err, w)
		foods = append(foods, food)
	}
	t, err := template.New("listFoods.html").Funcs(funcMap).ParseFiles("tmpl/listFoods.html")
	sec.CheckInternalServerError(err, w)
	err = t.Execute(w, foods)
	sec.CheckInternalServerError(err, w)
}
