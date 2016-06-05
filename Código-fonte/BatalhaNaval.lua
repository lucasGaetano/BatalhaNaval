--imprime o tabuleiro, Existem dois tipos de impress�o:
--*Impres�o normal onde o tabuleiro mostra-r� todas as posi��es abertas;
--*Impress�o especial onde o tabuleiro mostra-r� todas as posi��es ocultando os navios;

--@Param tabuleiro -> tabuleiro a ser impresso.
--@Param oposto -> Define se a impress�o do tabuleiro ser� normal ou especial.
imprimeTabuleiro = function(tabuleiro, oposto)
  if(oposto == false) then
    for linha=1,10 do
	mostra=""
	for coluna=1,10 do
	   mostra=mostra..tabuleiro[linha][coluna].."\t"
	end
	   print(mostra)
    end
  else
    for linha=1,10 do
	mostra=""
	for coluna=1,10 do
	   if(tabuleiro[linha][coluna] == 1) then
	   	mostra=mostra.."0".."\t"
	   else
	   mostra=mostra..tabuleiro[linha][coluna].."\t"
	   end
	end
	   print(mostra)
    end
  end
end

--------------------------------------------------------------------------------------------------
--Fun��o de cria��o dos tabuleiros
--@Return -> retorna tabuleiro tamanho 10x10.
--			 obs: tabuleiros criados j� s�o preechidos com valor 0 (Mar).
criarTabuleiro = function ()
    T = {}
    for linha=1,10 do
      T[linha] = {}
      for coluna=1,10 do
        T[linha][coluna] = 0
      end
    end
  return T
end
--------------------------------------------------------------------------------------------------
-- sess�o para digita��o das posi��es dos navios
--@Param tabuleiro--> tabuleiro onde os navios ser�o posicionados
posicionarNavios = function(tabuleiro)

	imprimeTabuleiro(tabuleiro,false)
	print ("Digite a posi��o do "..rodada.." � ".."navio")
	print("X:")
	x = io.read("*number")

	print("Digite a posi��o do "..rodada.." � ".."navio")
	print("Y:")
	y = io.read("*number")

	verifica = true

	while(verifica) do
--verifica se o "x" e "y" � maior que 0 e menor ou igual a 10
		if((x < 1 or x > 10) or (y < 1 or y > 10) or tabuleiro[x][y] == 1)then
			x = nil
			y = nil
			print("Posi��o inv�lida, digite novamente!")
			print("x:")
			x = io.read("*number")
			print("y:")
			y = io.read("*number")
		else
			print("posi��o v�lida!")
			tabuleiro[x][y] = 1
			verifica = false
		end
	end
end
--------------------------------------------------------------------------------------------------
--Verifica os tiros de cada jogador podendo ser navio, mar ou inv�lido:
--@Param x --> posi��o linha do tabuleiro
--@Param y --> posi��o coluna do tabuleiro
--@Param tabuleiro --> tabuleiro a qual a verifica��o ser� feita
verificaTiro = function(x,y,tabuleiro)
	verifica = true
	while(verifica) do
		if((x < 1 or x > 10) or (y < 1 or y > 10))then
			x = nil
			y = nil
			print("Posi��o inv�lida, digite novamente!")
			print("x:")
			x = io.read("*number")
			print("y:")
			y = io.read("*number")
		else
			verifica = false
		end
	end
	if(tabuleiro[x][y] == 1) then
		tabuleiro[x][y]= 2
		if(vez == 1) then
		   contadorJ1 = contadorJ1 + 1
		else
		   contadorJ2 = contadorJ2 + 1
		end
		print("Navio Destruido!")
	elseif(tabuleiro[x][y] == 0) then
		tabuleiro[x][y]= 3
		print("Tiro no mar!")
		if(vez == 1) then
			vez = 2
		elseif(vez == 2) then
			vez = 1
		end
	elseif(tabuleiro[x][y] == 2 or tabuleiro[x][y] == 3) then
		verificacao = true
		while(verificacao) do
			print("posi��o inv�lida")
			print("Digite a posi��o x do tiro:")
			x = io.read("*number")
			print("Digite a posi��o y do tiro:")
			y = io.read("*number")
			if(tabuleiro[x][y] == 1) then
				tabuleiro[x][y]= 2
				print("Navio Destruido!")
				if(vez == 1) then
					contadorJ1 = contadorJ1 + 1
				else
					contadorJ2 = contadorJ2 + 1
				end
				verificacao = false
			elseif(tabuleiro[x][y] == 0) then
				tabuleiro[x][y]= 3
				print("Tiro no mar!")
				if(vez == 1) then
					vez = 2
				elseif(vez == 2) then
					vez = 1
				end
				verificacao = false
			elseif(tabuleiro[x][y] == 2 or tabuleiro[x][y] == 3) then

			end
		end
	end
