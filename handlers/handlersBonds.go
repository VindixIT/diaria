package handlers

import (
	mdl "diaria/models"
	route "diaria/routes"
	sec "diaria/security"
	"encoding/json"
	"html/template"
	"log"
	"net/http"
	"strconv"
)

func CreateBondHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Create Bond")
	if r.Method == "POST" {
		provider := r.FormValue("BondForInsert")
		consumer := GetUserInCookie(w, r)
		sqlStatement := "INSERT INTO bonds(service_provider_id, service_consumer_id) VALUES ($1, $2) RETURNING id"
		id := 0
		err := Db.QueryRow(sqlStatement, provider, consumer.Id).Scan(&id)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		log.Println("INSERT: Id: " + strconv.Itoa(id))
	}
	http.Redirect(w, r, route.BondsRoute, 301)
}

func UpdateBondHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Update Bond")
	if r.Method == "POST" {
		id := r.FormValue("Id")
		provider := r.FormValue("ProviderIdForUpdate")
		consumer := GetUserInCookie(w, r)
		sqlStatement := "UPDATE bonds SET service_provider_id=$1, service_consumer_id=$2 WHERE id=$3"
		updtForm, err := Db.Prepare(sqlStatement)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		updtForm.Exec(provider, consumer, id)
		log.Println("INSERT: Id: " + id)
	}
	http.Redirect(w, r, route.BondsRoute, 301)
}

func DeleteBondHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Delete Bond")
	if r.Method == "POST" {
		id := r.FormValue("Id")
		sqlStatement := "DELETE FROM bonds WHERE id=$1"
		deleteForm, err := Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)
		sec.CheckInternalServerError(err, w)
		log.Println("DELETE: Id: " + id)
	}
	http.Redirect(w, r, route.BondsRoute, 301)
}

func DeleteBondsByRoleHandler(roleId string) {
	sqlStatement := "DELETE FROM bonds_roles WHERE role_id=$1"
	deleteForm, err := Db.Prepare(sqlStatement)
	if err != nil {
		panic(err.Error())
	}
	deleteForm.Exec(roleId)
	log.Println("DELETE bonds_roles in Role Id: " + roleId)
}
func DeleteBondsHandler(diffDB []mdl.Bond) {
	sqlStatement := "DELETE FROM bonds_roles WHERE bond_id=$1"
	deleteForm, err := Db.Prepare(sqlStatement)
	if err != nil {
		panic(err.Error())
	}
	for n := range diffDB {
		deleteForm.Exec(strconv.FormatInt(int64(diffDB[n].Id), 10))
		log.Println("DELETE: Bond Id: " + strconv.FormatInt(int64(diffDB[n].Id), 10))
	}
}

func ListBondsHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("List Bonds")
	if !sec.IsAuthenticated(w, r) {
		http.ServeFile(w, r, "tmpl/login.html")
		return
	}
	currentUser := GetUserInCookie(w, r)
	query := "SELECT " +
		" a.id, " +
		" coalesce(b.pro_id,'') as professional_id, " +
		" b.name as provider_name, " +
		" c.name as role_name " +
		" FROM bonds a " +
		" LEFT JOIN users b ON a.service_provider_id = b.id " +
		" LEFT JOIN roles c ON b.role_id = c.id " +
		" WHERE a.service_consumer_id = $1 " +
		" ORDER BY 3, 2 asc"
	log.Println(query)
	rows, err := Db.Query(query, strconv.FormatInt(currentUser.Id, 10))
	sec.CheckInternalServerError(err, w)
	var bonds []mdl.Bond
	var bond mdl.Bond
	var i = 1
	for rows.Next() {
		err = rows.Scan(&bond.Id, &bond.ProId, &bond.ProviderName, &bond.ProviderRoleName)
		sec.CheckInternalServerError(err, w)
		bond.Order = i
		i++
		bonds = append(bonds, bond)
	}

	query = "SELECT a.id, " +
		" coalesce(a.pro_id,''), " +
		" a.name, " +
		" b.name as role_name " +
		" FROM users a, roles b " +
		" WHERE a.role_id = b.id AND " +
		" (a.role_id = $1 OR (a.role_id = $2 AND a.author_id = $3))"
	log.Println(query)
	rows, err = Db.Query(query, ProfessionalRole, CareGiverRole, currentUser.Id)
	sec.CheckInternalServerError(err, w)
	var professionals []mdl.Bond
	var professional mdl.Bond
	i = 1
	for rows.Next() {
		err = rows.Scan(&professional.Id, &professional.ProId, &professional.ProviderName, &professional.ProviderRoleName)
		sec.CheckInternalServerError(err, w)
		professional.Order = i
		i++
		professionals = append(professionals, professional)
	}

	var page mdl.PageBonds
	page.Bonds = bonds
	page.Pros = professionals
	log.Println(len(professionals))
	page.AppName = mdl.AppName
	page.Title = "Vínculos"
	page.LoggedUser = BuildLoggedUser(GetUserInCookie(w, r))
	var tmpl = template.Must(template.ParseGlob("tiles/bonds/*"))
	tmpl.ParseGlob("tiles/*")
	tmpl.ExecuteTemplate(w, "Main-Bonds", page)
	sec.CheckInternalServerError(err, w)
}

// AJAX
func ListBondsByRoleIdHandler(roleId string) []mdl.Bond {
	log.Println("List Bonds By Role Id")
	sql := "SELECT bond_id" +
		" FROM bonds_roles WHERE role_id= $1"
	log.Println(sql)
	rows, _ := Db.Query(sql, roleId)
	var bonds []mdl.Bond
	var bond mdl.Bond
	for rows.Next() {
		rows.Scan(&bond.Id)
		bonds = append(bonds, bond)
	}
	return bonds
}

func LoadAvailableBonds(w http.ResponseWriter, r *http.Request) {
	log.Println("Load Load Available Bonds")
	r.ParseForm()
	savedUser := GetUserInCookie(w, r)
	var statusId = r.FormValue("statusId")
	var entityType = r.FormValue("entityType")
	log.Println("entityType: " + entityType)
	log.Println("statusId: " + statusId)
	sql := " SELECT a.id, a.name, a.code " +
		" FROM bonds a INNER JOIN bonds_activities b ON a.id = b.bond_id " +
		" INNER JOIN activities c ON c.id = b.activity_id " +
		" INNER JOIN actions d ON c.action_id = d.id " +
		" INNER JOIN workflows e ON c.workflow_id = e.id " +
		" WHERE e.end_at IS null " +
		" AND e.entity_type = $1 " +
		" AND d.origin_status_id = $2 " +
		" AND a.id in ( SELECT bond_id from bonds_roles where role_id = $3 ) "
	log.Println("Query Available Bonds: " + sql)
	rows, _ := Db.Query(sql, entityType, statusId, savedUser.Role)
	var bonds []mdl.Bond
	var bond mdl.Bond
	for rows.Next() {
		rows.Scan(&bond.Id, &bond.Provider, &bond.Consumer)
		bonds = append(bonds, bond)
		log.Println(bonds)
	}
	jsonBonds, _ := json.Marshal(bonds)
	w.Write([]byte(jsonBonds))
	log.Println("JSON Load Bonds")
}
