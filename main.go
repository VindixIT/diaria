package main

import (
	"database/sql"
	dpk "diaria/db"
	hd "diaria/handlers"
	"github.com/gorilla/mux"
	//	sec "diaria/security "
	route "diaria/routes"
	"fmt"
	_ "github.com/lib/pq"
	"log"
	"net/http"
	"os"
)

func determineListenAddress() (string, error) {
	port := os.Getenv("PORT")
	if port == "" {
		return "", fmt.Errorf("$PORT not set")
	}
	return ":" + port, nil
}

func dbConn() *sql.DB {
	dbase, err := sql.Open("postgres", os.Getenv("DATABASE_URL"))
	log.Println(os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatalf("Error opening database: %q", err)
	}
	return dbase
}

func main() {
	hd.Db = dbConn()
	// injeta	ndo a variável Authenticated
	dpk.Initialize()
	log.Println("O database está disponível.")
	r := mux.NewRouter()
	// injetando a variável Authenticated
	r.HandleFunc("/", hd.IndexHandler).Methods("GET")
	r.HandleFunc("/login", hd.LoginHandler).Methods("POST")
	r.HandleFunc("/logout", hd.LogoutHandler).Methods("GET")
	// ----------------r.DS
	r.HandleFunc(route.FoodsRoute, hd.ListFoodsHandler).Methods("GET")
	r.HandleFunc("/createFood", hd.CreateFoodHandler).Methods("POST")
	r.HandleFunc("/updateFood", hd.UpdateFoodHandler).Methods("POST")
	r.HandleFunc("/deleteFood", hd.DeleteFoodHandler).Methods("POST")
	// ----------------- MEAL TYPES
	r.HandleFunc(route.MealTypesRoute, hd.ListMealTypesHandler).Methods("GET")
	r.HandleFunc("/createMealType", hd.CreateMealTypeHandler).Methods("POST")
	r.HandleFunc("/updateMealType", hd.UpdateMealTypeHandler).Methods("POST")
	r.HandleFunc("/deleteMealType", hd.DeleteMealTypeHandler).Methods("POST")
	// ----------------- MEASURES
	r.HandleFunc(route.MeasuresRoute, hd.ListMeasuresHandler).Methods("GET")
	r.HandleFunc("/createMeasure", hd.CreateMeasureHandler).Methods("POST")
	r.HandleFunc("/updateMeasure", hd.UpdateMeasureHandler).Methods("POST")
	r.HandleFunc("/deleteMeasure", hd.DeleteMeasureHandler).Methods("POST")
	// ----------------- MEALS
	r.HandleFunc(route.MealsRoute, hd.ListMealsHandler).Methods("GET")
	r.HandleFunc("/listMealsByFilter", hd.ListMealsHandler).Methods("GET")
	r.HandleFunc("/createMeal", hd.CreateMealHandler).Methods("POST")
	r.HandleFunc("/updateMeal", hd.UpdateMealHandler)
	r.HandleFunc("/deleteMeal", hd.DeleteMealHandler).Methods("POST")
	// ----------------- BONDS
	r.HandleFunc(route.BondsRoute, hd.ListBondsHandler).Methods("GET")
	r.HandleFunc("/createBond", hd.CreateBondHandler).Methods("POST")
	r.HandleFunc("/updateBond", hd.UpdateBondHandler).Methods("POST")
	r.HandleFunc("/deleteBond", hd.DeleteBondHandler).Methods("POST")
	// ----------------- FEATURES
	r.HandleFunc(route.FeaturesRoute, hd.ListFeaturesHandler).Methods("GET")
	r.HandleFunc("/createFeature", hd.CreateFeatureHandler).Methods("POST")
	r.HandleFunc("/updateFeature", hd.UpdateFeatureHandler).Methods("POST")
	r.HandleFunc("/deleteFeature", hd.DeleteFeatureHandler).Methods("POST")
	// ----------------- ROLES
	r.HandleFunc(route.RolesRoute, hd.ListRolesHandler).Methods("GET")
	r.HandleFunc("/createRole", hd.CreateRoleHandler).Methods("POST")
	r.HandleFunc("/updateRole", hd.UpdateRoleHandler).Methods("POST")
	r.HandleFunc("/deleteRole", hd.DeleteRoleHandler).Methods("POST")
	// ----------------- USERS
	r.HandleFunc(route.UsersRoute, hd.ListUsersHandler).Methods("GET")
	r.HandleFunc("/createUser", hd.CreateUserHandler).Methods("POST")
	r.HandleFunc("/updateUser", hd.UpdateUserHandler).Methods("POST")
	r.HandleFunc("/deleteUser", hd.DeleteUserHandler).Methods("POST")
	// ----------------- AJAX
	r.HandleFunc("/loadFeaturesByRoleId", hd.LoadFeaturesByRoleId).Methods("GET")
	r.HandleFunc("/markItemAsFavorite", hd.MarkItemAsFavorite).Methods("GET")
	// ----------------- STATICS
	http.Handle("/statics/",
		http.StripPrefix("/statics/", http.FileServer(http.Dir("./statics"))),
	)
	http.Handle("/", r)
	addr, err := determineListenAddress()
	if err != nil {
		log.Fatal(err)
	}
	log.Printf("Listening on %s...\n", addr)
	if err := http.ListenAndServe(addr, nil); err != nil {
		panic(err)
	}
	defer hd.Db.Close()
}
