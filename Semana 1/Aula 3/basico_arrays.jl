### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ a7bdcbf0-47fe-11eb-242d-df35f22b94dc
begin
	using Pkg
	Pkg.add("Images")
	using Images
end

# ╔═╡ 968de61c-47fe-11eb-1e3a-8f58752178a3
md"Na célula abaixo apenas estipulamos quais pacotes serão utilizados:"

# ╔═╡ 598423bc-47fe-11eb-358b-098b8385d423
md"# O Básico de Arrays"

# ╔═╡ 633f5b38-47fe-11eb-1e13-6df4abeb2acf
md"Na aula passada vimos como alguns conceitos da programação seguem uma linha lógica e padronizada, podendo assim abstrair alguns conceitos sobre *arrays*, agora, vamos ver como trabalhar melhor com essa estrutura"

# ╔═╡ c4b9e1ba-47fe-11eb-3ef9-adc938004559
md"## Inicializando Arrays"

# ╔═╡ ea0a861a-47fe-11eb-1ff9-294db17d91a9
v = [1, 2, 3, 4] # Vetor

# ╔═╡ 2b81e872-47ff-11eb-27a7-cb78b9aa51f4
size(v)

# ╔═╡ e0bfa57c-47fe-11eb-3e9a-794205d08ccc
md"Em Julia podemos usar uma sintaxe mais simples e próxima da matemática para definir *arrays*"

# ╔═╡ 1190b8bc-47ff-11eb-056b-618ab6b14ba4
w = [1 2 3
	 4 5 6]

# ╔═╡ 2ec8be8e-47ff-11eb-0cdc-9dc26dde2cfa
size(w)

# ╔═╡ 371a5fb6-47ff-11eb-0c24-2d1770e56da5
md"## Acessando os elementos"

# ╔═╡ 52a680b6-47ff-11eb-1149-ffeee17a2414
md"Como em muitas outras linguagens, utiliza-se a estrutura `nome_do_array[i]` para acessar o elemento de endereço(índice) **i**"

# ╔═╡ 438486e6-47ff-11eb-0e39-d17a13c252ae
v[0]

# ╔═╡ 493be4be-47ff-11eb-1692-957dd1fe5ce7
md"Se você já programou em outras linguagens irá notar que ocorre um erro quando tentamos acessar o elemento de índice **0** em algum *array* em Julia. Isso ocorre pois em Julia *arrays* começam pelo endereço **1**. Foi decidido assim porque Julia é uma linguagem mais focada em matemática e computação matemática, onde índices geralmente começam no **1**"

# ╔═╡ b1ad4374-47ff-11eb-3a5b-d191dc065e2d
v[1]

# ╔═╡ b423cbd2-47ff-11eb-050a-9d21cde44134
w[1]

# ╔═╡ e77e624e-47ff-11eb-3e1a-73a1d8681886
md"Repare que se o *array* for de duas dimensões, e escrevermos apenas a primeira, será considerada a primeira posição na segunda dimensão (mesma coisa que escrever `w[1,1]`)"

# ╔═╡ cb7f64a8-47ff-11eb-2920-addbbcdc5397
w[2]

# ╔═╡ bfba3cd8-47ff-11eb-3f46-8b88975b730c
w[2,2]

# ╔═╡ 32a60666-4800-11eb-0aef-4de7a63b3222
md"Se formos pegar toda a linha, podemos utiizar o caractere de `:`"

# ╔═╡ b747e8ca-47ff-11eb-2fd4-91016a9ec376
w[1,:] # Vetor

# ╔═╡ bda83094-47ff-11eb-295e-d1f0c0ab5b5d
md"Analogamente, pode-se pegar a coluna trocando a posição do `:`"

# ╔═╡ 6c6219a6-4800-11eb-0af6-27261293bbb6
w[:,2] # Vetor

# ╔═╡ 754f00ee-4800-11eb-310b-37cd2e0c6004
md"Podemos também dar *slices*(cortar) os *arrays* utilizando o caractere `:`"

# ╔═╡ c7247c8a-4800-11eb-1a7a-1357651067aa
w[:,2:3] # Matriz

# ╔═╡ 3eded5d6-4801-11eb-2fee-95dcd63f2338
md"## Gerando outros tipos de Arrays"

# ╔═╡ 80025b5a-4801-11eb-203b-c17c06772369
md"A função `rand(intervalo, n, m)` gera uma matriz (n,m) com números aleatórios em um intervalo"

# ╔═╡ 564e32fc-4801-11eb-0088-0bd07c976e2b
A1 = rand(1:9, 3, 4) 

# ╔═╡ b0d17eb6-4801-11eb-0a7c-c3d6587dc483
A2 = rand(1:9, 3, 4)

