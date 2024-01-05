fficheiro file
literal caminho
logico Existe
inteiro cod<-0


registo Pessoa
	inteiro codCli
	literal nome
	inteiro telefone
fimregisto
registo contas
	literal numConta
	inteiro saldo, codCli
fimregisto
inteiro total
funcao inteiro contar()
	caminho <- fPastaUtilizador() + "\\documents\\testario.txt"
	Existe <- fExiste(caminho)
	se nao Existe entao
		fcriar(caminho)
	fimse
	fAbrir(file , caminho, FALSO)	
		limpatela			
		total<-0
		enquanto ftemlinha(file) faca
		fLerLinha(file)
		total<- total+ 1
		fimenquanto
	retorne total
fimfuncao
inteiro t <-contar()
Pessoa clientes[t+10]
contas conta [t+10]
inteiro clientesJaCadastrados <- 0
inteiro c
procedimento restaurarFicheiro()
	
	fAbrir(file , caminho, falso)
	inteiro n, b
	enquanto ftemlinha(file) faca
	 	para n de 0 ate t-1	
	 		literal client 
			client<- fLerlinha(file)
			mostre client
			literal dadosRep[]<- strRepartir(client, "-")
			para b de 0 ate t-1
			fimpara
			clientes[n].codCli<- strValorInt(dadosRep[0])
			clientes[n].nome<- dadosRep[1]
			clientes[n].telefone<- strValorInt(dadosRep[2])
			conta[n].codCli<-strValorInt(dadosRep[3])
			conta[n].numConta<- dadosRep[4]
			conta[n].saldo<- strValorInt(dadosRep[5])    			
	 	fimpara	  	
	fimenquanto
	ffechar(file)
fimprocedimento
procedimento backup()
	fAbrir(file, caminho, verdadeiro)
	literal dadoCliente
	inteiro encher
	para encher de 0 ate t-1 	
	se conta[encher].codCli=clientes[encher].codCli entao			
		dadoCliente <- strintparastr(clientes[encher].codCli) +"-" + clientes[encher].nome +"-" + strintparastr(clientes[encher].telefone) +"-"+  strintparastr(conta[encher].codCli) +"-" + conta[encher].numConta +"-" + strintparastr(conta[encher].saldo)
		mostre dadoCliente, "\n\n"
	    fescrever( file ,  dadoCliente)
	    fNovaLinha(file) //Mudança de Linha 
	fimse
	fimpara
	  ffechar(file)
fimprocedimento
funcao logico cadastrar_cliente(Pessoa w)
	clientes[t].codCli<- w.codCli
	clientes[t].nome <- w.nome
	clientes[t].telefone <- w.telefone
	conta[t].codCli<-w.codCli
	conta[t].numConta<- "Não Registrado"
	conta[t].saldo<- 0
	t <- t + 1
	retorne verdadeiro
	/*para c de 0 ate t-1
		se num= conta[c].numConta entao
			mostre "\tDigite o valor a depositar: "
			leia saldo
			conta[c].saldo<-conta[c].saldo + saldo
			escreva "\n---------------------------------------------------------\n"
			mostre "\N\tOBS: Depósito feito com sucesso!\N"
			mostre "\tDigite qualquer tecla para continuar "
			LITERAL cont
			leia cont
		fimse
		mostre "\n", c
		tpause(2000)
		fimpara*/
fimfuncao

funcao inteiro bconta (literal nconta)
	  inteiro contador
	  para contador de 0 ate t - 1
		contas c <- conta[contador]
		se c.numConta = nconta entao
			retorne contador
		fim se
	  fim para

	  retorne -1
fimfuncao

funcao logico depositar(literal n,inteiro s)
	inteiro i<- bconta (n)
			conta[i].saldo<-conta[i].saldo + s
			escreva "\n---------------------------------------------------------\n"
			mostre "\N\tOBS: Depósito feito com sucesso!\N"
			mostre "\tDigite qualquer tecla para continuar "
			LITERAL cont
			leia cont
	
	retorne verdadeiro
fimfuncao

