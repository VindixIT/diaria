package main

import (
	"database/sql"
	dpk "diaria/db"
	hd "diaria/handlers"

	//	sec "diaria/security "
	route "diaria/routes"
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/lib/pq"
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
	// injetando a variável Authenticated
	http.HandleFunc("/", hd.IndexHandler)
	http.HandleFunc("/login", hd.LoginHandler)
	http.HandleFunc("/logout", hd.LogoutHandler)
	// ----------------- FOODS
	http.HandleFunc(route.FoodsRoute, hd.ListFoodsHandler)
	http.HandleFunc("/createFood", hd.CreateFoodHandler)
	http.HandleFunc("/updateFood", hd.UpdateFoodHandler)
	http.HandleFunc("/deleteFood", hd.DeleteFoodHandler)
	// ----------------- MEAL TYPES
	http.HandleFunc(route.MealTypesRoute, hd.ListMealTypesHandler)
	http.HandleFunc("/createMealType", hd.CreateMealTypeHandler)
	http.HandleFunc("/updateMealType", hd.UpdateMealTypeHandler)
	http.HandleFunc("/deleteMealType", hd.DeleteMealTypeHandler)
	// ----------------- MEASURES
	http.HandleFunc(route.MeasuresRoute, hd.ListMeasuresHandler)
	http.HandleFunc("/createMeasure", hd.CreateMeasureHandler)
	http.HandleFunc("/updateMeasure", hd.UpdateMeasureHandler)
	http.HandleFunc("/deleteMeasure", hd.DeleteMeasureHandler)
	// ----------------- MEALS
	http.HandleFunc(route.MealsRoute, hd.ListMealsHandler)
	http.HandleFunc("/listMyMeals", hd.ListMyMealsHandler)
	http.HandleFunc("/createMeal", hd.CreateMealHandler)
	http.HandleFunc("/updateMeal", hd.UpdateMealHandler)
	http.HandleFunc("/deleteMeal", hd.DeleteMealHandler)
	// ----------------- BONDS
	http.HandleFunc(route.BondsRoute, hd.ListBondsHandler)
	http.HandleFunc("/createBond", hd.CreateBondHandler)
	http.HandleFunc("/updateBond", hd.UpdateBondHandler)
	http.HandleFunc("/deleteBond", hd.DeleteBondHandler)
	// ----------------- FEATURES
	http.HandleFunc(route.FeaturesRoute, hd.ListFeaturesHandler)
	http.HandleFunc("/createFeature", hd.CreateFeatureHandler)
	http.HandleFunc("/updateFeature", hd.UpdateFeatureHandler)
	http.HandleFunc("/deleteFeature", hd.DeleteFeatureHandler)
	// ----------------- ROLES
	http.HandleFunc(route.RolesRoute, hd.ListRolesHandler)
	http.HandleFunc("/createRole", hd.CreateRoleHandler)
	http.HandleFunc("/updateRole", hd.UpdateRoleHandler)
	http.HandleFunc("/deleteRole", hd.DeleteRoleHandler)
	// ----------------- USERS
	http.HandleFunc(route.UsersRoute, hd.ListUsersHandler)
	http.HandleFunc("/createUser", hd.CreateUserHandler)
	http.HandleFunc("/updateUser", hd.UpdateUserHandler)
	http.HandleFunc("/deleteUser", hd.DeleteUserHandler)
	// ----------------- AJAX
	http.HandleFunc("/loadFeaturesByRoleId", hd.LoadFeaturesByRoleId)
	// ----------------- STATICS
	http.Handle("/statics/",
		http.StripPrefix("/statics/", http.FileServer(http.Dir("./statics"))),
	)
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
