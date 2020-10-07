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
	//r.SumWork["amountcum"] = 0.0
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
	pathReport := "./statics/reports/repMed1.pdf"
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
	y := 10.0
	report.Cell(10, y, cols[0])
	report.Cell(40, y, cols[1])
	report.Cell(80, y, cols[2])
	report.Cell(100, y, cols[3])
	report.Cell(120, y, cols[4])
	report.Cell(135, y, cols[5])
	report.Cell(195, y, cols[6])
	report.Cell(220, y, cols[7])
	report.Cell(245, y, cols[8])
	report.Cell(265, y, cols[9])
	amt := ParseFloatNoError(cols[8])
	//report.SumWork["amountcum="] += amt
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
	//Inicio Config de fonte e linhas do topo
	report.Font("IPAexG", 14, "")
	report.LineType("straight", 1)
	report.GrayStroke(0.9)    // espessura
	report.LineH(10, 25, 250) //tamanho da linha cinza clara X,Y,Size
	report.GrayStroke(0)      //GrayStroke - mudei o nome da cor da linha...
	//Fim 1 config
	//Config Nome relatorio e espes. linha
	report.LineType("straight", 0.4) //Linha acima do Nome relatorio
	//report.Rect(48, 13, 81, 21) # Retangulo circulando o titulo do relatorio abaixo
	report.Cell(15, 15, "Meals Report") //Nome do relatorio
	report.Image("Icon_diaria.png", 238, 5, 271, 25)
	report.Font("IPAexG", 14, "")
	//fim config 2
	//CONFIG campos
	y := 27.0
	report.Cell(10, y, "Data")
	report.Cell(40, y, "Refeição")
	report.Cell(80, y, "Início")
	report.Cell(100, y, "Término")
	report.Cell(120, y, "Bolus") //
	report.Cell(135, y, "Alimento")
	report.Cell(185, y, "Qtd-Medida")
	report.Cell(220, y, "Qtd")
	report.Cell(240, y, "CHO")
	report.Cell(255, y, "Kcal")
	report.LineType("straight", 0.2) //espessura da linha abaixo dos campos
	report.LineH(10, 35, 280)        //comprimento linha
	//Fim Config
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
		report.LineType("straight", 0.4) //linha
		report.LineH(10, 17, 280)        //linha superior clara
		report.Cell(100, 12, "Itens: ")  // X, Y, Nome
		report.CellRight(107, 12, 10, strconv.FormatFloat(
			report.SumWork["g1item"], 'f', 0, 64))
		report.Cell(220, 12, "Total CHO: ") // CHO embaixo de CHO
		report.CellRight(240, 12, 30, strconv.FormatFloat(
			report.SumWork["g1cum"], 'f', 2, 64))
		report.LineType("straight", 0.8)
		report.LineH(10, 10, 280) //linha inferior
		//report.LineH(0,0,0)
	} else {
		report.LineType("straight", 0.8)
		report.LineH(10, 10, 280)
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
	report.Cell(300, 10, "Total")
	report.CellRight(300, 102, 30, strconv.FormatFloat(
		report.SumWork["amountcum"], 'f', 2, 64))
}

type M1Footer struct {
}

func (h M1Footer) GetHeight(report gr.GoReport) float64 {
	return 10
}
func (h M1Footer) Execute(report gr.GoReport) {
	//CONFIG do "page, 1, of, 1" linhas 116 a 119
	report.Cell(245, 5, "page")                             //distancia H, dist V, Nome
	report.CellRight(253, 5, 10, strconv.Itoa(report.Page)) //1
	report.Cell(264, 5, "of")                               //of
	report.CellRight(265, 5, 10, "{#TotalPage#}")
	//Fim desse config

}
