#INCLUDE "rwmake.ch"


User Function MATR85(cOrig)
// O parametro orig informa qual a origem do relatorio


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declaracao de Variaveis                                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Private cString
Private aOrd := {}
Private CbTxt            := ""
Private cDesc1             := "Este programa tem como objetivo imprimir relatorio "
Private cDesc2             := "de acordo com os parametros informados pelo usuario."
Private cDesc3             := "Or็amento PEDIDO Integral"
Private cPict              := ""
Private lEnd             := .F.                                                                                                
Private lAbortPrint      := .F.
Private limite           := 80
Private tamanho          := "P"
Private nomeprog         := "MATR85" // Coloque aqui o nome do programa para impressao no cabecalho
Private nTipo            := 18
Private aReturn          := { "Zebrado", 1, "Administracao", 1, 2, 1, "", 1}
Private nLastKey         := 0
Private cPerg            := "VENDAS2"
Private titulo           := "Or็amento PEDIDO Integral"
Private nLin             := 80
Private cOrigem          := cOrig // Origem do Relatorio ( TMKR03 ou outros )  
Private aCustomText		 := {space(35)+"Or็amento PEDIDO Integral"}

Private Cabec1       := " " 
Private Cabec2       := "                        "
Private cbtxt        := Space(10)
Private cbcont       := 00
Private CONTFL       := 01
Private m_pag        := 01
Private imprime      := .T.
Private wnrel        := "MATR85" // Coloque aqui o nome do arquivo usado para impressao em disco
Private _nVol        := 0 
Private cGrupo       := ""  
Private cUsu         := ""  
Private _cPedido     := ""
Private _nTotal      := 0   
Private nQtdUns      := 0      
Private cTabela      := ""
Private nPrecoReal   := 0 
Private nValorReal   := 0  
Private nAbatido     := 0  
Private nAbatido1    := 0 
Private nVlrDesc1    := 0
Private nVlrDesc2    := 0
Private nVlrDesc3    := 0
Private nVlrDesc1    := 0
Private nVlrDesc2    := 0
Private nVlrDesc3    := 0  
Private nVlrDesc4    := 0 
Private nSubTotal    := 0  
Private nVlrDesc4    := 0 
Private cString := "SC6"

dbSelectArea("SC6")
dbSetOrder(1)

//ValidPerg()

cPerg:=PADR(cPerg,10)
pergunte(cPerg,.F.)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Monta a interface padrao com o usuario...                           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

wnrel := SetPrint(cString,NomeProg,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.T.,aOrd,.T.,Tamanho,,.T.)

If nLastKey == 27
	Return
Endif

SetDefault(aReturn,cString)

If nLastKey == 27
	Return
Endif


RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณRUNREPORT บ Autor ณ AP5 IDE            บ Data ณ  29/08/01   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao auxiliar chamada pela RPTSTATUS. A funcao RPTSTATUS บฑฑ
ฑฑบ          ณ monta a janela com a regua de processamento.               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)

Local cGrpCompany  := FWGrpCompany()
Local nValGrp      := 0

Private nOrdem

_cPref := IIf( SM0->M0_CODIGO == "01","UNI",IIF( SM0->M0_CODIGO == "02" .AND. SM0->M0_CODFIL == "01" ,"UNL","UNH"))
dbselectarea("SC5")
nordsc5 := Indexord() // ponteiro pra depois retornar o indice correto
dbSetorder(1)


if Alltrim(cOrigem) <> 'TMKR03'
	dbSeek( xFilial("SC5") + MV_PAR01 )
Else
	MV_PAR01 := SC5->C5_NUM
Endif

SetRegua(RecCount())

