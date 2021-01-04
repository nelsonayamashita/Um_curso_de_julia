### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ f2e4d530-4879-11eb-34c7-a789f09098b1
begin
	using ImageFiltering
	using Images
	using DSP
end

# ╔═╡ 3a361240-4871-11eb-0c53-89985329af49
md"# Introdução à Convoluções"

# ╔═╡ 772904e2-4873-11eb-15bf-31f571b73621
md"Basicamente, uma convolução, no contexto de processamento de imagens, é um processo onde se forma uma nova imagem a partir de uma operação feita com os pixels vizinhos à um pixel analisado na imagem original"

# ╔═╡ 90593e9c-4879-11eb-1dd1-155c1d7eb5b4
load("imgs/conv.png")

# ╔═╡ acd35f1c-4879-11eb-0058-b15892848a35
md"## Criando um efeito de borrão"

# ╔═╡ aa32364e-487a-11eb-29f7-1fdf6f4c84f3
md"Uma boa ideia para criar um efeito de borrão seria calcular a média dos pixels ao redor do nosso pixel analisado:"

# ╔═╡ 67346a4e-487b-11eb-1be0-5f64083dea93
load("imgs/kirby.png")

# ╔═╡ 4b4198b6-488a-11eb-1308-d3b661d5760e
md"Vamos criar uma função que recebe uma matrz de pixels $n \times n$ e calcula sua média, retornado o pixel dessa média:"

# ╔═╡ 7f868550-488a-11eb-396b-ef6eb6c86cb9
function media_pixels(imagem)
	soma = sum(imagem)
	n = size(imagem)[1] # Size retornará um valor (n,n), então basta pegar o primeiro
	return soma/n^2
end

# ╔═╡ f88f8f7a-488a-11eb-15b2-9155d53a4490
cores = [RGB(1, 1, 1) RGB(0, 0  , 0   ) RGB(1, 0  , 0.5 )
		 RGB(0, 0, 0) RGB(1, 0  , 0.5 ) RGB(1, 0.5, 0.75)
      	 RGB(0, 0, 0) RGB(1, 0.5, 0.75) RGB(1, 0.5, 0.75)]

# ╔═╡ aaa82396-488b-11eb-15b5-819e0d376258
media_pixels(cores)

# ╔═╡ 24fcdc68-4891-11eb-24d5-75985fa817c6
md"No contexto de processamento de imagens chamamos essa matriz azul, na qual estamos calculando a média dos pixels ao redor do pixel analisado, de **núcleo** (*kernel*). Consequentemente se movermos o núcleo para outra região da imagem, por exemplo, uma com mais pixels pretos, o pixel médio será mais escuro: "

# ╔═╡ 4823c41a-4892-11eb-1d75-51c5306333fd
load("imgs/kirby2.png")

# ╔═╡ 93b2f5e8-4891-11eb-30fe-5d496b1358f7
cores2 = [RGB(0, 0, 0) RGB(1, 0.5, 0.75) RGB(0, 0, 0)
		  RGB(0, 0, 0) RGB(1, 0.5, 0.75) RGB(0, 0, 0)
      	  RGB(0, 0, 0) RGB(1, 0.5, 0.75) RGB(0, 0, 0)]

# ╔═╡ 581e3ce4-4892-11eb-05a6-57741d371ff6
media_pixels(cores2)

# ╔═╡ d6f5edda-4e2a-11eb-3390-5d9c6a103596
md"Aplicando o filtro com a função `imfilter()` (você também pode tentar fazer uma função que aplica nossa função anterior `media_pixels` em toda a imagem como um exercício) obtemos o seguinte resultado:"

# ╔═╡ f634f27e-4e28-11eb-2820-e3892988eca9
begin
	m = fill(1/9,(3,3))
	imfilter(load("imgs/kirby32.png"), m)
end

# ╔═╡ 189e6f92-4894-11eb-380c-71220be0f33a
md"Para imagens pequeenas esse resultado pode ser suficientemente bom, porém, normalmente, quando estamos utilizado núcleos e imagens maiores - por se tratar de uma média - ele acabam sendo um pouco ineficaze. Outra maneira de fazermos esse desfoque é com um **núcleo gaussiano**."

