package reports

import (
	//	mdl "diaria/models"
	"fmt"
	gr "github.com/mikeshimura/goreport"
	"strconv"
)

func Simple1(records []interface{}) string {
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

	amt := ParseFloatNoError(cols[8])
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
