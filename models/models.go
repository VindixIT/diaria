package models

import (
	"database/sql"
	"github.com/lib/pq"
	"time"
)

var AppName = "diAria"

type User struct {
	Order    int       `json:"order"`
	Id       int64     `json:"id"`
	Name     string    `json:"name"`
	Username string    `json:"username"`
	Password string    `json:"password"`
	Email    string    `json:"email"`
	Mobile   string    `json:"mobile"`
	Role     int64     `json:"role"`
	RoleName string    `json:"rolename"`
	Features []Feature `json:"features"`
	Selected bool      `json:"selected"`
}

type Role struct {
	Order    int
	Id       int64  `json:"id"`
	Name     string `json:"name"`
	Selected bool
	Features []Feature
}

type Bond struct {
	Order            int
	Id               int64  `json:"id"`
	Provider         int    `json:"provider"`
	Consumer         int    `json:"consumer"`
	ProId            string `json:"providerName"`
	ProviderName     string `json:"providerName"`
	ProviderRoleName string `json:"providerRoleName"`
	Selected         bool
}

type Feature struct {
	Order int
	Id    int64  `json:"id"`
	Name  string `json:"name"`
	Code  string `json:"code"`
}

type Food struct {
	Order       int
	Id          int64     `json:"id"`
	Name        string    `json:"name"`
	Measure     string    `json:"measure"`
	MeasureName string    `json:"measureName"`
	MeasureId   NullInt64 `json:"measureId"`
	Qtd         float64   `json:"qtd"`
	Cho         float64   `json:"cho"`
	Kcal        float64   `json:"kcal"`
}

type Item struct {
	Id        int64   `json:"id"`
	MealId    int64   `json:"mealId"`
	FoodId    int64   `json:"foodId"`
	FoodName  string  `json:"foodName"`
	QtdMedida float64 `json:"qtdMedida"`
	Qtd       float64 `json:"qtd"`
	Cho       float64 `json:"cho"`
	Kcal      float64 `json:"kcal"`
}

type Meal struct {
	Order        int
	Id           int64    `json:"id"`
	MealTypeName string   `json:"mealTypeName"`
	MealTypeId   int64    `json:"mealTypeId"`
	Date         NullTime `json:"date"`
	StartAt      NullTime `json:"startAt"`
	EndAt        NullTime `json:"endAt"`
	CDate        string   `json:"cdate"`
	CStartAt     string   `json:"cstartAt"`
	CEndAt       string   `json:"cendAt"`
	CCho         string   `json:"ccho"`
	CKcal        string   `json:"ckcal"`
	Bolus        float64  `json:"bolus"`
	AuthorName   string   `json:"author"`
}

type NullTime struct {
	pq.NullTime
}

type NullInt64 struct {
	sql.NullInt64
}

type NullString struct {
	sql.NullString
}

type MealType struct {
	Order    int
	Id       int64     `json:"id"`
	Name     string    `json:"name"`
	StartAt  time.Time `json:"startAt"`
	EndAt    time.Time `json:"endAt"`
	CStartAt string    `json:"cstartAt"`
	CEndAt   string    `json:"cendAt"`
	Selected bool
}

type Measure struct {
	Order    int
	Id       int64  `json:"id"`
	Name     string `json:"name"`
	Selected bool
}

type MealsFilter struct {
	Clients   []User `json:"clients"`
	BeginDate string `json:"beginDate"`
	EndDate   string `json:"endDate"`
}

type PageMeasures struct {
	AppName    string
	Title      string
	Measures   []Measure
	LoggedUser LoggedUser
}

type PageMeals struct {
	AppName    string
	Title      string
	Meals      []Meal
	MealTypes  []MealType
	Foods      []Food
	Filter     MealsFilter
	LoggedUser LoggedUser
}

type PageMealTypes struct {
	AppName    string
	Title      string
	MealTypes  []MealType
	LoggedUser LoggedUser
}

type PageFoods struct {
	AppName    string
	Title      string
	Foods      []Food
	Measures   []Measure
	LoggedUser LoggedUser
}

type PageRoles struct {
	AppName    string
	Title      string
	Roles      []Role
	Features   []Feature
	LoggedUser LoggedUser
}

type PageFeatures struct {
	AppName    string
	Title      string
	Features   []Feature
	LoggedUser LoggedUser
}

type PageBonds struct {
	AppName    string
	Title      string
	Bonds      []Bond
	Pros       []Bond
	LoggedUser LoggedUser
}

type PageUsers struct {
	AppName    string
	Title      string
	Users      []User
	Roles      []Role
	LoggedUser LoggedUser
}

type LoggedUser struct {
	User          User
	HasPermission func(string) bool
}