inicio
	restaurarFicheiro()
	inteiro n
	Pessoa x
	faca
	limpatela
	MOSTRE "\N======================= MENU ===========================\N\N"
	mostre "\t1- Cadastrar Cliente\n\t2-Listar clientes\n\t3-Abrir Conta\n\t4-Depósitar\n\t5-Transferir Dinheiro\n\t6-Levantar Dinheiro\n\t7-Consultar Saldo\n\t8-Actualizar Dados do Cliente\n\t9-Sair\n\n\t OPÇÃO: "
	leia n
	limpatela
	escolha n
	caso 1:	
			x.codCli<-t+1
			mostre "\N================ Cadastrar cliente ======================\N\N"
			mostre "\n\tCódigo: ",x.codCli
			mostre "\n\tNome: "
			leia x.nome 
			mostre "\tTelefone: "
			leia x.telefone 
			
			cadastrar_cliente(x)
			escreva "---------------------------------------------------------\n"
			mostre "\N\tOBS: Cliente Cadastrado com sucesso!\N"
			mostre "\tDigite qualquer tecla para continuar "
			LITERAL cont
			leia cont
			
	caso 2: 
		c<-0
			mostre "\N================ Lista de Clientes ======================\N\N"
	
			para c de 0 ate t-1
				escreva "\tCódigo: ", clientes[c].codCli,"\n"
				escreva "\tNome: ", clientes[c].nome,"\n"
				escreva "\tTelefone: ", clientes[c].telefone,"\n"
				se conta[c].codCli=clientes[c].codCli entao
					se  conta[c].saldo=0 entao 
						mostre "\tNúmero Conta: ", conta[c].numConta,"\n"
					senao
						mostre "\tNúmero Conta: ", conta[c].numConta,"\n"
						escreva "\tSaldo: ", conta[c].saldo,"\n"	
					fimse
				fimse
				escreva "---------------------------------------------------------\n"
			fimpara
			mostre "\tDigite qualquer tecla para continuar "
			LITERAL cont
			leia cont
	caso 3:
		c<-0 
		mostre "\N================ Abertura de Conta ======================\N\N"

		mostre "\n\tDigite o id do Cliente a atribuir a conta: "
		inteiro codCli
		inteiro numC 
		leia codCli
		para c de 0 ate t-1
		se codCli=clientes[c].codCli entao
			Mostre "\n\tCódigo do Cliente: ", conta[c].codCli
			escreva "\tNome do Cliente: ", clientes[c].nome,"\n"
			conta[c].numConta<- strintparastr(1000+codCli)
			mostre "\n\tNúmero de Conta atribudo: ", conta[c].numConta
			escreva "\n---------------------------------------------------------\n"
			mostre "\N\tOBS: Conta Aberta com sucesso!\N"
			mostre "\tDigite qualquer tecla para continuar "
			LITERAL cont
			leia cont
		fimse
		fimpara
	caso 4: 
		
		mostre "\N================ Depósito ======================\N\N"
		mostre "\n\tDigite o número da Conta a depositar: "
		literal num
		leia num
		
		inteiro y<-bconta(num)
		
		se y=-1 entao
			mostre "\tOBS: Conta não encontrada "
			tpause(2000)
		senao
			inteiro saldo
			mostre "\tDigite o valor a depositar: "
			leia saldo
			depositar (num,saldo)
			tpause(2000)
		fimse
	caso 5:
		inteiro cRet, cRec
		inteiro saldo
		inteiro c1
		mostre "\N================ Transferir ======================\N\N"
		mostre "\n\tDigite o número da Conta a retirar valores: "
		leia cRet
		para c de 0 ate t-1 
		se cRet= conta[c].numConta entao
			mostre "\n\tDigite o número da Conta a receber valores: " 
			leia cRec
			para c1 de 0 ate t-1 
				se cRec= conta[c1].numConta entao
				mostre "\tDigite o valor a transferir: "
				leia saldo
					se conta[c].saldo>saldo entao
						conta[c1].saldo<-conta[c1].saldo + saldo
						conta[c].saldo<- conta[c].saldo-saldo
						escreva "\n---------------------------------------------------------\n"
						mostre "\N\tOBS: Transferencia feita com sucesso!\N"
						mostre "\tDigite qualquer tecla para continuar "
						LITERAL cont
						leia cont
					senao
						escreva "\n---------------------------------------------------------\n"
						mostre "\n\tOBs: Saldo Insuficiente"
						mostre "\tDigite qualquer tecla para continuar "
						LITERAL cont
						leia cont				
					fimse
				fimse
			fimpara	
		fimse
		fimpara
	caso 6:
		inteiro cRet
		inteiro saldo
		mostre "\N================ Levantar ======================\N\N"
		mostre "\n\tDigite o número da Conta a retirar valores: "
		leia cRet
		para c de 0 ate t-1 
		se cRet= conta[c].numConta entao
				mostre "\tDigite o valor a levantar: "
				leia saldo
					se conta[c].saldo>saldo entao
					conta[c].saldo<- conta[c].saldo-saldo
					escreva "\n---------------------------------------------------------\n"
				mostre "\N\tOBS: Levantamento feito com sucesso!\N"
				mostre "\tDigite qualquer tecla para continuar "
				LITERAL cont
				leia cont
					senao
					escreva "\n---------------------------------------------------------\n"
						mostre "\n\tOBs: Saldo Insuficiente"
						mostre "\tDigite qualquer tecla para continuar "
						LITERAL cont
						leia cont
					fimse	
				fimse
		fimpara	
	caso 7: 
		inteiro cVer
		inteiro saldo
		mostre "\N================ Consulta de Saldo ======================\N\N"
		mostre "\n\tDigite o número da Conta a Consultar: "
		leia cVer
		para c de 0 ate t-1 
			se cVer= conta[c].numConta entao
				mostre "\tSeu Saldo é de: ", conta[c].saldo, "Kz"
				escreva "\n\n---------------------------------------------------------\n"
				mostre "\tDigite qualquer tecla para continuar "
				LITERAL cont
				leia cont	
			fimse
		fimpara
	caso 8:
		mostre "\N================ Actualizar dados do Clente ======================\N\N"
		mostre "\n\tDigite o id do Cliente a actualizar: "
		inteiro codCli
		inteiro opc 
		leia codCli
		para c de 0 ate t-1 
		se codCli=clientes[c].codCli entao
			escreva "\tNome Actual: ", clientes[c].nome,"\n"
			escreva "\tTelefone Actual: ", clientes[c].telefone,"\n\n"
			mostre "\n\tO que deseja Editar:\n\t1-Nome do Cliente\n\t2-Telefone\n\t3-Tudo\n\n\tOpção: "
			leia opc
			escolha opc
			caso 1: 
				escreva "\tNovo Nome: "
				leia clientes[c].nome
			caso 2: 
				escreva "\tNovo Telefone: "
				leia clientes[c].Telefone
			caso 3:
				escreva "\tNovo Nome: "
				leia clientes[c].nome
				escreva "\tNovo Telefone: "
				leia clientes[c].Telefone
			defeito: 
			fimescolha
			escreva "\n---------------------------------------------------------\n"
			mostre "\N\tOBS: Dados Actualizados com sucesso, Verifique a Lista para saber como ficou.\N"
			mostre "\n\tDigite qualquer tecla para continuar "
			LITERAL cont
			leia cont
		fimse
		fimpara	
		
	defeito: 
		
	fimescolha
	enquanto n<>9
	backup()
fimalgoritmo