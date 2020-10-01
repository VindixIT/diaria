package handlers

import (
	mdl "diaria/models"
	sec "diaria/security"
	//	"reflect"
	//	pq "github.com/lib/pq"
	//	"html/template"
	//	"fmt"
	"log"
	"net/http"
	"strconv"
	//	"strings"
	//	"time"
)

// AJAX
func ListItemsHandler(idMeal string) []mdl.Item {
	log.Println("List Items By Meal Id")
	sql := "SELECT A.id, A.meal_id, A.food_id, B.name, " +
		" A.quantidade_medida_usual, A.quantidade_g_ml, A.cho, A.kcal " +
		" FROM items A, foods B WHERE A.meal_id= $1 AND A.food_id = B.id"
	log.Println(sql)
	rows, _ := Db.Query(sql, idMeal)
	var items []mdl.Item
	var item mdl.Item
	for rows.Next() {
		rows.Scan(&item.Id, &item.MealId, &item.FoodId, &item.FoodName, &item.QtdMedida, &item.Qtd, &item.Cho, &item.Kcal)
		items = append(items, item)
	}
	return items
}

func DeleteItemsByMealHandler(mealId string) {
	sqlStatement := "DELETE FROM Items WHERE meal_id=$1"
	deleteForm, err := Db.Prepare(sqlStatement)
	if err != nil {
		panic(err.Error())
	}
	deleteForm.Exec(mealId)
	log.Println("DELETE Items in Meal Id: " + mealId)
}

func UpdateItemsHandler(itemsPage []mdl.Item, itemsDB []mdl.Item) {
	for i := range itemsPage {
		id := itemsPage[i].Id
		for j := range itemsDB {
			if itemsDB[j].Id == id {
				fieldsChanged := hasSomeFieldChanged(itemsPage[i], itemsDB[j])
				if fieldsChanged {
					updateItemHandler(itemsPage[i], itemsDB[j])
				}
				break
			}
		}
	}
}

func hasSomeFieldChanged(itemPage mdl.Item, itemDB mdl.Item) bool {
	if itemPage.Cho != itemDB.Cho {
		return true
	} else if itemPage.FoodId != itemDB.FoodId {
		return true
	} else if itemPage.Kcal != itemDB.Kcal {
		return true
	} else if itemPage.MealId != itemDB.MealId {
		return true
	} else if itemPage.Qtd != itemDB.Qtd {
		return true
	} else if itemPage.QtdMedida != itemDB.QtdMedida {
		return true
	} else {
		return false
	}
}
func updateItemHandler(i mdl.Item, itemDB mdl.Item) {
	sqlStatement := "UPDATE Items SET " +
		"cho=$1, food_id=$2, meal_id=$3, kcal=$4, " +
		"quantidade_g_ml=$5, quantidade_medida_usual=$6  WHERE id=$7"
	updtForm, _ := Db.Prepare(sqlStatement)
	updtForm.Exec(i.Cho, i.FoodId, i.MealId, i.Kcal, i.Qtd, i.QtdMedida, i.Id)
	log.Println("UPDATE: " + sqlStatement)
}

func updateItemHandlerDynamic(itemPage mdl.Item, itemDB mdl.Item) {
	sql1 := "UPDATE Items SET "
	sql2 := ""
	counter := 0
	if itemPage.Cho != itemDB.Cho {
		sql2 += "cho=" + strconv.FormatFloat(itemPage.Cho, 2, 10, 64) + " ,"
	}
	if itemPage.FoodId != itemDB.FoodId {
		sql2 += "food_id=" + strconv.FormatInt(itemDB.FoodId, 64) + " ,"
	}
	if itemPage.Kcal != itemDB.Kcal {
		sql2 += "kcal=" + strconv.FormatFloat(itemDB.Kcal, 2, 10, 64) + " ,"
	}
	if itemPage.MealId != itemDB.MealId {
		sql2 += "meal_id=" + strconv.FormatInt(itemDB.MealId, 64) + " ,"
	}
	if itemPage.Qtd != itemDB.Qtd {
		sql2 += "quantidade_g_ml=" + strconv.FormatFloat(itemDB.Qtd, 2, 10, 64) + " ,"
	}
	if itemPage.QtdMedida != itemDB.QtdMedida {
		sql2 += "quantidade_medida_usual=" + strconv.FormatFloat(itemDB.QtdMedida, 2, 10, 64) + " ,"
	}
	// Removendo a última vírgula de sql2
	sql2 = sql2[0 : len(sql2)-1]
	counter += 1
	sql3 := " WHERE id="
	sql4 := strconv.FormatInt(itemDB.Id, 36)
	sqlStatement := sql1 + sql2 + sql3 + sql4
	log.Println("UPDATE: " + sqlStatement)
	Db.QueryRow(sqlStatement)
}

