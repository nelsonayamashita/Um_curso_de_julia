### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ f1e3e90c-47b2-11eb-0a3c-fb0307c2f3e4
begin
	using Images
	infinite = load("infinite.jpg")
end

# ╔═╡ 7b821d72-47b1-11eb-217f-31fde77b4b1c
md"# Processamento de Imagem"

# ╔═╡ c9bdfe50-47b8-11eb-3c15-4de7f49d5ea6
md"## Carregando a Imagem"

# ╔═╡ 26d305ba-47b2-11eb-16bd-35f2c7ccf391
#Imagem de uma das minhas pinturas favoritas de Giorgio de Chirico

url = "https://uploads6.wikiart.org/images/giorgio-de-chirico/the-nostalgia-of-the-infinite-1913.jpg!Large.jpg"

# ╔═╡ dbc8a1dc-47b2-11eb-1d68-ad41d496cfb9
download(url, "infinite.jpg")

# ╔═╡ 10c652f8-47b3-11eb-1e17-1d105bc2154a
typeof(infinite)

# ╔═╡ 17cd3df0-47b8-11eb-1f86-1d603d504b0a
md"RRBX é a representação de um pixel!"

# ╔═╡ 35a5285e-47b5-11eb-293d-b3300cf8ca24
RGBX(1, 1, 0.5)

# ╔═╡ 7b7245e2-47b5-11eb-1695-7bf272f1ef5a
size(infinite)

# ╔═╡ 298799d2-47b8-11eb-1837-4dff36de0605
md"Pode-se acessar o píxel correspondente da imagem"

# ╔═╡ b9218f74-47b5-11eb-1ba2-a5b756127c31
infinite[100, 50]

# ╔═╡ 801af6d0-47b9-11eb-10b0-21972111bb5d
md"## Cortando a Imagem"

# ╔═╡ 385c16ae-47b8-11eb-0b2e-9b6c8ef19628
md"Pode-se dar slice na imagem"

# ╔═╡ e888ec76-47b5-11eb-2171-f136905d5caf
infinite[250:350, 40:140]

# ╔═╡ 6a37b7da-47b8-11eb-2db3-15234de77ddd
md"Vamos capturar algo mais interessante, como as pessoas na pintura"

# ╔═╡ 1de4eb36-47b6-11eb-22c9-cb8b7a021b7a
begin
	(h,l) = size(infinite)
	pessoas = infinite[(4*h ÷ 7):(5*h ÷ 7),(2*l÷6):(3*l÷6)]
end

# ╔═╡ 88af6372-47b8-11eb-0f68-a9c1205c130d
md"pode-se usar notações de latex no Julia:
   ÷ é divisão de inteiros, escreve-se com `\"\div\" + <TAB>`"

# ╔═╡ a6bbc4a6-47b7-11eb-2004-51f7dcc9b0bf
size(pessoas)

# ╔═╡ f64a2a6c-47b7-11eb-33fc-57eb97d21266
md"## Concatenando Imagens"

# ╔═╡ 9622810a-47b9-11eb-3251-a71a772dc713
begin
	(h2,l2) = size(infinite)
	predio = infinite[1:(2*h2÷3), 1:(2*l2÷3)]
end

# ╔═╡ 1df170aa-47ba-11eb-169c-4fe1eca6049a
[predio predio]

# ╔═╡ 2550159a-47ba-11eb-3a58-4158633a2e3e
[
 predio                  reverse(predio, dims=2)
 reverse(predio, dims=1) reverse(reverse(predio, dims=2), dims=1)
]

# ╔═╡ 5c087348-47ba-11eb-06a2-553e10d92c3e
md"## Modificando uma Imagem"

# ╔═╡ 3795967c-47bc-11eb-00f2-c5199981593b
novo_ininite = copy(infinite)

# ╔═╡ 72e68618-47bc-11eb-1ceb-3353834f30f3
md"Vamos pintar a imagem copiada com alguma cor"

# ╔═╡ 84c2d254-47bc-11eb-06e4-a9f1b6298954
vermelho = RGB(1, 0, 0)

# ╔═╡ 997d3810-47bc-11eb-044c-a5f2e540c781
for i in 1:100
	for j in 1:30
		novo_ininite[i, j] = vermelho
	end
end

# ╔═╡ da756f66-47bc-11eb-00fb-9150f68975c1
novo_ininite

# ╔═╡ d646e5a2-47bc-11eb-1e49-f3049da02393
md"Porém, ao invés de utilizar algo como os loops, pode-se usar uma especifidade do Julia chamada de **Broadcasting**"

# ╔═╡ 424652ce-47bd-11eb-243a-ef1af28913bf
md"Quando há um \".\" na operação, basicamente ele está fazendo aquela operação elemento-a-elemento (*element-wise*)"

# ╔═╡ 66eb8598-47bd-11eb-1526-ed118d7532e6
begin
	novo_ininite2 = copy(novo_ininite)
	novo_ininite2[100:200, 1:30] .= RGB(0, 0, 1) #repare no "."
	novo_ininite2
end

# ╔═╡ ad72cc12-47bd-11eb-1d74-377de35ebaf7
md"## Trabalhando com operações *element-wise*"