While !EOF() .AND. SC5->C5_NUM >= MV_PAR01 .AND. SC5->C5_NUM <= MV_PAR01
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Verifica o cancelamento pelo usuario...                             ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	If lAbortPrint
		@nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
		Exit
	Endif
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Impressao do cabecalho do relatorio. . .                            ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	_nImprime := 1
	
	WHILE _nImprime <= MV_PAR02
		
		If nLin > 55 // Salto de Pแgina. Neste caso o formulario tem 55 linhas...
			// Sintaxe - Cabec(cTitulo, cCabec1, cCabec2, cNomeProg, nTamanho, nCompress, aCustomText, lPerg, cLogo)
			Cabec(Titulo, Cabec1, Cabec2, NomeProg, Tamanho, nTipo, aCustomText)
			nLin := 8
		Endif

		dbselectarea("SA1")
		dbSetorder(1)
		dbSeek(xFilial("SA1")+SC5->C5_CLIENTE+SC5->C5_LOJACLI)
		//
		// Este bloco pesquisa se ha atendimento no Call Center. Se houver, traz o usuario
		DbSelectArea('SUA')
		nOrd := Indexord()
		cusu := ''
		DbSetOrder(8)
		if DbSeek( xFilial('SUA') + SC5->C5_NUM  )
			@ nlin, 000 PSAY "ATENDTO: " + SUA->UA_NUM // NUMERO DO ATENDIMENTO NO CALL CENTER
			cusu := Posicione('SU7',1,xFilial('SU7') + SUA->UA_OPERADO,'U7_NOME' )
		Endif
		dBsEToRDER( NoRD )
		//
		dbselectarea("SA1")
		@ nLin, 063 PSAY "PEDIDO : " + SC5->C5_NUM
		nLin := nLin + 1
		@ nlin, 000 PSAY "USUARIO ..: " + cusu
		@ nLin, 063 PSAY "EMISSAO: " + DTOC(SC5->C5_EMISSAO)
		nLin := nLin + 1
		@ nLin, 000 PSAY "CำDIGO ...: " + SA1->A1_COD
		nLin := nLin + 1
		@ nLin, 000 PSAY "CLIENTE ..: " + SA1->A1_NOME
		nLin := nLin + 1
		@ nLin, 000 PSAY "ENDEREวO .: " + SUBSTR(SA1->A1_END,1,40)
		@ nLin, 054 PSAY "BAIRRO: " + SA1-> A1_BAIRRO
		nLin := nLin + 1
		@ nLin, 000 PSAY "CIDADE ...: " + SA1->A1_MUN
		@ nLin, 054 PSAY "ESTADO: "  + SA1->A1_EST
		nLin := nLin + 1
		@ nLin, 000 PSAY "CNPJ .....: "
		@ nLin, 012 PSAY SA1->A1_CGC Picture "@ 99.999.999/9999-99"
		@ nLin, 054 PSAY "IE    : " + SA1->A1_INSCR
		nLin := nLin + 1
		@ nLin, 000 PSAY "TELEFONE .: " + SA1->A1_TEL
		@ nLin, 054 PSAY "FAX   : " + SA1->A1_FAX
		nLin := nLin + 1
		@ nLin, 000 PSAY "CEP ......: " + SUBSTR(SA1->A1_CEP,1,5) + "-" + SUBSTR(SA1->A1_CEP,6,3)
		nLin := nLin + 1
		dbSelectArea("SA3")
		dbSetOrder(1)
		dbSeek(xFilial("SA3")+SC5->C5_VEND1)
		@ nLin, 000 PSAY "VENDEDOR .: " + SC5->C5_VEND1 + " - " + SUBSTR(SA3->A3_NREDUZ,1,15)
		nLin := nLin + 1
		dbSelectArea("SA4")
		dbSetOrder(1)
		dbSeek(xFilial("SA4")+SC5->C5_TRANSP)
		
		@ nLin, 000 PSAY "TRANSPORTE: " + RTRIM(SA4->A4_NREDUZ) + "-" + RTRIM(SA4->A4_TEL)
		
		nLin := nLin + 1
		
		@ nLin, 000 PSAY REPLICATE ("-",80)
		nLin := nLin + 1
		@ nLin, 000 PSAY "ITEM/DESCRICAO DO MATERIAL               UM    QUANT.     PREวO      TOTAL (VOL)"
		nLin := nLin + 1
		@ nLin, 000 PSAY REPLICATE ("-",80)
		nLin := nLin + 1
		
		nDesc1  := SC5->C5_DESC1  //DESCONTO 1 EM CASCATA
		nDesc2  := SC5->C5_DESC2  //DESCONTO 2 EM CASCATA
		nDesc3  := SC5->C5_DESC3  //DESCONTO 3 EM CASCATA
		cTabela := SC5->C5_TABELA //TABELA DE PREวO
		
		_nTotal := nQtdVen := nQtdUns := 0
		_cPedido := SC5->C5_NUM
		
		dbSelectArea("SC6")
		dbSetOrder(1)
		dbSeek(xFilial("SC6")+_cPedido)
		
		_nVolume  := 0
		
		While _cPedido == SC6->C6_NUM
			If nLin > 55 // Salto de Pแgina. Neste caso o formulario tem 55 linhas...
				// Sintaxe - Cabec(cTitulo, cCabec1, cCabec2, cNomeProg, nTamanho, nCompress, aCustomText, lPerg, cLogo)
				Cabec(Titulo, Cabec1, Cabec2, NomeProg, Tamanho, nTipo, aCustomText)
				nLin := 8
			Endif
			
			dbSelectArea("SB1")
			dbSetOrder(1)
			dbSeek(xFilial("SB1")+SC6->C6_PRODUTO)
			cGrupo := SB1->B1_GRUPO
			
			If cGrupo == "0040" 
				@ nLin, 000 PSAY ALLTRIM(SC6->C6_ITEM)+"-"+SUBSTR(SB1->B1_DESC,1,37)
			ElseIf cGrupo == "0019" .Or. cGrupo == "0001" .Or. cGrupo == "0048" .Or. cGrupo == "0049" .Or. cGrupo == "0007"
				@ nlin, 000 PSAY ALLTRIM(SC6->C6_ITEM)+"-"+SUBSTR(SB1->B1_COD,1,10)+" "+SUBSTR(SB1->B1_DESC,1,27)
			Else
				@ nLin, 000 PSAY ALLTRIM(SC6->C6_ITEM)+"-"+SUBSTR(SB1->B1_DESC,1,37)
			Endif
			
			@ nLin, 041 PSAY SC6->C6_UM
		   	@ nLin, 044 PSAY SC6->C6_QTDVEN picture "@E 99,999.99"   //PC-ETHOSX-28-08-2019		
			//@ nLin, 053 PSAY TRANSFORM(SC6->C6_PRCVEN,"@E 999,999.99999")
			//@ nLin, 067 PSAY TRANSFORM(SC6->C6_VALOR,"@E 9,999,999.99")
					
			
			//*
			If cGrupo == cGrupo 
			
				If cGrpCompany == "02"
					nValGrp := SC6->C6_PRCVEN
				Else
					nValGrp := SC6->C6_PRUNIT
				EndIf
			 
				_nTotal := _nTotal + SC6->C6_QTDVEN * nValGrp     //PC-ETHOSX-28-08-2019
				@ nLin, 053 PSAY TRANSFORM(nValGrp,"@E 999,999.99999")

				@ nLin, 065 PSAY TRANSFORM (SC6->C6_QTDVEN * nValGrp, "@E 999,999.99")   //PC-ETHOSX-28-08-2019		
				If !Empty(SC6->C6_VOLUME)
					@ nLin, 076 PSAY SC6->C6_VOLUME
					_nVol := VAL(SC6->C6_VOLUME)
					_nVolume := _nVolume + _nVol
				Endif
				
			Else
				
				If cTabela == "001"
					
					nPrecoReal := nValGrp
					nValorReal := SC6->C6_QTDVEN * nValGrp   //PC-ETHOSX-28-08-2019
					_nTotal := _nTotal + nValorReal
					@ nLin, 055 PSAY TRANSFORM(nPrecoReal,"@E 99,999.99999")
					@ nLin, 067 PSAY TRANSFORM(nValorReal,"@E 9,999,999.99")
					
					
				ElseIf cTabela == "002"
					nPrecoReal := nValGrp
					nValorReal := SC6->C6_QTDVEN * nValGrp   //PC-ETHOSX-28-08-2019				
					_nTotal := _nTotal + nValorReal
					@ nLin, 055 PSAY TRANSFORM(nPrecoReal,"@E 99,999.99999")
					@ nLin, 067 PSAY TRANSFORM(nValorReal,"@E 9,999,999.99")
					
				Elseif cTabela == "003"
					nPrecoReal := nValGrp
				   	nValorReal := SC6->C6_QTDVEN * nValGrp  //PC-ETHOSX-28-08-2019
					_nTotal := _nTotal + nValorReal
					@ nLin, 055 PSAY TRANSFORM(nPrecoReal,"@E 99,999.99999")
					@ nLin, 067 PSAY TRANSFORM(nValorReal,"@E 9,999,999.99")
					
				Elseif cTabela == "15"
					nPrecoReal := nValGrp
					nValorReal := SC6->C6_QTDVEN * nValGrp  //PC-ETHOSX-28-08-2019
					_nTotal := _nTotal + nValorReal
					@ nLin, 055 PSAY TRANSFORM(nPrecoReal,"@E 99,999.99999")
					@ nLin, 067 PSAY TRANSFORM(nValorReal,"@E 9,999,999.99")
					
				Elseif cTabela == "16"
					nPrecoReal := nValGrp
					nValorReal := SC6->C6_QTDVEN * nValGrp  //PC-ETHOSX-28-08-2019
					_nTotal := _nTotal + nValorReal
					@ nLin, 055 PSAY TRANSFORM(nPrecoReal,"@E 99,999.99999")
					@ nLin, 067 PSAY TRANSFORM(nValorReal,"@E 9,999,999.99")
					
				Endif
			Endif
			//*/
			nQtdVen := nQtdVen + SC6->C6_QTDVEN   //PC-ETHOSX-28-08-2019
			nQtdUns := nQtdUns + SC6->C6_UNSVEN
			
			nLin := nLin + 1
			dbSelectarea("SC6")
			dbSkip() // Avanca o ponteiro do registro no arquivo
		EndDo
		
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณInserida mensagem de desconto abaixo no corpo do pedido   ณ
		//ณconforme solicitacao da Sra.Norma e Sr.Danilo em 03/08/11 ณ
		//ณRealizado por Vinicius Belini em visita para atedimento a ณ
		//ณQualidade.                                                ณ
		//ณAlteracao validada pelos usuarios nessa mesma data.       ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If !Empty(SC5->C5_DESC2)
			nLin := nLin + 5
			@ nLin, 000 PSAY "A T E N ว ร O: DESCONTO DE"
			@ nLin, 027 PSAY SC5->C5_DESC2 picture "@E 99.99" + "% "
			@ nLin, 035 PSAY "VALIDO SOMENTE ATE O VENCIMENTO"
			nLin := nLin + 1
		EndIf
		
		If nLin < 40
			nLin := 40
		Else
			nLin := nLin + 5
		EndIf
		@ nLin, 000 PSAY SUBSTR(SC5->C5_MENNOTA,1,80)
		nLin := nLin + 1
		@ nLin, 000 PSAY SUBSTR(SC5->C5_MENNOTA,81,80)
		nLin := nLin + 1
		@ nLin, 000 PSAY SUBSTR(SC5->C5_MENNOTA,161,80)
		nLin := nLin + 1
		
		@ nLin, 000 PSAY REPLICATE ("-",80)
		nLin := nLin + 1
		
		
		@ nLin, 000 PSAY "PESO BRUTO / LIQUIDO: "
		
		dbSelectArea("SC6")
		dbSetOrder(1)
		dbSeek(xFilial("SC6")+_cPedido)
		
		If SC6->C6_UM == "KG"
			@ nLin, 042 PSAY nQtdVen picture "@E 99,999.99"
		Else
			@ nLin, 042 PSAY nQtdUns picture "@E 99,999.99"
		Endif
		
		nLin := nLin + 1
		@ nLin, 000 PSAY REPLICATE ("-",80)
		nLin := nLin + 1
		
		_cNota  := GetAdvFVal("SD2","D2_DOC",xFilial("SD2")+_cPedido,8,"" )
		ntotpar := 0
		
		dbSelectArea("SE1")
		dbSetOrder(1)
		If dbSeek(xFilial("SE1")+_cPref+_cNota)
			ntotpar := 0
			_nCol := 14
			While !EOF() .AND. SE1->E1_NUM == _cNota .AND. SE1->E1_PREFIXO == _cPref
				nParnum := _cPref+"-"+SE1->E1_NUM+" - "
				nParven := DTOC(SE1->E1_VENCTO) + " - "
				nParval := SE1->E1_VALOR
				ntotpar += SE1->E1_VALOR
				dbSelectArea("SE1")
				DbSkip()
			EndDo
		EndIF
		
		If     cTabela == "002"
			@ nLin, 029 PSAY " --- SEM EMBALAGEM --- "
		Elseif cTabela == "003"
			@ nLin, 029 PSAY " --- MATERIAL EMBALADO --- "
		Elseif cTabela == "15"
			@ nLin, 029 PSAY " --- MATERIAL EMBALADO --- "
		Endif
		
		/////////////////////////////////////////////////////////////////////////////
		If cGrupo == cGrupo 
					
			//////DESCONTO 3 EM CASCATA ABATIMENTO /////////////////
			nAbatido  := (_nTotal * SC5->C5_DESC3) / 100
			nAbatido1 := _nTotal - nAbatido
			///////////////////////////////////////////////////////
			
			//////DESCONTO 1 EM CASCATA (20%) /////////////////////
			If nAbatido > 0
				nVlrDesc1 := (nAbatido1 * SC5->C5_DESC1) / 100
				nVlrDesc2 :=  nAbatido1 - nVlrDesc1
			Else
				nVlrDesc1 := (_nTotal * SC5->C5_DESC1) / 100
				nVlrDesc2 :=  _nTotal - nVlrDesc1
			Endif
			///////////////////////////////////////////////////////
			
			//////DESCONTO 2 EM CASCATA (ภ vista) /////////////////
			If nDesc2 > 0
				nVlrDesc3 := (nVlrDesc2 * SC5->C5_DESC2) / 100
				nVlrDesc4 := nVlrDesc2 - nVlrDesc3
			Else
				nVlrDesc4 :=  nAbatido1 - nVlrDesc1
			Endif
			///////////////////////////////////////////////////////
			
			
			@ nLin, 044 PSAY "|TOTAL DO ORCAMENTO: "
			@ nLin, 068 PSAY _nTotal picture "@E 99,999.99"
			nLin := nLin + 1
			
			If nAbatido > 0
				@ nLin, 044 PSAY "|ABAT.             : "
				@ nLin, 069 PSAY nAbatido picture "@E 9,999.99"
			Else
				@ nLin, 044 PSAY "|ABAT.             : "
				@ nLin, 069 PSAY 0 picture "@E 9,999.99"
			Endif
			
			nLin := nLin + 1
			
			nSubTotal := _nTotal - nAbatido
			@ nLin, 044 PSAY "|SUBTOTAL          : "
			@ nLin, 068 PSAY nSubTotal Picture "@E 99,999.99"
			
			nLin := nLin + 1
			
			@ nLin, 044 PSAY "|% DESC            : "
			@ nLin, 071 PSAY SC5->C5_DESC1 picture "@E 99.99" + "%"
			nLin := nLin + 1
			
			@ nLin, 044 PSAY "|VALOR TOTAL       : "
			@ nLin, 068 PSAY nVlrDesc2 picture "@E 99,999.99"
			nLin := nLin + 1
			
			If !Empty(nDesc2)
				@ nLin, 044 PSAY "|DESC.A VISTA  : "
				@ nLin, 071 PSAY SC5->C5_DESC2 picture "@E 99.99" + "%"
			Else
				@ nLin, 044 PSAY "|                "
			Endif
			
			nLin := nLin + 1
			@ nLin, 044 PSAY "|TOTAL GERAL       : "
			@ nLin, 068 PSAY nVlrDesc4 picture "@E 99,999.99"
			nLin := nLin + 1
			
			@ nLin, 000 PSAY REPLICATE ("-",80)
			nLin := nLin + 1
			
			_cNota  := GetAdvFVal("SD2","D2_DOC",xFilial("SD2")+_cPedido,8,"" )
			
			dbSelectArea("SE1")
			dbSetOrder(1)
			If dbSeek(xFilial("SE1")+_cPref+_cNota)
				@ nLin, 000 PSAY "Vencimento(s)"
				ntotpar := 0
				_nCol := 14
				While !EOF() .AND. SE1->E1_NUM == _cNota .AND. SE1->E1_PREFIXO == _cPref
					@ nLin, _nCol PSAY alltrim(nParnum)
					@ nLin, _nCol+15 PSAY DTOC(SE1->E1_VENCTO) + " - "
					@ nLin, _nCol+30 PSAY nParval PICTURE "@E 999,999.99"
					ntotpar += SE1->E1_VALOR
					nLin := nLin + 1
					dbSelectArea("SE1")
					DbSkip()
				EndDo
			EndIF

			*----------------------------------------------------------------------------------------
			
			dbselectarea("SC6")
			dbsetorder(1)
			dbSeek(xFilial("SC6")+ _cPedido)
			
			nLin := nLin + 1
			
			@ nLin, 030 PSAY "___________________________________________"
			nLin := nLin + 1
			@ nLin, 032 PSAY SUBSTR(SA1->A1_NOME,1,40)
			
			nLin := nLin + 1
			If !Empty(_nVolume)
				@ nLin, 003 PSAY _nVolume PICTURE "@E99.99"
			Else
				@ nLin, 003 PSAY SC5->C5_VOLUME1 PICTURE "@E99.99"
			Endif
			@ nLin, 009 PSAY " Volume(s) "
			nLin := nLin + 1
			@ nLin, 000 PSAY REPLICATE ("-",80)
			
		Endif
		_nImprime := _nImprime + 1
		
		
	Enddo
	
	DbSelectArea("SC5")
	DbSkip()
	nLin := 0
