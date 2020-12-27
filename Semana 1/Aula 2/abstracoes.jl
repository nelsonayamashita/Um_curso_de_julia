### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 41608b0e-47db-11eb-1a2d-01abc3019342
begin
	using Pkg
	Pkg.add("Images")
	using Images
end

# ╔═╡ c67c4016-47d0-11eb-1f80-c1b239bae3ac
md"# Noções de abstrações"

# ╔═╡ 902af04e-47db-11eb-3a35-afe36b306970
md"Na célula abaixo apenas estipulamos os pacotes que utilizaremos"

# ╔═╡ 0f3b7e22-47d1-11eb-15d2-19084dd2c509
md"## Arrays de Inteiros"

# ╔═╡ 06b2db72-47d1-11eb-0f64-ad09baf70167
md"Na computação *arrays* (geralmente traduzidos como vetores em português, porém vou evitar essa tradução já que *vectors* em Julia tem um significado mais específico) são estruturas extremamente úteis e relevante, talvez as mais utilizadas. Basicamente eles são arranjos de alguma tipo específico (inteiros, floats, strings, etc) onde cada um desses elementos possui um endereço - um índice."

# ╔═╡ 5478117e-47d3-11eb-1c2a-e335ee3939aa
elemento = 1

# ╔═╡ 5ffb8ce2-47d3-11eb-3a3c-91582ef1a189
fill(elemento, 3, 4)

# ╔═╡ 69f94f54-47d3-11eb-11a3-21bf7c298df5
typeof(elemento)

# ╔═╡ 705b59e6-47d3-11eb-283c-c1e7ca5adb36
md"## Arays de Floats"

# ╔═╡ 20bf897e-47d4-11eb-150e-47067e52b1a8
md"É fácil notar que é simples criar um elemento de outra coisa que não inteiros, simplesmente podemos mudar o tipo do elemento. Lembre-se que *Floats* são, basicamente números reais - \"números com vírgula\""

# ╔═╡ 435b1926-47d4-11eb-1f53-39288aca4714
elemento_float = 1.0

# ╔═╡ 4861e4b8-47d4-11eb-03ba-6310bc344bd3
fill(elemento_float, 3, 4)

# ╔═╡ 4e00e0c2-47d4-11eb-2c08-630053cf595e
typeof(elemento_float)

# ╔═╡ 542dd268-47d4-11eb-2b87-5fb479d1082c
md"## Arays de Strings"

# ╔═╡ 6b59e17c-47d5-11eb-1a49-39e786ac42d0
md"Lembre-se que strings são basicamente textos - coisas que estão entre aspas (\"\")"

# ╔═╡ 89a921ba-47d5-11eb-265a-3d6573df809b
elemento_string = "um"

# ╔═╡ 9d828776-47d5-11eb-3c0f-2135b9d3f839
fill(elemento_string, 3, 4)

# ╔═╡ ab3906d0-47d5-11eb-1ef9-d335fc3dd45b
typeof(elemento_string)

# ╔═╡ 112b9c0a-47d9-11eb-3de0-2f07ad7670b7
md"## Arrays de Racionais"

# ╔═╡ 33870096-47d9-11eb-0780-e9b7eb40740e
md"Em Julia possuimos uma estrura para tipos racionais:"

# ╔═╡ 42f9130c-47d9-11eb-144b-9b84e8828658
elemento_racional = 1//1

# ╔═╡ 49be3014-47d9-11eb-1a87-c714a9194408
fill(elemento_racional, 3, 4)

# ╔═╡ 524b6774-47d9-11eb-391f-05a63370d243
typeof(elemento_racional)

# ╔═╡ 5b5465fa-47d9-11eb-283e-45e3b80e1867
md"Repare como o elemento é um \"Racional de Inteiros\", ou seja, um tipo que é feito de outros tipos, como os *arrays*!"

# ╔═╡ b1993bce-47d5-11eb-2a46-5d5adaa29523
md"## Arrays de Arrays"

# ╔═╡ bf074a1c-47d5-11eb-04dd-cba30feff4c7
md"Importante lembrar que na computação, sempre se tenta seguir padrões, logo, se criamos um *array* com essas estruturas de dados, é uma conclusão lógica que também podemos criar um *array* - um arranjo - com *arrays* de algum elemento"

# ╔═╡ 11f42e52-47d6-11eb-1178-e1edf4a74ba4
elemento_array = [1 2 ; 3 4]

# ╔═╡ 6d9b2f62-47d6-11eb-2345-4509d0bd3d7b
fill(elemento_array, 3, 4)

# ╔═╡ 754c0e7a-47d6-11eb-251c-21c759858617
typeof(elemento_array)