# ╔═╡ 93433806-4894-11eb-2c07-2b3f1aa17618
md"## Efeito de borrão com um núcelo gaussiano"

# ╔═╡ 552d4438-4df8-11eb-2504-4b6fee17e567
load("imgs/gaussian_kernel.png")

# ╔═╡ 8f7001a6-4dfa-11eb-391c-452e4f827923
md"A imagem acima é uma matriz de uma função gaussiana, caracterizada pela importante [curva normal](https://pt.wikipedia.org/wiki/Distribui%C3%A7%C3%A3o_normal), a qual possuí uma \"forma de sino\". Não é necessário entender seu conceito em sua completude para o resto da aula, apenas a noção de que essa função nos fornece uma matriz mais \"equilibrada\" do que simplesmente aplicar uma convolução com uma média."

# ╔═╡ d8cec3a4-4dfb-11eb-2cda-590ab9834057
md"Dentre os pacotes importados um deles é o `ImageFiltering`, o qual possuí uma classe chamada `Kernel` (núcleo), e dentro dessa classe possui-se um método chamado de `gaussian`, ele pode gerar uma matriz com um desvios padrões $\sigma_1 ... \sigma_d$ de dimensão $d$:"

# ╔═╡ d28c416e-4dfc-11eb-17ca-fbbad9c5dc35
nucleo = Kernel.gaussian((1,1)) # Não é necessário definir o parâmetro da dimensão

# ╔═╡ ed0dd6d8-4dfc-11eb-334e-f7ef5cef77a7
md"Uma observação a ser feita é a de que esse é um `OfssetArray`, por enquanto podemos entendê-lo como um *array* normal só que com um deslocamento em seus índices, no caso, esse se inicia na posição `-2` e termina na `2`"

# ╔═╡ da09efcc-4e01-11eb-022e-2d8723660f06
md"Vamos aplicar o efeito com uma função do pacote `ImageFiltering` chamada `imfilter()` em uma pintura de M.C.Escher:"

# ╔═╡ 8ebf0496-4e22-11eb-3622-3f21c16cbce6
img = load(download("https://uploads3.wikiart.org/images/m-c-escher/the-drowned-cathedral.jpg!Large.jpg"))

# ╔═╡ 9abc53fc-4e22-11eb-0388-35698d9073b9
imfilter(img, nucleo)

# ╔═╡ 54f92e0c-4e23-11eb-12a8-53ecf038bca9
md"Se nos aumentarmos o tamanho do núcleo o efeito de desfoque fica mais forte:"

# ╔═╡ 712628be-4e23-11eb-1b29-81c4696020ef
begin
	nucleo2 = Kernel.gaussian((5,5))
	imfilter(img, nucleo2)
end

# ╔═╡ a085bc0a-4e23-11eb-3613-8189b05ee583
md"## Outros exemplos de convoluções"

# ╔═╡ 08f1d9e0-4e24-11eb-004c-e55bd343b7cd
md"Agora veremos como convoluções podem ser utilizadas de maneiras bem interessantes para obter diversos tipos de tratamento de imagem, considere o seguinte núcleo:"

# ╔═╡ b201ed90-4e24-11eb-3f61-dfe672788fd8
nucleo_agucar = [ -0.5 -1.0 -0.5 
				  -1.0  7.0 -1.0
				  -0.5 -1.0 -0.5 ]

# ╔═╡ f3bf91a6-4e24-11eb-16f8-834c90a06987
imfilter(img, nucleo_agucar)

# ╔═╡ 03624748-4e25-11eb-3fdf-f75ee922a970
md"Repare que se somarmos todos os elementos do núcleo o resultado será um, isso significa que quando estamos em uma imagem monocromática, ou seja, todos os pixels possuem o mesmo valor, a imagem continuará a mesma, o que mostra como esse núcleo só fará algo não trivial quando há variação nas cores (valores) da imagem, aguçando-os"

# ╔═╡ b1f250f0-4e25-11eb-169b-894df6d40aba
md"Outro tipo de convolução que podemos trabalhar é com o efeito *sobel*, ele possuí um efeito muito interessante de fazer a detecção de bordas em imagens fazendo algo parecido com o núcleo anterior:"