# ╔═╡ b6123406-4801-11eb-3ca0-f7a359cf3d9a
cores = [RGB(0.3, 0.53, 0.4), RGB(0.4, 0.64, 0.5), RGB(0.88, 0.7, 0.47), RGB(0.87, 0.8, 0.6), RGB(0.9, 0.47, 0.6), RGB(0.62, 0, 0.31)]

# ╔═╡ 0034c1ec-4803-11eb-22d0-f5422017900e
A3 = rand(cores, 10, 10)

# ╔═╡ 080241fe-4803-11eb-20d9-f399d3975a48
A4 = rand(cores, 10, 10)

# ╔═╡ 1776d276-4803-11eb-3103-d1f71ece3fd7
peao = load(download("https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/256x256/plain/chess_piece_pawn.png"))

# ╔═╡ 81d7a7d0-4803-11eb-1aa6-4128f3462d05
cavalo = load(download("https://image.flaticon.com/icons/png/512/32/32648.png"))

# ╔═╡ 90a96e2e-4803-11eb-3ee4-49dff8e2f190
A5 = rand([peao, cavalo], 3, 3)

# ╔═╡ b14e3e7a-4803-11eb-1c76-63413127d092
md"## Modificando os Arrays"

# ╔═╡ f9dfe87a-4803-11eb-367c-173e142314e3
begin
	B = copy(A1)
	B[1,1] = 10000
	B
end

# ╔═╡ 434350e0-4804-11eb-1692-4bb46d381220
C = fill(peao, 3, 3)

# ╔═╡ 52d49dd6-4804-11eb-33aa-a10d20989cef
begin
	D = copy(C)
	D[2,2] = cavalo
	D
end

# ╔═╡ 6ed0b0b6-4804-11eb-3e7d-194f42343532
md"## Utilizando o *for loop* em *arrays*"

# ╔═╡ b7c80ab4-4804-11eb-03de-05994fd75408
md"Podemos utilizar o for loop como em outras linguagens:"

# ╔═╡ ebe84fde-4804-11eb-3356-1dcb3fffef5a
begin
	
	F = fill(0, 4, 4)

	for i=1:4
		for j=1:4
			F[i,j] = i*j
		end
	end
	
	F
end

# ╔═╡ 31043074-4805-11eb-266d-1db331dc27f1
md"Podemos também fazer um loop duplo:"

# ╔═╡ 3eaacf1a-4805-11eb-0dcf-bd68c4c05e7d
begin
	
	F2 = fill(0, 4, 4)
	
	for i=1:4, j=1:4
		F2[i,j] = i*j
	end
	
	F2
end

# ╔═╡ 6c1815a4-4805-11eb-1b52-3d5d2697c323
md"Ou melhor ainda, um loop compreendido (*list comprehension*):"

# ╔═╡ 98998a86-4805-11eb-0350-9da94afa4422
F3 = [i*j for i=1:4, j=1:4]

# ╔═╡ b0903090-4805-11eb-24dc-6fc2250178c5
md"## Operadores e operadores elemento-a-elemento"

# ╔═╡ f6cf5982-4805-11eb-10f2-b51c7e79d5e6
md"Como vimos brevemente na primeira aula, podemos usar o caractere `.` para indicar operações elemento-a-elemento"

# ╔═╡ 09db4d6a-4806-11eb-065b-b79da2954935
F3^2

# ╔═╡ 18d22c6c-4806-11eb-0fba-7b3c0dbb0ef7
F3.^2 # Repare no "."

# ╔═╡ 1e634a6c-4806-11eb-04aa-e1cc92521188
md"Repare que no primeiro caso multiplicamos a matriz por ela mesma, enquanto no segundo caso, elevamos cada elemento da matriz ao quadrado"

# ╔═╡ 624b114c-4806-11eb-280c-bb1c0281c9e9
md"## Concatenação de Arrays"

# ╔═╡ 6b10c9ac-4806-11eb-31dd-a3089723318a
md"Em Julia podemos facilmente concatenar(juntar) arrays os escrevendo como elementos de um array:" 

# ╔═╡ 89bc683e-4806-11eb-0dd7-e757ceb3b2fb
[F2 F3]

# ╔═╡ 9c3329be-4806-11eb-3dc3-2d47d1636995
[C D]

# ╔═╡ 92485a1c-4806-11eb-0890-8b2850b1db12
[A3 A4]

# ╔═╡ 8df26174-4806-11eb-0f73-05f9ba7a55aa
[A3 ; A4]

# ╔═╡ dad60554-4806-11eb-1efc-019c8bb129e7
[A3 A3 ; A4 A4]