end
--------------------------------------------------------------------------------------------------
-- Estabelece a posi��o de cada tiro.
-- @Param tabuleiro--> tabuleiro onde o tiro ser� lan�ado
atirar = function (tabuleiro)
	print("Jogador "..vez.." Digite a posi��o x do tiro:")
	x = io.read("*number")
	print("Jogador "..vez.." Digite a posi��o y do tiro:")
	y = io.read("*number")
	verificaTiro(x,y,tabuleiro)
end
--------------------------------------------------------------------------------------------------
--fun��o para gerar um n�mero aleat�rio
--@Param intervaloInicial --> intervalo inicial para gera��o de possivel n�mero aleat�rio.
--@Param intervaloFinal --> intervalo final para gera��o de possivel n�mero aleat�rio.

--Ex. intervaloInicial = 1 e intervaloFinal = 10.
--Os possiveis n�meros para retorno ser�o{1,2,3,4,5,6,7,8,9,10}.

--@Return --> um n�mero aleat�rio que ficar� entre a dist�ncia estabelecida pelos parametros.
gerarNumeroAleatorio = function(intervaloInicial, intervaloFinal)
	math.randomseed(os.time())
	math.random()
	numero = math.random(intervaloInicial, intervaloFinal)
	return numero
end
--------------------------------------------------------------------------------------------------
--
posicionarNaviosComputador = function (tabuleiro)
for i = 1,3 do
	verifica = false
	math.randomseed(os.time())
	math.random()
	bloco = math.random(1,4)
	while(verifica == false) do
		if(bloco == 1) then
			x = gerarNumeroAleatorio(1,5)
			y = gerarNumeroAleatorio(1,5)
			if(tabuleiro[x][y] == 1) then
				x = nil
				y = nil
			else
				tabuleiro[x][y] = 1
				verifica = true
			end
		end
		if(bloco == 2) then
			x = gerarNumeroAleatorio(1,5)
			y = gerarNumeroAleatorio(6,10)
			if(tabuleiro[x][y] == 1) then
				x = nil
				y = nil
			else
				tabuleiro[x][y] = 1
				verifica = true
			end
		end
		if(bloco == 3) then
			x = gerarNumeroAleatorio(6,10)
			y = gerarNumeroAleatorio(1,5)
			if(tabuleiro[x][y] == 1) then
				x = nil
				y = nil
			else
				tabuleiro[x][y] = 1
				verifica = true
			end
		end
		if(bloco == 4) then
			x = gerarNumeroAleatorio(6,10)
			y = gerarNumeroAleatorio(6,10)
			if(tabuleiro[x][y] == 1) then
				x = nil
				y = nil
			else
				tabuleiro[x][y] = 1
				verifica = true
			end
		end
	end
end
end
------------------------------------------------------------------------------------------------------
print("                 Escolha o modo do jogo:                ")
print()
print()
print("1 = VS CPU")
print()
print("2 = Modo 2 jogadores (Local)")
escolha = io.read("*number")
print()
if(escolha == 1) then
	tabuleiroCPU = criarTabuleiro()
	tabuleiroJ1 = criarTabuleiro()
	posicionarNaviosComputador(tabuleiroCPU)
end

if(escolha == 2) then
-- Criando os tabuleiros
	tabuleiro1 = criarTabuleiro()
		print("Tabuleiro do jogador 1 foi criado!")
	tabuleiro2 = criarTabuleiro()
		print("Tabuleiro do jogador 2 foi criado!")

--Jogador 1 escolhe posi��o dos seus navios!
	print("vez do jogador 1:")
	print("Jogador 1, digite os valores:")
		rodada = 1
	for i = 1, 3 do
		posicionarNavios(tabuleiro1)
		rodada = rodada + 1
	end
		imprimeTabuleiro(tabuleiro1,false)

--Jogador 2 escolhe posi��o dos seus navios!
	print("vez do jogador 2:")
	print("Jogador 2, digite os valores:")
		rodada = 1
	for i = 1, 3 do
		posicionarNavios(tabuleiro2)
		rodada = rodada + 1
	end
		imprimeTabuleiro(tabuleiro2,false)

--Come�ando o jogo:
	contadorJ1 = 0
	contadorJ2 = 0
	vez = gerarNumeroAleatorio(1,2)
	print("O jogador "..vez.." Comecar� o jogo")

	while(vez ~= 0) do

		if(vez == 1) then
			imprimeTabuleiro(tabuleiro2,true)
			atirar(tabuleiro2)

			if(contadorJ1 == 3) then
				print("Jogador 1 ganhou!")
				vez = 0
			end
		elseif(vez == 2) then
			imprimeTabuleiro(tabuleiro1,true)
			atirar(tabuleiro1)

			if(contadorJ2 == 3) then
				print("Jogador 2 ganhou!")
				vez = 0
			end
		end
	end
end
