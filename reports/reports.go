package reports

import (
	"database/sql"
	hd "diaria/handlers"
	//	mdl "diaria/models"
	"bytes"
	//	"fmt"
	//	"io"
	"io/ioutil"
	"log"
	"net/http"
	//	"os"
	//	"path/filepath"
	"strconv"
	"strings"
	"time"
	
)

var Db *sql.DB

func DownloadReport(w http.ResponseWriter, r *http.Request) {
	//log.Println("DownloadMealsReport - entrei")
	Db = hd.Db
	currentUser := hd.GetUserInCookie(w, r)
	records := LoadMealLines(currentUser.Id)
	file := Medium1(records)
	// Simple1(records)
	downloadBytes, _ := ioutil.ReadFile(file)
	fileSize := len(string(downloadBytes))
	log.Println("fileSize: " + strconv.Itoa(fileSize))
	w.Header().Set("Content-Type", "application/pdf")
	w.Header().Set("Content-Disposition", "attachment; filename=meal_report.pdf")
	w.Header().Set("Expires", "0")
	w.Header().Set("Content-Transfer-Encoding", "binary")
	w.Header().Set("Content-Length", strconv.Itoa(fileSize))
	w.Header().Set("Content-Control", "private, no-transform, no-store, must-revalidate")

	http.ServeContent(w, r, file, time.Now(), bytes.NewReader(downloadBytes))
}

func LoadMealLines(id int64) []interface{} {
	query := "SELECT " +
		" to_char(a.date, 'DD/MM/YYYY'), " +
		" b.name, " +
		" coalesce(to_char(a.start_at, 'HH24:MI'),''),  " +
		" coalesce(to_char(a.end_at, 'HH24:MI'),''), " +
		" a.bolus, " +
		" d.name, " +
		" c.quantidade_medida_usual, " +
		" c.quantidade_g_ml, " +
		" c.cho, " +
		" c.kcal, " +
		" a.id " +
		" FROM MEALS a, " +
		" MEAL_TYPES b, " +
		" ITEMS c, " +
		" FOODS d " +
		" WHERE " +
		" a.date BETWEEN to_date('" + GetDate(15) + "','YYYY-MM-DD') AND TO_DATE('" + GetDate(0) + "','YYYY-MM-DD')" +
		" AND b.id = a.meal_type_id AND c.meal_id = a.id AND d.id = c.food_id"
	log.Println("Query: " + query)
	rows, _ := Db.Query(query)
	var cols []string
	var lines []interface{}
	for rows.Next() {
		cols = make([]string, 11)
		var (
			campo0  string
			campo1  string
			campo2  string
			campo3  string
			campo4  string
			campo5  string
			campo6  float64
			campo7  string
			campo8  string
			campo9  string
			campo10  string
		)
		rows.Scan(&campo0, &campo1, &campo2, &campo3, &campo4, &campo5, &campo6, &campo7, &campo8, &campo9, &campo10)
		cols[0] = campo0
		cols[1] = campo1
		cols[2] = campo2
		cols[3] = campo3
		cols[4] = campo4
		cols[5] = campo5
		cols[6] = strconv.FormatFloat(campo6, 'f', 2, 64)
		cols[7] = campo7
		cols[8] = campo8
		cols[9] = campo9
		cols[10] = campo10
		
		lines = append(lines, cols)
	}
	return lines
}



func GetDate(dias int) string {
	br, _ := time.LoadLocation("America/Sao_Paulo")
	now := time.Now()
	now = time.Date(now.Year(), now.Month(), now.Day()-dias,
		now.Hour()-3, now.Minute(), now.Second(), 0, br)
	strNow := now.String()
	log.Println("------------------------------------------------------------------------")
	log.Println("- Agora são " + strNow + " em America/Sao_Paulo. ")
	log.Println("------------------------------------------------------------------------")
	txtNow := strings.Split(strNow, " ")[0]
	return txtNow
}