# ╔═╡ Cell order:
# ╟─968de61c-47fe-11eb-1e3a-8f58752178a3
# ╠═a7bdcbf0-47fe-11eb-242d-df35f22b94dc
# ╟─598423bc-47fe-11eb-358b-098b8385d423
# ╟─633f5b38-47fe-11eb-1e13-6df4abeb2acf
# ╟─c4b9e1ba-47fe-11eb-3ef9-adc938004559
# ╠═ea0a861a-47fe-11eb-1ff9-294db17d91a9
# ╠═2b81e872-47ff-11eb-27a7-cb78b9aa51f4
# ╟─e0bfa57c-47fe-11eb-3e9a-794205d08ccc
# ╠═1190b8bc-47ff-11eb-056b-618ab6b14ba4
# ╠═2ec8be8e-47ff-11eb-0cdc-9dc26dde2cfa
# ╟─371a5fb6-47ff-11eb-0c24-2d1770e56da5
# ╟─52a680b6-47ff-11eb-1149-ffeee17a2414
# ╠═438486e6-47ff-11eb-0e39-d17a13c252ae
# ╟─493be4be-47ff-11eb-1692-957dd1fe5ce7
# ╠═b1ad4374-47ff-11eb-3a5b-d191dc065e2d
# ╠═b423cbd2-47ff-11eb-050a-9d21cde44134
# ╟─e77e624e-47ff-11eb-3e1a-73a1d8681886
# ╠═cb7f64a8-47ff-11eb-2920-addbbcdc5397
# ╠═bfba3cd8-47ff-11eb-3f46-8b88975b730c
# ╟─32a60666-4800-11eb-0aef-4de7a63b3222
# ╠═b747e8ca-47ff-11eb-2fd4-91016a9ec376
# ╟─bda83094-47ff-11eb-295e-d1f0c0ab5b5d
# ╠═6c6219a6-4800-11eb-0af6-27261293bbb6
# ╟─754f00ee-4800-11eb-310b-37cd2e0c6004
# ╠═c7247c8a-4800-11eb-1a7a-1357651067aa
# ╟─3eded5d6-4801-11eb-2fee-95dcd63f2338
# ╟─80025b5a-4801-11eb-203b-c17c06772369
# ╠═564e32fc-4801-11eb-0088-0bd07c976e2b
# ╠═b0d17eb6-4801-11eb-0a7c-c3d6587dc483
# ╠═b6123406-4801-11eb-3ca0-f7a359cf3d9a
# ╠═0034c1ec-4803-11eb-22d0-f5422017900e
# ╠═080241fe-4803-11eb-20d9-f399d3975a48
# ╠═1776d276-4803-11eb-3103-d1f71ece3fd7
# ╠═81d7a7d0-4803-11eb-1aa6-4128f3462d05
# ╠═90a96e2e-4803-11eb-3ee4-49dff8e2f190
# ╟─b14e3e7a-4803-11eb-1c76-63413127d092
# ╠═f9dfe87a-4803-11eb-367c-173e142314e3
# ╠═434350e0-4804-11eb-1692-4bb46d381220
# ╠═52d49dd6-4804-11eb-33aa-a10d20989cef
# ╟─6ed0b0b6-4804-11eb-3e7d-194f42343532
# ╟─b7c80ab4-4804-11eb-03de-05994fd75408
# ╠═ebe84fde-4804-11eb-3356-1dcb3fffef5a
# ╟─31043074-4805-11eb-266d-1db331dc27f1
# ╠═3eaacf1a-4805-11eb-0dcf-bd68c4c05e7d
# ╟─6c1815a4-4805-11eb-1b52-3d5d2697c323
# ╠═98998a86-4805-11eb-0350-9da94afa4422
# ╟─b0903090-4805-11eb-24dc-6fc2250178c5
# ╟─f6cf5982-4805-11eb-10f2-b51c7e79d5e6
# ╠═09db4d6a-4806-11eb-065b-b79da2954935
# ╠═18d22c6c-4806-11eb-0fba-7b3c0dbb0ef7
# ╟─1e634a6c-4806-11eb-04aa-e1cc92521188
# ╟─624b114c-4806-11eb-280c-bb1c0281c9e9
# ╟─6b10c9ac-4806-11eb-31dd-a3089723318a
# ╠═89bc683e-4806-11eb-0dd7-e757ceb3b2fb
# ╠═9c3329be-4806-11eb-3dc3-2d47d1636995
# ╠═92485a1c-4806-11eb-0890-8b2850b1db12
# ╠═8df26174-4806-11eb-0f73-05f9ba7a55aa
# ╠═dad60554-4806-11eb-1efc-019c8bb129e7
