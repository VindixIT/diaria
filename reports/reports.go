package reports

import (
	"database/sql"
	hd "diaria/handlers"
	//	mdl "diaria/models"
	"fmt"
	gr "github.com/mikeshimura/goreport"
	"log"
	"net/http"
	"strconv"
	"strings"
	"time"
)

var Db *sql.DB

func DownloadMealsReport(w http.ResponseWriter, r *http.Request) {
	Db = hd.Db
	currentUser := hd.GetUserInCookie(w, r)
	records := LoadMealLines(currentUser.Id)
	SimpleReport(records)
	//	DownloadReport(w, pathReport)
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
		" c.kcal FROM MEALS a, " +
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
		cols = make([]string, 10)
		var (
			campo0 string
			campo1 string
			campo2 string
			campo3 string
			campo4 string
			campo5 string
			campo6 string
			campo7 string
			campo8 string
			campo9 string
		)
		rows.Scan(&campo0, &campo1, &campo2, &campo3, &campo4, &campo5, &campo6, &campo7, &campo8, &campo9)
		cols[0] = campo0
		cols[1] = campo1
		cols[2] = campo2
		cols[3] = campo3
		cols[4] = campo4
		cols[5] = campo5
		cols[6] = campo6
		cols[7] = campo7
		cols[8] = campo8
		cols[9] = campo9
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

func SimpleReport(records []interface{}) string {
	r := gr.CreateGoReport()
	r.SumWork["amountcum="] = 0.0
	font1 := gr.FontMap{
		FontName: "IPAexG",
		FileName: "ttf//ipaexg.ttf",
	}
	fonts := []*gr.FontMap{&font1}
	r.SetFonts(fonts)
	d := new(S1Detail)
	r.RegisterBand(gr.Band(*d), gr.Detail)
	h := new(S1Header)
	r.RegisterBand(gr.Band(*h), gr.PageHeader)
	s := new(S1Summary)
	r.RegisterBand(gr.Band(*s), gr.Summary)
	r.Records = records
	fmt.Printf("Records %v \n", r.Records)
	r.SetPage("A4", "mm", "L")
	r.SetFooterY(190)
	r.Execute("report.pdf")
	//	r.SaveText("report.txt")
	return "report.pdf"
}

type S1Detail struct {
}

func (h S1Detail) GetHeight(report gr.GoReport) float64 {
	return 10
}
func (h S1Detail) Execute(report gr.GoReport) {
	cols := report.Records[report.DataPos].([]string)
	log.Println(cols)
	report.Font("IPAexG", 9, "")
	y := 10.0
	report.Cell(10, y, cols[0])
	report.Cell(40, y, cols[1])
	report.Cell(70, y, cols[2])
	report.Cell(90, y, cols[3])
	report.Cell(110, y, cols[4])
	report.Cell(130, y, cols[5])
	report.Cell(180, y, cols[6])
	report.Cell(200, y, cols[7])
	report.Cell(220, y, cols[8])
	report.Cell(240, y, cols[9])
	amt := ParseFloatNoError(cols[9])
	report.SumWork["amountcum="] += amt
}
func ParseFloatNoError(s string) float64 {
	f, _ := strconv.ParseFloat(s, 64)
	return f
}

type S1Header struct {
}

func (h S1Header) GetHeight(report gr.GoReport) float64 {
	return 30
}
func (h S1Header) Execute(report gr.GoReport) {
	report.Font("IPAexG", 14, "")
	report.Cell(50, 15, "Refeições dos Últimos 15 dias")
	report.Font("IPAexG", 10, "")
	report.Cell(240, 20, "Página")
	report.Cell(260, 20, strconv.Itoa(report.Page))
	y := 30.0
	report.Cell(10, y, "Data")
	report.Cell(40, y, "Refeição")
	report.Cell(70, y, "Início")
	report.Cell(90, y, "Término")
	report.Cell(110, y, "Bolus")
	report.Cell(130, y, "Alimento")
	report.Cell(180, y, "Qtd Medida")
	report.Cell(200, y, "Qtd")
	report.Cell(220, y, "CHO")
	report.Cell(240, y, "Kcal")
}

type S1Summary struct {
}

func (h S1Summary) GetHeight(report gr.GoReport) float64 {
	return 10
}
func (h S1Summary) Execute(report gr.GoReport) {
	report.Cell(160, 10, "Total")
	report.CellRight(180, 10, 30, strconv.FormatFloat(
		report.SumWork["amountcum="], 'f', 2, 64))
}
