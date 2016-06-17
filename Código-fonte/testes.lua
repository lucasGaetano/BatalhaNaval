listaNavios = {}
listaNavios[1] = {}
listaNavios[2] = {}
listaNavios[3] = {}

--~ for i = 1, 4 do
--~ 	if(navios[2][i] ~= nil) then
--~ 		print(navios[2][i])
--~ 	else
--~ 		i = 4
--~ 	end
--~ end
rodada = 2

if (rodada == 1) then
	print("Posicione o "..rodada.."° navio: ")
	print("X:") x = io.read("*number")
	print("Y:") y = io.read("*number")

	listaNavios[rodada] = {x, y}

elseif (rodada == 2) then
	print("Posição inicial do "..rodada.."° navio: ")
	print("X:") x = io.read("*number")
	print("Y:") y = io.read("*number")

	listaNavios[rodada] = {x, y}

	print("Posição final do "..rodada.."° navio: ")
	print("X:") x = io.read("*number")
	print("Y:") y = io.read("*number")

	table.insert(listaNavios[rodada], x, y)

elseif (rodada == 3) then
	print("Posição inicial do "..rodada.."° navio: ")
	print("X:") x = io.read("*number")
	print("Y:") y = io.read("*number")

	listaNavios[rodada] = {x, y}

	print("Posição final do "..rodada.."° navio: ")
	print("X:") x = io.read("*number")
	print("Y:") y = io.read("*number")

	if(listaNavios[3][1] == x)

	table.insert(listaNavios[rodada], x, y)
end

for i = 1, 10 do
	if(listaNavios[2][i] ~= nil) then
		print(listaNavios[2][i])
	else
		i = 10
	end
end
