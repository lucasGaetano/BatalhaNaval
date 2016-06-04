--~ luaunit = require('luaunit')


--A funÃ§Ã£o gera um nÃºmero aleatÃ³rio de 1 a 4. Isso define
--em qual bloco a inteligÃªncia irÃ¡ posicionar os navios.
--@Param tabuleiro--> o tabuleiro onde os navios serÃ£o posicionados.

posicionarNavios = function (tabuleiro)
	math.randomseed(os.time())
	math.random()
	bloco = math.random(1,4)
	colocarNavios(bloco, tabuleiro)
end
-------------------------------------------------
--
colocarNavios = function(numero, tabuleiro)
	local posicao1, posicao2
	local verifica = false
	if (numero == 1) then
		verifica = false
		while(verifica == false) do
			posicao1 = gerarNumeroAleatorio(1,5)
			posicao2 = gerarNumeroAleatorio(1,5)
			if(tabuleiro[posicao1][posicao2] == 1) then
				return
			else
				tabuleiro[posicao1][posicao2] = 1
				verifica = true
			end
		end
		elseif (numero == 2) then
			verifica = false
			while(verifica == false) do
				posicao1 = gerarNumeroAleatorio(1,5)
				posicao2 = gerarNumeroAleatorio(6,10)
				if(tabuleiro[posicao1][posicao2] == 1) then
					return
				else
					tabuleiro[posicao1][posicao2] = 1
					verifica = true
				end
			end
		elseif(numero == 3)	then
			verifica = false
			while(verifica == false) do
				posicao1 = gerarNumeroAleatorio(6,10)
				posicao2 = gerarNumeroAleatorio(1,5)
				if(tabuleiro[posicao1][posicao2] == 1) then
					return
				else
					tabuleiro[posicao1][posicao2] = 1
					verifica = true
				end
			end
		elseif(numero == 4) then
			verifica = false
			while(verifica == false) do
				posicao1 = gerarNumeroAleatorio(6,10)
				posicao2 = gerarNumeroAleatorio(6,10)
				if(tabuleiro[posicao1][posicao2] == 1) then
					return
				else
					tabuleiro[posicao1][posicao2] = 1
					verifica = true
				end
			end
		else
	end
end
--------------------------------------------------------------
--funÃ§Ã£o para gerar um nÃºmero aleatÃ³rio
--@Param intervaloInicial --> intervalo inicial para geraÃ§Ã£o de possivel nÃºmero aleatÃ³rio.
--@Param intervaloFinal --> intervalo final para geraÃ§Ã£o de possivel nÃºmero aleatÃ³rio.

--Ex. intervaloInicial = 1 e intervaloFinal = 10.
--Os possiveis nÃºmeros para retorno serÃ£o{1,2,3,4,5,6,7,8,9,10}.

--@Return --> nÃºmero.
gerarNumeroAleatorio = function(intervaloInicial, intervaloFinal)
math.randomseed(os.time())
math.random()
numero = math.random(intervaloInicial, intervaloFinal)
return numero
end

------------------------------------------------------------------------
--imprime o tabuleiro, Existem dois tipos de impressão:
--*Impresão normal onde o tabuleiro mostra-rá todas as posições abertas;
--*Impressão especial onde o tabuleiro mostra-rá todas as posições ocultando os navios;

--@Param tabuleiro -> tabuleiro a ser impresso.
--@Param oposto -> Define se a impressão do tabuleiro será normal ou especial.
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
--------------------------------------------------------------------------
--Função de criação dos tabuleiros
--@Return -> retorna tabuleiro tamanho 10x10.
--			 obs: tabuleiros criados já são preechidos com valor 0 (Mar).
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
---------------------------------------------------------------------------
--Teste verifica se o tabuleiro está gerado corretamente
function verificaBarcos (tabuleiro)
	local contador = 0
	for linha=1,10 do
		for coluna=1,10 do
			if(tabuleiro[linha][coluna] == 1) then
				contador = contador + 1
			end
		end
		return contador
	end
end
------------------------------------------------------------------------
tabuleiro = criarTabuleiro()
for i = 1, 3 do
	posicionarNavios(tabuleiro)
end
imprimeTabuleiro(tabuleiro, false)

--~ TestTabuleiro = {} --classe de testes
--~ 	function TestTabuleiro:testVerificaSeTabuleiroTemNavios()
--~ 		luaunit.assertEquals(verificaBarcos(tabuleiro),3)
--~ 	end

--~ os.exit( luaunit.LuaUnit.run())
