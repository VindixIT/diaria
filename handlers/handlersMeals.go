package handlers

import (
	mdl "diaria/models"
	sec "diaria/security"
	"encoding/json"
	pq "github.com/lib/pq"
	//	htemplate "html/template"
	route "diaria/routes"
	"log"
	"net/http"
	"strconv"
	"strings"
	ttemplate "text/template"
	"time"
)

func CreateMealHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Create Meal")
	if r.Method == "POST" && sec.IsAuthenticated(w, r) {
		mealType := r.FormValue("MealTypeForInsert")
		date := r.FormValue("DateForInsert")
		startAt := r.FormValue("StartAtForInsert")
		endAt := r.FormValue("EndAtForInsert")
		bolus := r.FormValue("BolusForInsert")
		currentUser := GetUserInCookie(w, r)
		if bolus == "" {
			bolus = "0"
		}
		sqlStatement := "INSERT INTO meals(meal_type_id, date, start_at, end_at, bolus, author_id) VALUES ($1,$2,$3,$4,$5,$6) RETURNING id"
		mealId := 0
		var err error
		if endAt == "" {
			err = Db.QueryRow(sqlStatement, mealType, date, startAt, pq.NullTime{}, bolus, currentUser.Id).Scan(&mealId)
		} else {
			err = Db.QueryRow(sqlStatement, mealType, date, startAt, endAt, bolus, currentUser.Id).Scan(&mealId)
		}

		if err != nil {
			panic(err.Error())
		}

		for key, value := range r.Form {
			if strings.HasPrefix(key, "item") {
				log.Println(value)
				array := strings.Split(value[0], "#")
				foodid := strings.Split(array[2], ":")[1]
				qtdMedida := extraiValor(strings.Split(array[4], ":"))
				log.Println(qtdMedida)
				qtd := extraiValor(strings.Split(array[5], ":"))
				cho := extraiValor(strings.Split(array[6], ":"))
				kcal := extraiValor(strings.Split(array[7], ":"))
				itemid := 0
				log.Println("foodid: " + foodid)
				sqlStatement := "INSERT INTO items(meal_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal, food_id) VALUES ($1,$2,$3,$4,$5,$6) RETURNING id"

				err := Db.QueryRow(sqlStatement, mealId, qtdMedida, qtd, cho, kcal, foodid).Scan(&itemid)

				if err != nil {
					panic(err.Error())
				}
			}
		}

		l := "INSERT: Id: " + strconv.Itoa(mealId)
		l += " | Date: " + date
		l += " | MealType: " + mealType
		l += " | StartAt: " + startAt
		l += " | endAt: " + endAt
		l += " | Bolus: " + bolus
		log.Println(l)
		http.Redirect(w, r, route.MealsRoute, 301)
	} else {
		http.Redirect(w, r, "/logout", 301)
	}
}

func extraiValor(arr []string) string {
	r := "0.0"
	if len(arr) > 1 && arr[1] != "" {
		r = arr[1]
	}
	return r
}

func DeleteMealHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Delete Meal")
	if r.Method == "POST" && sec.IsAuthenticated(w, r) {
		id := r.FormValue("Id")
		sqlStatement := "DELETE FROM Items WHERE meal_id=$1"
		deleteForm, err := Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)
		sqlStatement = "DELETE FROM Meals WHERE id=$1"
		deleteForm, err = Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)

		log.Println("DELETE: Id: " + id)
		http.Redirect(w, r, route.MealsRoute, 301)
	} else {
		http.Redirect(w, r, "/logout", 301)
	}
}

func UpdateMealHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Update Meal")
	if r.Method == "POST" && sec.IsAuthenticated(w, r) {
		sec.IsAuthenticated(w, r)
		mealId := r.FormValue("Id")
		mealType := r.FormValue("MealTypeForUpdate")
		date := r.FormValue("DateForUpdate")
		startAt := r.FormValue("StartAtForUpdate")
		endAt := r.FormValue("EndAtForUpdate")
		bolus := r.FormValue("BolusForUpdate")
		currentUser := GetUserInCookie(w, r)
		sqlStatement := "UPDATE meals SET " +
			" meal_type_id = $1, " +
			" date = $2, " +
			" start_at = $3, " +
			" end_at = $4, " +
			" bolus = $5, " +
			" author_id = $6 " +
			" WHERE id = $7"
		log.Println(sqlStatement)
		updtForm, err := Db.Prepare(sqlStatement)

		if err != nil {
			panic(err.Error())
		}

		if endAt == "" {
			updtForm.Exec(mealType, date, startAt, pq.NullTime{}, bolus, currentUser.Id, mealId)
		} else {
			updtForm.Exec(mealType, date, startAt, endAt, bolus, currentUser.Id, mealId)
		}
		log.Println("UPDATE: Id: " + mealId +
			" | MealTypeId: " + mealType +
			" | Date: " + date +
			" | Start At: " + startAt +
			" | End At: " + endAt +
			" | Bolus: " + bolus +
			" | Id: " + strconv.FormatInt(currentUser.Id, 10))

		var itemsDB = ListItemsHandler(mealId)
		var itemsPage []mdl.Item
		var itemPage mdl.Item
		for key, value := range r.Form {
			if strings.HasPrefix(key, "item") {
				log.Println("value[0]: " + value[0])
				array := strings.Split(value[0], "#")
				log.Println(array)
				itemid := strings.Split(array[0], ":")[1]
				foodid := strings.Split(array[2], ":")[1]
				qtdMedida := extraiValor(strings.Split(array[4], ":"))
				qtd := extraiValor(strings.Split(array[5], ":"))
				cho := extraiValor(strings.Split(array[6], ":"))
				kcal := extraiValor(strings.Split(array[7], ":"))
				n, _ := strconv.ParseInt(itemid, 10, 64)
				itemPage.Id = n
				m, _ := strconv.ParseInt(foodid, 10, 64)
				itemPage.FoodId = m
				o, _ := strconv.ParseInt(mealId, 10, 64)
				itemPage.MealId = o
				p, _ := strconv.ParseFloat(qtdMedida, 64)
				itemPage.QtdMedida = p
				q, _ := strconv.ParseFloat(qtd, 64)
				itemPage.Qtd = q
				r, _ := strconv.ParseFloat(cho, 64)
				itemPage.Cho = r
				s, _ := strconv.ParseFloat(kcal, 64)
				itemPage.Kcal = s
				itemsPage = append(itemsPage, itemPage)
			}
		}
		log.Println(len(itemsPage))
		log.Println(len(itemsDB))
		if len(itemsPage) < len(itemsDB) {
			log.Println("Quantidade de Itens da Página: " + strconv.Itoa(len(itemsPage)))
			if len(itemsPage) == 0 {
				DeleteItemsByMealHandler(mealId)
			} else {
				var diffDB []mdl.Item = itemsDB
				for n := range itemsPage {
					if contains(diffDB, itemsPage[n]) {
						diffDB = remove(diffDB, itemsPage[n])
					}
				}
				DeleteItemsHandler(diffDB)
			}
		} else {
			var diffPage []mdl.Item = itemsPage
			for n := range itemsDB {
				if contains(diffPage, itemsDB[n]) {
					diffPage = remove(diffPage, itemsDB[n])
				}
			}
			log.Println("CreateNewItemHandler")
			itemId := 0
			var item mdl.Item
			for i := range diffPage {
				item = diffPage[i]
				log.Println(item)
				sqlStatement := "INSERT INTO items(meal_id, food_id, quantidade_medida_usual, quantidade_g_ml, cho, kcal) VALUES ($1,$2,$3,$4,$5,$6) RETURNING id"
				log.Println(sqlStatement)
				err := Db.QueryRow(sqlStatement, item.MealId, item.FoodId, item.QtdMedida, item.Qtd, item.Cho, item.Kcal).Scan(&itemId)

				if err != nil {
					panic(err.Error())
				}

				// log.Println("itemid: " + strconv.Itoa(itemId))
			}
		}
		UpdateItemsHandler(itemsPage, itemsDB) // TODO Comparando campo a campo os elementos de intersecção.
		http.Redirect(w, r, route.MealsRoute, 301)
	} else {
		r.ParseForm()
		var idMeal = r.FormValue("idMeal")
		log.Println(idMeal)
		items := ListItemsHandler(idMeal)
		jsonItems, _ := json.Marshal(items)
		w.Write([]byte(jsonItems))
		log.Println("JSON")
	}
}

func contains(items []mdl.Item, itemCompared mdl.Item) bool {
	for n := range items {
		if items[n].Id == itemCompared.Id {
			return true
		}
	}
	return false
}

func remove(items []mdl.Item, itemToBeRemoved mdl.Item) []mdl.Item {
	var newItems []mdl.Item
	for i := range items {
		if items[i].Id != itemToBeRemoved.Id {
			newItems = append(newItems, items[i])
		}
	}
	return newItems
}

func ListMealsHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("List Meals")
	if sec.IsAuthenticated(w, r) {
		currentUser := GetUserInCookie(w, r)
		curId := strconv.FormatInt(currentUser.Id, 10)
		snippet1 := "in (select service_consumer_id from bonds where service_provider_id = " + curId + ")"
		snippet2 := ""
		clientId := ""
		beginDateFilter := ""
		endDateFilter := ""
		var filter mdl.MealsFilter
		if r.Method == "POST" {
			clientId = r.FormValue("ClientFilter")
			if clientId != "" {
				snippet1 = "= " + clientId + " "
			}
			beginDateFilter = r.FormValue("BeginDateFilter")
			filter.BeginDate = beginDateFilter
			endDateFilter = r.FormValue("EndDateFilter")
			filter.EndDate = endDateFilter
			log.Println("1: BeginDate: " + beginDateFilter + " - EndDate: " + endDateFilter)
			if beginDateFilter != "" && endDateFilter != "" {
				snippet2 = " AND (a.date BETWEEN to_date('" + beginDateFilter +
					"','YYYY-MM-DD') AND TO_DATE('" + endDateFilter + "','YYYY-MM-DD')) "
			}
		} else {
			now := time.Now()
			strNow := now.String()
			txtNow := strings.Split(strings.Split(strNow, " ")[0], "-")
			dia := txtNow[2]
			mes := txtNow[1]
			ano := txtNow[0]
			beginDateFilter = ano + "-" + mes + "-" + dia
			endDateFilter = beginDateFilter
			log.Println("2: BeginDate: " + beginDateFilter + " - EndDate: " + endDateFilter)
			filter.BeginDate = beginDateFilter
			filter.EndDate = endDateFilter
		}

		query := " SELECT " +
			" R1.meal_id, " +
			" R1.meal_type_id, " +
			" R1.meal_type_name, " +
			" R1.meal_date, " +
			" R1.start_at, " +
			" R1.end_at, " +
			" R1.c_meal_date, " +
			" R1.c_start_at, " +
			" R1.c_end_at, " +
			" coalesce(R2.cho_total,0)," +
			" coalesce(R2.kcal_total,0), " +
			" coalesce(R1.bolus,0), " +
			" R1.author_name " +
			" FROM " +
			" ( " +
			" SELECT  " +
			" a.id as meal_id, b.id as meal_type_id, b.name as meal_type_name, " +
			" a.date as meal_date, a.start_at as start_at, a.end_at as end_at, " +
			" coalesce(to_char(a.date,'DD/MM/YYYY'),'') as c_meal_date, " +
			" coalesce(to_char(a.start_at,'HH24:MI:SS'),'') as c_start_at, " +
			" coalesce(to_char(a.end_at,'HH24:MI:SS'),'') as c_end_at, " +
			" coalesce(a.bolus,0.00) as bolus, " +
			" c.name as author_name " +
			" FROM " +
			" meals a, meal_types b, users c " +
			" WHERE a.meal_type_id = b.id " +
			" AND c.id = a.author_id " +
			" AND (a.author_id " + snippet1 +
			" OR a.author_id = " + curId + ") " +
			snippet2 +
			" order by a.id desc " +
			" ) R1 LEFT OUTER JOIN " +
			" (SELECT a.id as meal_id, " +
			" sum(b.cho) as cho_total, " +
			" sum(b.kcal) as kcal_total " +
			" from meals a, items b " +
			" where a.id = b.meal_id " +
			" group by a.id " +
			" order by a.id desc " +
			" ) R2 " +
			" ON R1.meal_id = R2.meal_id "

		log.Println("QUERY: " + query)
		log.Println("Current User Id: " + curId)
		rows, _ := Db.Query(query)
		var meals []mdl.Meal
		var meal mdl.Meal
		var i = 1
		for rows.Next() {
			rows.Scan(
				&meal.Id,
				&meal.MealTypeId,
				&meal.MealTypeName,
				&meal.Date,
				&meal.StartAt,
				&meal.EndAt,
				&meal.CDate,
				&meal.CStartAt,
				&meal.CEndAt,
				&meal.CCho,
				&meal.CKcal,
				&meal.Bolus,
				&meal.AuthorName)

			meal.Order = i
			i++
			meals = append(meals, meal)
		}

		query = " SELECT a.service_consumer_id, b.name FROM bonds a " +
			" INNER JOIN users b ON b.id = a.service_consumer_id " +
			" WHERE a.service_provider_id = $1 "
		log.Println("QUERY: " + query)
		rows, _ = Db.Query(query, curId)
		var clients []mdl.User
		var client mdl.User
		for rows.Next() {
			_ = rows.Scan(&client.Id, &client.Name)
			if strconv.FormatInt(client.Id, 10) == clientId {
				log.Println("clientId: " + clientId)
				client.Selected = true
			} else {
				client.Selected = false
			}

			clients = append(clients, client)
		}

		var funcMap = ttemplate.FuncMap{
			"multiplication": func(n float64, f float64) float64 {
				return n * f
			},
			"addOne": func(n int) int {
				return n + 1
			},
		}

		rows, _ = Db.Query("SELECT id, name, start_at, end_at FROM meal_types")
		var mealTypes []mdl.MealType
		var mealType mdl.MealType
		now := GetNow()
		for rows.Next() {
			_ = rows.Scan(&mealType.Id, &mealType.Name, &mealType.StartAt, &mealType.EndAt)

			if mealType.EndAt.Before(mealType.StartAt) {
				//			log.Println("mealType.EndAt.Before(mealType.StartAt)")
				if mealType.StartAt.Before(now) && GetMidnight().After(now) {
					mealType.Selected = true
				} else {
					//				log.Println("GetMidnight().Before(now) && mealType.EndAt.After(now)")
					//				log.Println("now: " + now.String())
					//				log.Println("midnight: " + GetMidnight().String())
					//				log.Println("mealType.EndAt: " + mealType.EndAt.String())
					if GetMidnight().Before(now) && mealType.EndAt.After(now) {
						//					log.Println("true")
						mealType.Selected = true
					} else {
						//					log.Println("false")
						mealType.Selected = false
					}
				}
			} else {
				//			log.Println("mealType.StartAt.Before(now) && mealType.EndAt.After(now)")
				if mealType.StartAt.Before(now) && mealType.EndAt.After(now) {
					mealType.Selected = true
				} else {
					mealType.Selected = false
				}
			}
			mealTypes = append(mealTypes, mealType)
		}
		query = "SELECT a.id, a.name, b.name as measure, a.qtd, a.cho, a.kcal FROM foods a " +
			"LEFT JOIN measures b ON a.measure_id = b.id order by a.name asc"
		log.Println(query)
		rows, _ = Db.Query(query)
		var foods []mdl.Food
		var food mdl.Food
		for rows.Next() {
			_ = rows.Scan(&food.Id, &food.Name, &food.Measure, &food.Qtd, &food.Cho, &food.Kcal)
			foods = append(foods, food)
		}

		query = "SELECT" +
			" i.id, " +
			" i.food_id, " +
			" f.name, " +
			" i.meal_type_id, " +
			" m.name, " +
			" i.quantidade_medida_usual, " +
			" i.quantidade_g_ml, " +
			" i.author_id " +
			" FROM favorites_items i " +
			" LEFT JOIN foods f ON i.food_id = f.id " +
			" LEFT JOIN meal_types m ON i.meal_type_id = m.id " +
			" WHERE i.author_id = $1 "
		log.Println(query)
		savedUser := GetUserInCookie(w, r)
		rows, _ = Db.Query(query, savedUser.Id)
		var favItems []mdl.FavoriteItem
		var favItem mdl.FavoriteItem
		for rows.Next() {
			_ = rows.Scan(&favItem.Id, &favItem.FoodId, &favItem.FoodName,
				&favItem.MealTypeId, &favItem.MealTypeName,
				&favItem.QtdMedida, &favItem.Qtd, &favItem.AuthorId)
			favItems = append(favItems, favItem)
		}

		var page mdl.PageMeals
		page.Meals = meals
		page.AppName = mdl.AppName
		page.MealTypes = mealTypes
		log.Println("Quantidade de Favoritos: " + strconv.Itoa(len(favItems)))
		page.FavoriteItems = favItems
		page.Foods = foods
		filter.Clients = clients
		page.Filter = filter
		log.Println("Qtd. Clients: " + strconv.Itoa(len(clients)))
		page.Title = "Refeições"
		page.LoggedUser = BuildLoggedUser(currentUser)
		var tmpl = ttemplate.Must(ttemplate.ParseGlob("tiles/meals/*"))
		tmpl.ParseGlob("tiles/*")
		tmpl.Funcs(funcMap)
		tmpl.ExecuteTemplate(w, "Main-Meal", page)
	} else {
		http.Redirect(w, r, "/logout", 301)
	}
}

func GetNow() time.Time {
	br, _ := time.LoadLocation("America/Sao_Paulo")
	now := time.Now()
	now = time.Date(now.Year(), now.Month(), now.Day(),
		now.Hour()-3, now.Minute(), now.Second(), 0, br)
	strNow := now.String()
	log.Println("------------------------------------------------------------------------")
	log.Println("- Agora são " + strNow + " em America/Sao_Paulo. ")
	log.Println("------------------------------------------------------------------------")
	txtNow := strings.Split(strings.Split(strings.Split(strNow, " ")[1], ".")[0], ":")
	hora, _ := strconv.Atoi(txtNow[0])
	minuto, _ := strconv.Atoi(txtNow[1])
	segundo, _ := strconv.Atoi(txtNow[2])
	t := time.Date(0000, time.January, 1,
		hora,
		minuto,
		segundo, 0, time.UTC)
	return t
}

func GetMidnight() time.Time {
	t := time.Date(0000, time.January, 0, 24, 0, 0, 1, time.UTC)
	return t
}
