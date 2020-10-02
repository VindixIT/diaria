package handlers

import (
	mdl "diaria/models"
	route "diaria/routes"
	sec "diaria/security"
	"html/template"
	"log"
	"net/http"
	"strconv"
)

func CreateMealTypeHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Create Meal Type")
	if r.Method == "POST" && sec.IsAuthenticated(w, r) {
		name := r.FormValue("Name")
		sqlStatement := "INSERT INTO Meal_Types(name) VALUES ($1) RETURNING id"
		id := 0
		err := Db.QueryRow(sqlStatement, name).Scan(&id)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		log.Println("INSERT: Id: " + strconv.Itoa(id) + " | Name: " + name)
		http.Redirect(w, r, route.MealTypesRoute, 301)
	} else {
		http.Redirect(w, r, "/logout", 301)
	}
}

func UpdateMealTypeHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Update Meal Type")
	if r.Method == "POST" && sec.IsAuthenticated(w, r) {
		id := r.FormValue("Id")
		name := r.FormValue("Name")
		sqlStatement := "UPDATE Meal_Types SET name=$1 WHERE id=$2"
		updtForm, err := Db.Prepare(sqlStatement)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		updtForm.Exec(name, id)
		log.Println("UPDATE: Id: " + id + " | Name: " + name)
		http.Redirect(w, r, route.MealTypesRoute, 301)
	} else {
		http.Redirect(w, r, "/logout", 301)
	}
}

func DeleteMealTypeHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Delete Meal Type")
	if r.Method == "POST" && sec.IsAuthenticated(w, r) {
		id := r.FormValue("Id")
		sqlStatement := "DELETE FROM Meal_Types WHERE id=$1"
		deleteForm, err := Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)
		sec.CheckInternalServerError(err, w)
		log.Println("DELETE: Id: " + id)
		http.Redirect(w, r, route.MealTypesRoute, 301)
	} else {
		http.Redirect(w, r, "/logout", 301)
	}
}

func ListMealTypesHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("List Meal Types")
	//	if !sec.IsAuthenticated(w, r) {
	rows, err := Db.Query("SELECT id, name, start_at, end_at, to_char(start_at,'HH24:MI:SS') as c_start_at, to_char(end_at,'HH24:MI:SS') as c_end_at FROM meal_types")
	sec.CheckInternalServerError(err, w)
	var mealTypes []mdl.MealType
	var mealType mdl.MealType
	var i = 1
	for rows.Next() {
		err = rows.Scan(&mealType.Id, &mealType.Name, &mealType.StartAt, &mealType.EndAt, &mealType.CStartAt, &mealType.CEndAt)
		mealType.Order = i
		i++
		sec.CheckInternalServerError(err, w)
		mealTypes = append(mealTypes, mealType)
	}
	var page mdl.PageMealTypes
	page.MealTypes = mealTypes
	page.AppName = mdl.AppName
	page.Title = "Tipos de Refeições"
	page.LoggedUser = BuildLoggedUser(GetUserInCookie(w, r))
	var tmpl = template.Must(template.ParseGlob("tiles/mealTypes/*"))
	tmpl.ParseGlob("tiles/*")
	tmpl.ExecuteTemplate(w, "Main-Meal-Type", page)
	//	} else {
	//		http.Redirect(w, r, "/logout", 301)
	//	}
}