func DeleteItemsHandler(diffDB []mdl.Item) {
	sqlStatement := "DELETE FROM Items WHERE id=$1"
	deleteForm, err := Db.Prepare(sqlStatement)
	if err != nil {
		panic(err.Error())
	}
	for n := range diffDB {
		deleteForm.Exec(strconv.FormatInt(int64(diffDB[n].Id), 10))
		log.Println("DELETE: Item Id: " + strconv.FormatInt(int64(diffDB[n].Id), 10))
	}
}

func CreateNewItemHandler(w http.ResponseWriter, diffPage []mdl.Item) {
	itemid := 0
	var item mdl.Item
	for i := range diffPage {
		item = diffPage[i]
		log.Println(item)
		sqlStatement := "INSERT INTO items(meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES ($1,$2,$3,$4,$5,$6) RETURNING id"
		log.Println(sqlStatement)
		err := Db.QueryRow(sqlStatement, item.MealId, item.QtdMedida, item.Qtd, item.Cho, item.Kcal, item.FoodId).Scan(&itemid)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		log.Println("itemid: " + strconv.Itoa(itemid))
	}
}

func MarkItemAsFavorite(w http.ResponseWriter, r *http.Request) {
	log.Println("Mark Item As Favorite")
	r.ParseForm()
	var mealTypeId = r.FormValue("mealTypeId")
	log.Println("mealTypeId: " + mealTypeId)
	var foodId = r.FormValue("foodId")
	log.Println("foodId: " + foodId)
	var qtd = r.FormValue("qtd")
	log.Println("qtd: " + qtd)
	var qtdMedida = r.FormValue("qtdMedida")
	log.Println("qtdMedida: " + qtdMedida)
	var selected = r.FormValue("selected")
	log.Println("selected: " + selected)
	var create, _ = strconv.ParseBool(selected)
	savedUser := GetUserInCookie(w, r)
	if create {
		insertItemAsFavorite(mealTypeId, foodId, qtd, qtdMedida, savedUser.Id)
	} else {
		deleteItemAsFavorite(mealTypeId, foodId, qtdMedida, savedUser.Id)
	}
	w.Write([]byte(""))
	log.Println("JSON Mark Item As Favorite")
}

func insertItemAsFavorite(mealTypeId string, foodId string, qtd string, qtdMedida string, authorId int64) {
	sqlStatement := "INSERT INTO favorites_items(meal_type_id, food_id, quantidade_g_ml, quantidade_medida_usual, author_id) VALUES ($1,$2,$3,$4,$5)"
	log.Println(sqlStatement)
	Db.QueryRow(sqlStatement, mealTypeId, foodId, qtd, qtdMedida, authorId)
}

func deleteItemAsFavorite(mealTypeId string, foodId string, qtdMedida string, authorId int64) {
	sqlStatement := "DELETE FROM favorites_items WHERE meal_type_id = $1 AND food_id = $2 AND quantidade_medida_usual = $3  AND author_id = $4 "
	log.Println(sqlStatement)
	deleteForm, _ := Db.Prepare(sqlStatement)
	deleteForm.Exec(mealTypeId, foodId, qtdMedida, authorId)
}