# ╔═╡ 5adccfba-47be-11eb-25ed-4d867dc318b3
md"As operações *element-wise* podem ser trabalhadas com outras operações que não as definidas no proprio Julia. Para isso, vamos definir uma função, `verdificar`"

# ╔═╡ 86c7253a-47be-11eb-33d8-29f6351cf10f
function verdificar(cor)
	return RGB(0, cor.g, 0)
end

# ╔═╡ b441c984-47be-11eb-0dd2-0f1e8ffe4d31
begin
	cor = RGB(1,0.5,0.8)
	[cor, verdificar(cor)]
end

# ╔═╡ 12802a86-47bf-11eb-29b0-59047f263c1d
begin
	cor2 = RGB(0.6,0.9,0.4)
	[cor2, verdificar(cor2)]
end

# ╔═╡ 37962e6a-47bf-11eb-39b2-6f974c2964c9
verdificar(novo_ininite)

# ╔═╡ 614ca0d6-47bf-11eb-3c35-43d5112b2b24
md"Repare que o erro ocorreu porque a função `verdificar` recebe como parâmetro apenas uma cor - um pixel - agora repare no que acontece quando utilizamos o `.` (operação *element-wise*)"

# ╔═╡ 98b54032-47bf-11eb-393c-81d433eda703
verdificar.(novo_ininite)

# ╔═╡ a0e77b94-47bf-11eb-20a5-e31890fb2a44
md"Vamos criar outra função agora chamada de `clarear`, o que ela fará é somar algum valor n aos pixeis da imagem"

# ╔═╡ 1d6beeb6-47c0-11eb-2718-614f48153001
function clarear(cor, x)
	return RGB(cor.r + x, cor.g + x, cor.b + x)
end

# ╔═╡ 3d768cf2-47c0-11eb-1c4e-21eef334e895
clarear.(novo_ininite2, 0.3)

# ╔═╡ Cell order:
# ╟─7b821d72-47b1-11eb-217f-31fde77b4b1c
# ╟─c9bdfe50-47b8-11eb-3c15-4de7f49d5ea6
# ╠═26d305ba-47b2-11eb-16bd-35f2c7ccf391
# ╠═dbc8a1dc-47b2-11eb-1d68-ad41d496cfb9
# ╠═f1e3e90c-47b2-11eb-0a3c-fb0307c2f3e4
# ╠═10c652f8-47b3-11eb-1e17-1d105bc2154a
# ╟─17cd3df0-47b8-11eb-1f86-1d603d504b0a
# ╠═35a5285e-47b5-11eb-293d-b3300cf8ca24
# ╠═7b7245e2-47b5-11eb-1695-7bf272f1ef5a
# ╟─298799d2-47b8-11eb-1837-4dff36de0605
# ╠═b9218f74-47b5-11eb-1ba2-a5b756127c31
# ╟─801af6d0-47b9-11eb-10b0-21972111bb5d
# ╟─385c16ae-47b8-11eb-0b2e-9b6c8ef19628
# ╠═e888ec76-47b5-11eb-2171-f136905d5caf
# ╟─6a37b7da-47b8-11eb-2db3-15234de77ddd
# ╠═1de4eb36-47b6-11eb-22c9-cb8b7a021b7a
# ╟─88af6372-47b8-11eb-0f68-a9c1205c130d
# ╠═a6bbc4a6-47b7-11eb-2004-51f7dcc9b0bf
# ╟─f64a2a6c-47b7-11eb-33fc-57eb97d21266
# ╠═9622810a-47b9-11eb-3251-a71a772dc713
# ╠═1df170aa-47ba-11eb-169c-4fe1eca6049a
# ╠═2550159a-47ba-11eb-3a58-4158633a2e3e
# ╟─5c087348-47ba-11eb-06a2-553e10d92c3e
# ╠═3795967c-47bc-11eb-00f2-c5199981593b
# ╟─72e68618-47bc-11eb-1ceb-3353834f30f3
# ╠═84c2d254-47bc-11eb-06e4-a9f1b6298954
# ╠═997d3810-47bc-11eb-044c-a5f2e540c781
# ╠═da756f66-47bc-11eb-00fb-9150f68975c1
# ╟─d646e5a2-47bc-11eb-1e49-f3049da02393
# ╟─424652ce-47bd-11eb-243a-ef1af28913bf
# ╠═66eb8598-47bd-11eb-1526-ed118d7532e6
# ╟─ad72cc12-47bd-11eb-1d74-377de35ebaf7
# ╟─5adccfba-47be-11eb-25ed-4d867dc318b3
# ╠═86c7253a-47be-11eb-33d8-29f6351cf10f
# ╠═b441c984-47be-11eb-0dd2-0f1e8ffe4d31
# ╠═12802a86-47bf-11eb-29b0-59047f263c1d
# ╠═37962e6a-47bf-11eb-39b2-6f974c2964c9
# ╟─614ca0d6-47bf-11eb-3c35-43d5112b2b24
# ╠═98b54032-47bf-11eb-393c-81d433eda703
# ╟─a0e77b94-47bf-11eb-20a5-e31890fb2a44
# ╠═1d6beeb6-47c0-11eb-2718-614f48153001
# ╠═3d768cf2-47c0-11eb-1c4e-21eef334e895