EndDo


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Finaliza a execucao do relatorio...                                 ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

SET DEVICE TO SCREEN

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Se impressao em disco, chama o gerenciador de impressao...          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

SC5->(Dbsetorder(nordsc5) )

If aReturn[5]==1
	dbCommitAll()
	SET PRINTER TO
	OurSpool(wnrel)
Endif

MS_FLUSH()

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณVALIDPERG บ Autor ณ AP5 IDE            บ Data ณ  29/08/01   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Verifica a existencia das perguntas criando-as caso seja   บฑฑ
ฑฑบ          ณ necessario (caso nao existam).                             บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function ValidPerg

Private _sAlias := Alias()
Private aRegs := {}
Private i,j

dbSelectArea("SX1")
dbSetOrder(1)
cPerg := PADR(cPerg,10)

// Grupo/Ordem/Pergunta/Variavel/Tipo/Tamanho/Decimal/Presel/GSC/Valid/Var01/Def01/Cnt01/Var02/Def02/Cnt02/Var03/Def03/Cnt03/Var04/Def04/Cnt04/Var05/Def05/Cnt05
aAdd(aRegs,{cPerg,"","","mv_ch1","",00,00,0,"","","mv_par","","","","","","","","","","","","","",""})

For i:=1 to Len(aRegs)
	If !dbSeek(cPerg+aRegs[i,2])
		RecLock("SX1",.T.)
		For j:=1 to FCount()
			If j <= Len(aRegs[i])
				FieldPut(j,aRegs[i,j])
			Endif
		Next
		MsUnlock()
	Endif
Next

dbSelectArea(_sAlias)

Return