# ╔═╡ 7c0dc980-47d6-11eb-0c3c-550f8c6451c3
md"Pode-se notar que os elemento de nosso *array* são, justamente, *arrays* de duas dimensões com elementos inteiros"

# ╔═╡ 470fbc24-47da-11eb-358f-79386e31b818
md"## Arrays de Imagens"

# ╔═╡ 149ed6ee-47da-11eb-262e-1d5563a647b1
md"Logicamente, se podemos fazer um *array* de *arays*, analogamente, podemos criar um *array* de imagens - que nada mais são do que *arrays* de pixels"

# ╔═╡ 4e2f3106-47da-11eb-1b8e-b16bda86049d
url = "https://lh3.googleusercontent.com/proxy/S_tsQgGyTd8ZpbKpGPV0RCwZhoP0rPHdxzq6h0JYkrFdchf7gSyw2cmGVMUOTb3OxHt-nPH2uODhZ2ADEXJ8dl3vGhZCa9SB-8ue7efXew7kwBW2BjMF"

# ╔═╡ 907c93aa-47da-11eb-0fa3-6dbdc40c6f7a
elemento_img = load(download(url))

# ╔═╡ ae1ef164-47da-11eb-1e94-7f0369750cb0
fill(elemento_img, 3, 4)

# ╔═╡ f1f10482-47db-11eb-2136-550f984be1b8
typeof(elemento_img)

# ╔═╡ fdd710c8-47db-11eb-2154-25e62e83311a
md"Pode-se notar como mesmo mudando os elementos, o processo da criação do *array* e como ele está representado muda pouco, ou seja, pouco importa o tipo do que é feito o *array*, ele sempre se comportará de uma maneira independente do dele. Logo escreveremos funções que manipularão *arrays* e também terão essa propriedade de se comportarem de maneira independente e previsíveis."

# ╔═╡ Cell order:
# ╟─c67c4016-47d0-11eb-1f80-c1b239bae3ac
# ╟─902af04e-47db-11eb-3a35-afe36b306970
# ╠═41608b0e-47db-11eb-1a2d-01abc3019342
# ╟─0f3b7e22-47d1-11eb-15d2-19084dd2c509
# ╟─06b2db72-47d1-11eb-0f64-ad09baf70167
# ╠═5478117e-47d3-11eb-1c2a-e335ee3939aa
# ╠═5ffb8ce2-47d3-11eb-3a3c-91582ef1a189
# ╠═69f94f54-47d3-11eb-11a3-21bf7c298df5
# ╟─705b59e6-47d3-11eb-283c-c1e7ca5adb36
# ╟─20bf897e-47d4-11eb-150e-47067e52b1a8
# ╠═435b1926-47d4-11eb-1f53-39288aca4714
# ╠═4861e4b8-47d4-11eb-03ba-6310bc344bd3
# ╠═4e00e0c2-47d4-11eb-2c08-630053cf595e
# ╟─542dd268-47d4-11eb-2b87-5fb479d1082c
# ╟─6b59e17c-47d5-11eb-1a49-39e786ac42d0
# ╠═89a921ba-47d5-11eb-265a-3d6573df809b
# ╠═9d828776-47d5-11eb-3c0f-2135b9d3f839
# ╠═ab3906d0-47d5-11eb-1ef9-d335fc3dd45b
# ╟─112b9c0a-47d9-11eb-3de0-2f07ad7670b7
# ╟─33870096-47d9-11eb-0780-e9b7eb40740e
# ╠═42f9130c-47d9-11eb-144b-9b84e8828658
# ╠═49be3014-47d9-11eb-1a87-c714a9194408
# ╠═524b6774-47d9-11eb-391f-05a63370d243
# ╟─5b5465fa-47d9-11eb-283e-45e3b80e1867
# ╟─b1993bce-47d5-11eb-2a46-5d5adaa29523
# ╟─bf074a1c-47d5-11eb-04dd-cba30feff4c7
# ╠═11f42e52-47d6-11eb-1178-e1edf4a74ba4
# ╠═6d9b2f62-47d6-11eb-2345-4509d0bd3d7b
# ╠═754c0e7a-47d6-11eb-251c-21c759858617
# ╟─7c0dc980-47d6-11eb-0c3c-550f8c6451c3
# ╟─470fbc24-47da-11eb-358f-79386e31b818
# ╟─149ed6ee-47da-11eb-262e-1d5563a647b1
# ╠═4e2f3106-47da-11eb-1b8e-b16bda86049d
# ╠═907c93aa-47da-11eb-0fa3-6dbdc40c6f7a
# ╠═ae1ef164-47da-11eb-1e94-7f0369750cb0
# ╠═f1f10482-47db-11eb-2136-550f984be1b8
# ╟─fdd710c8-47db-11eb-2154-25e62e83311a
