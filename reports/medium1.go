package reports

import (
	//"fmt"
	gr "github.com/mikeshimura/goreport"
	//"io/ioutil"
	"log"
	"strconv"
	//"strings"
)

func Medium1(records []interface{}) string {
	r := gr.CreateGoReport()
	//Page Total Function
	r.PageTotal = true
	r.SumWork["amountcum"] = 0.0
	r.SumWork["g1item"] = 0.0
	r.SumWork["g1cum"] = 0.0
	font1 := gr.FontMap{
		FontName: "IPAexG",
		FileName: "ttf//ipaexg.ttf",
	}
	fonts := []*gr.FontMap{&font1}
	r.SetFonts(fonts)
	d := new(M1Detail)
	r.RegisterBand(gr.Band(*d), gr.Detail)
	h := new(M1Header)
	r.RegisterBand(gr.Band(*h), gr.PageHeader)
	s := new(M1Summary)
	r.RegisterBand(gr.Band(*s), gr.Summary)
	f := new(M1Footer)
	r.RegisterBand(gr.Band(*f), gr.PageFooter)
	s1 := new(M1G1Summary)
	r.RegisterGroupBand(gr.Band(*s1), gr.GroupSummary, 1)
	//	r.Records = gr.ReadTextFile("sales1.txt", 7)
	r.Records = records
	//fmt.Printf("Records %v \n", r.Records)
	r.SetPage("A4", "mm", "L")
	r.SetFooterY(190)
	pathReport := "./statics/reports/medium1.pdf"
	r.Execute(pathReport)
	//	r.SaveText("medium1.txt")
	log.Println(pathReport)
	return pathReport
}

type M1Detail struct {
}

func (h M1Detail) GetHeight(report gr.GoReport) float64 {
	return 10
}
func (h M1Detail) Execute(report gr.GoReport) {
	cols := report.Records[report.DataPos].([]string)
	report.Font("IPAexG", 12, "")
	y := 2.0
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
	report.SumWork["g1item"] += 1.0
	report.SumWork["g1cum"] += amt
}
func (h M1Detail) BreakCheckBefore(report gr.GoReport) int {
	if report.DataPos == 0 {
		//max no
		return 2
	}
	curr := report.Records[report.DataPos].([]string)
	before := report.Records[report.DataPos-1].([]string)
	return h.BreakCheckSub(curr, before)
}
func (h M1Detail) BreakCheckAfter(report gr.GoReport) int {
	if report.DataPos == len(report.Records)-1 {
		//max no
		return 2
	}
	curr := report.Records[report.DataPos].([]string)
	after := report.Records[report.DataPos+1].([]string)
	return h.BreakCheckSub(curr, after)
}
func (h M1Detail) BreakCheckSub(row1 []string, row2 []string) int {
	if row1[0] != row2[0] {
		return 2
	}
	if row1[2] != row2[2] {
		return 1
	}
	return 0
}

type M1Header struct {
}

func (h M1Header) GetHeight(report gr.GoReport) float64 {
	return 30
}
func (h M1Header) Execute(report gr.GoReport) {
	report.Font("IPAexG", 14, "")
	report.LineType("straight", 8)
	report.GrayStroke(0.9)
	report.LineH(48, 13, 81)
	report.GrayStroke(0)
	report.LineType("straight", 0.5)
	report.Rect(48, 13, 81, 21)
	report.Cell(50, 15, "Meals Report")
	report.Font("IPAexG", 12, "")
	report.Cell(245, 20, "page")
	report.CellRight(253, 20, 10, strconv.Itoa(report.Page))
	report.Cell(264, 20, "of")
	report.CellRight(268, 20, 10, "{#TotalPage#}")
	y := 23.0
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
	report.LineType("straight", 0.2)
	report.LineH(15, 28, 220)
}

type M1G1Summary struct {
}

func (h M1G1Summary) GetHeight(report gr.GoReport) float64 {
	//Conditional print  if item==1 not print
	if report.SumWork["g1item"] == 1.0 {
		return 0
	}
	return 10
}
func (h M1G1Summary) Execute(report gr.GoReport) {
	//Conditional print  if item==1 not print
	if report.SumWork["g1item"] != 1.0 {
		report.Cell(80, 2, "Item")
		report.CellRight(100, 2, 10, strconv.FormatFloat(
			report.SumWork["g1item"], 'f', 0, 64))
		report.Cell(150, 2, "Total CHO")
		report.CellRight(180, 2, 30, strconv.FormatFloat(
			report.SumWork["g1cum"], 'f', 2, 64))
		report.LineType("straight", 0.2)
		report.LineH(15, 7, 220)
	} else {
		report.LineType("straight", 0.2)
		report.LineH(15, -3, 220)
	}
	report.SumWork["g1item"] = 0.0
	report.SumWork["g1cum"] = 0.0
}

type M1Summary struct {
}

func (h M1Summary) GetHeight(report gr.GoReport) float64 {
	return 10
}
func (h M1Summary) Execute(report gr.GoReport) {
	report.Cell(160, 2, "Total")
	report.CellRight(180, 2, 30, strconv.FormatFloat(
		report.SumWork["amountcum"], 'f', 2, 64))
}

type M1Footer struct {
}

func (h M1Footer) GetHeight(report gr.GoReport) float64 {
	return 10
}
func (h M1Footer) Execute(report gr.GoReport) {
	report.Cell(160, 2, "Footer Sample")
}