# ╔═╡ 2153ad66-4e26-11eb-3f0a-1988a8de52c7
nucleo_sobel_v = Kernel.sobel()[1] # estaremos especificando o primeiro núcleo pois 									 este método cria dois tipos de detecção, uma 										 horizintal e uma vertical

# ╔═╡ 566223a4-4e26-11eb-2469-699536aebdae
v = imfilter(img, nucleo_sobel_v)

# ╔═╡ 88f12b6c-4e26-11eb-3af0-f1a906e698af
nucleo_sobel_h = Kernel.sobel()[2] # Agora para o filtro horizontal

# ╔═╡ 8ea66f36-4e26-11eb-17c5-394056e1677c
h = imfilter(img, nucleo_sobel_h)

# ╔═╡ 9a137076-4e26-11eb-3624-df766df9e6cd
total = (v + h) * 3 # Multiplicamos o valor para ficar mais claro

# ╔═╡ Cell order:
# ╠═f2e4d530-4879-11eb-34c7-a789f09098b1
# ╟─3a361240-4871-11eb-0c53-89985329af49
# ╟─772904e2-4873-11eb-15bf-31f571b73621
# ╟─90593e9c-4879-11eb-1dd1-155c1d7eb5b4
# ╟─acd35f1c-4879-11eb-0058-b15892848a35
# ╟─aa32364e-487a-11eb-29f7-1fdf6f4c84f3
# ╟─67346a4e-487b-11eb-1be0-5f64083dea93
# ╟─4b4198b6-488a-11eb-1308-d3b661d5760e
# ╠═7f868550-488a-11eb-396b-ef6eb6c86cb9
# ╠═f88f8f7a-488a-11eb-15b2-9155d53a4490
# ╠═aaa82396-488b-11eb-15b5-819e0d376258
# ╟─24fcdc68-4891-11eb-24d5-75985fa817c6
# ╟─4823c41a-4892-11eb-1d75-51c5306333fd
# ╠═93b2f5e8-4891-11eb-30fe-5d496b1358f7
# ╠═581e3ce4-4892-11eb-05a6-57741d371ff6
# ╟─d6f5edda-4e2a-11eb-3390-5d9c6a103596
# ╠═f634f27e-4e28-11eb-2820-e3892988eca9
# ╟─189e6f92-4894-11eb-380c-71220be0f33a
# ╟─93433806-4894-11eb-2c07-2b3f1aa17618
# ╟─552d4438-4df8-11eb-2504-4b6fee17e567
# ╟─8f7001a6-4dfa-11eb-391c-452e4f827923
# ╟─d8cec3a4-4dfb-11eb-2cda-590ab9834057
# ╠═d28c416e-4dfc-11eb-17ca-fbbad9c5dc35
# ╟─ed0dd6d8-4dfc-11eb-334e-f7ef5cef77a7
# ╟─da09efcc-4e01-11eb-022e-2d8723660f06
# ╟─8ebf0496-4e22-11eb-3622-3f21c16cbce6
# ╠═9abc53fc-4e22-11eb-0388-35698d9073b9
# ╟─54f92e0c-4e23-11eb-12a8-53ecf038bca9
# ╠═712628be-4e23-11eb-1b29-81c4696020ef
# ╟─a085bc0a-4e23-11eb-3613-8189b05ee583
# ╟─08f1d9e0-4e24-11eb-004c-e55bd343b7cd
# ╠═b201ed90-4e24-11eb-3f61-dfe672788fd8
# ╠═f3bf91a6-4e24-11eb-16f8-834c90a06987
# ╟─03624748-4e25-11eb-3fdf-f75ee922a970
# ╟─b1f250f0-4e25-11eb-169b-894df6d40aba
# ╠═2153ad66-4e26-11eb-3f0a-1988a8de52c7
# ╠═566223a4-4e26-11eb-2469-699536aebdae
# ╠═88f12b6c-4e26-11eb-3af0-f1a906e698af
# ╠═8ea66f36-4e26-11eb-17c5-394056e1677c
# ╠═9a137076-4e26-11eb-3624-df766df9e6cd
