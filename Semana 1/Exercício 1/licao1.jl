### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ d53c4a78-4f94-11eb-2baf-e587cdab4ed7
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Images", "ImageMagick"])
	using Images
end

# ╔═╡ f780fe1e-4fba-11eb-0023-850bad65e808
begin
	Pkg.add("PlutoUI")
	using PlutoUI
end

# ╔═╡ dcc741e8-4f93-11eb-20f6-91d4b4b0488d
md"# Lição 1 - Convoluções"

# ╔═╡ f112dce0-4f93-11eb-0ef6-0d409ff699fc
md"Esse notebook possui uma série de exercícios relativos à semana 1 do curso. Algumas das questões possuirão checagem automática da resposta, representados por uma caixa colorida, quando a caixa está amarela significa que o exercício ainda não foi resolvido, verde que você acertou a resposta e vermelho que a resposta está errada. Para isso você deverá editar a célula relativa ao exercício."

# ╔═╡ c55a4f6a-4f94-11eb-2ccd-f1d49cae59db
md"Como de costume vamos especificar os pacotes que utilizaremos:"

# ╔═╡ 0f47b4c8-4f95-11eb-07ef-e9f623230936
md"""
## Exercício 1 - Manipulando vetores

Um **Vetor** é um array de uma dimensão
""" 

# ╔═╡ 193cf6be-4f95-11eb-26e5-47328c1ab8c1
vetor_exemplo = [0.5, 0.4, 0.3, 0.2, 0.1, 0.0, 0.7, 0.0, 0.7, 0.9]

# ╔═╡ edf8bf8c-4f95-11eb-2e6b-df37349ef6f2
md"""
### Exercício 1.1
👉 Faça um vetor aleatório `vetor_aleatorio` de tamanho 10 com a função `rand()`
"""

# ╔═╡ ecf45558-4f98-11eb-3341-31a6f74aca09
md"👉 Faça a função `media()` usando um `for` loop, a qual calcula a média de um vetor de números."

# ╔═╡ ebb72ed8-4fa3-11eb-3ee5-995d752c7da3
md"👉 Defina `m` como a média de `vetor_aleatorio`."

# ╔═╡ afcc53bc-4fa5-11eb-1fff-6d2c56fdfc3a
md"""👉 Escreva uma função `tira_media`, que recebe um vetor `x` e subtrai a média de cada valor em `x`."""

# ╔═╡ e2f66cd2-4fa5-11eb-228a-0b44226e6d12
md"""
Vamos checar se a média de `tira_media(vetor_aleatorio)` é 0:

*por conta de incertezas de ponto flutuante, o resultado pode não ser exatamente 0*
"""

# ╔═╡ c89f83cc-4fa6-11eb-227e-5ba3bd8b4759
md"""
### Exercício 1.2
👉 Generate a vector of 100 zeros. Change the center 20 elements to 1.
"""

# ╔═╡ 76e43116-4fa8-11eb-0234-830556110fdc
md"""
### Exercício 1.3
👉 Escreva uma função que torna um `Vetor` de `Vetor`s em uma `Matriz`.
"""

# ╔═╡ 6af78af4-4faa-11eb-0b8b-c38ab0d64270
md"""


👉 Escreva uma função que transforma uma `Matriz` em um `Vetor` de `Vetor`es .
"""

# ╔═╡ 7beb740c-4f95-11eb-3ffb-f3ff441ec1cb
begin
	colorir_linha(x::Vector{<:Real}) = Gray.(Float64.((hcat(x)')))
	colorir_linha(x::Any) = nothing
end

# ╔═╡ 895efdd4-4f95-11eb-242b-a9c7610b3c47
colorir_linha(vetor_exemplo)

# ╔═╡ f53fa76e-4faa-11eb-3e4f-1f1d200ab072
md"""
## Exercício 2 - Manipulando imagens

Nesse exercício nós vamos nos familiarizar com matrizes (*arrays* de duas dimensões) em Julia manipulando imagens. Lembre-se que em Julia, imagens são matrizes de objetos de cor `RGB`.
"""

# ╔═╡ 35e88438-4fac-11eb-3794-2d82a1ef0ca2
md"Vamos carregar outra pintura de Girgio de Chirico"

# ╔═╡ bd01653e-4fac-11eb-31c5-a16560d178ef
begin
	torre = Images.load(download("https://uploads7.wikiart.org/images/giorgio-de-chirico/the-red-tower-1913.jpg!Large.jpg"))
end

# ╔═╡ cb69d71e-4fac-11eb-37c2-bf1200e5e7c0
md"*Acho que dá para perceber que eu gosto bastante desse pintor, né*"

# ╔═╡ 339ab4ec-4fae-11eb-2f3e-c9b49104b72e
md"""
### Exercício 2.1

👉 Escreva uma função media_cores que aceita um objeto chamada de `image`. Ela deve calcular a média da quantidade de vermelho, verde e azul na imagem, e retornar uma tupla (r, g, b) dessas médias.
"""

# ╔═╡ 74ea8278-4faf-11eb-182d-1334102584eb
md"""
### Exercício 2.2

👉 A função `floor(x)` retorna o valor inteiro do mesmo tipo de `x` que é menor ou igual à `x`. Use-a para escrever a função `quantificar(x::Number)` que recebe um valor de $x$ (que você pode assumir estar entre 0 e 1) e o \"quantifica\" em números de largura 0.1. Por exemplo, 0.267 virá 0.2.
"""

# ╔═╡ 6d123fbc-4fb1-11eb-1500-411879a49d1b
md"""
### Exercício 2.3
👉 Escreva o segundo **método** da função `quantifica()`, ou seja, uma *nova versão* da função com o *mesmo* nome. Esse método vai aceitar o objeto cor chamado `cor`, do tipo `AbstractRGB`.

*Escreva a função na mesma célula que a `quantifica(x::Number)` do exercício passado* 👆

Aqui, `::AbstractRGB` é um **tipo de notação**. Isso nos assegura que quando alguém passar um objeto o qual o **subtipo** é do tipo abstrato `AbstractRGB`. Por exemplo, ambos os tipos `RGB` e `RGBX` satisfazem isso.

O método que você vai escrever deve retornar um **novo** objeto do tipo `RGB`, o qual cada componente ($r,g$ e $b$) (vermelho, verde e azul) estão quantificados.
"""

# ╔═╡ 9ab9f38c-4fb2-11eb-34cc-a92c30f6decb
md"""
### Exercício 2.4

👉 Escreva o método `quantifica(imagem::AbstractMatrix)` que quantifica uma imagem, quantificando cada pixel da imagem. (Você pode assumir que a matriz é uma matriz de objetos de cor)

*Escreva a função na mesma célula que a `quantifica(x::Number)` do exercício passado* 👆

Vamos aplicar seu método!
"""

# ╔═╡ 133dfa56-4fb3-11eb-1f45-2fe4de2fb77f
md"""
### Exercício 2.5

👉 Escreva uma função `inverter` a qual inverte a cor, ou seja, `(r, g, b)` vira `(1-r, 1-g, 1-b)` 
"""

# ╔═╡ 63970676-4fb3-11eb-0a6b-278d5f0c9a76
function inverter(cor::AbstractRGB)
	
	return missing
end

# ╔═╡ 76bea544-4fb3-11eb-2f1d-670554b9c899
md"Vamos inverter algumas cores:"

# ╔═╡ 6104037a-4fb3-11eb-0cd9-79ad0d4a128c
preto = RGB(0,0,0)

# ╔═╡ 8aa64a8c-4fb3-11eb-0724-df50b81be6fd
inverter(preto)

# ╔═╡ 97ed2cd6-4fb3-11eb-2856-6b62bdb73a15
vermelho = RGB(1,0,0)

# ╔═╡ a5fcf9b4-4fb3-11eb-017f-5fbb8fc4b675
inverter(vermelho)

# ╔═╡ 88302360-4fb4-11eb-2b5a-156bd18db321
md"Vocẽ consegue inverter a pintura?"

# ╔═╡ 9adaa9f4-4fb4-11eb-0161-7d8f3656128d
md"""
### Exercício 2.6

👉 Escreva a função `adiciona_ruido(x::Number, s)` para adicionar aleatoriedade de uma intensidade $s$ ao valor $x$, ou seja, adicionar um valor aleatório entre $-s$ e $+s$ à $x$. Se o resultado cair fora do intervalo (0,1), você deve "limitar" o valor de volta à esse intervalo. (Obs: Existe uma função `clamp()` já implementando no Julia, mas você deverá criar sua própria função `limitar(x)`.)
"""

# ╔═╡ aa26f9b4-4fb7-11eb-0f53-515679a89553
md"""
👉  Escreva o segundo método `aplica_ruido(c::AbstractRGB, s)` para um barulho aleatorio de intensidade $s$ para cada um dos valores $(r, g, b)$ em cada cor.

*Escreva a função na mesma célula que em `aplica_ruido(x::Number)` do último exercício. 👆*
"""

# ╔═╡ b8e79b62-4fbb-11eb-2aa0-cf47a72d505a
@bind ruido_cor Slider(0:0.01:1, show_value=true)

# ╔═╡ 4f2c855e-4fb9-11eb-1486-b5df04d6569b
md"""👉 Escreva o terceiro método `aplica_ruido(imagem::AbstractMatrix, s)` para aplicar ruído para cada pixel de uma imagem.

*Escreva a função na mesma célula que em `aplica_ruido(x::Number)` do último exercício. 👆*
"""

# ╔═╡ f22e5926-4fbb-11eb-0fe5-c146f5980b99
@bind ruido_torre Slider(0:0.01:8, show_value=true)

# ╔═╡ b90b98a4-4fbc-11eb-16d3-5794322db207
md"""
### Exercício 3 - Convoluções

Como visto nas aulas, podemos usar a técnica matemática das **convoluções** para aplicar efeitos interessantes em imagens.

Conceitualmente nós podemos pensar $M$ como uma matriz. Na prática, em Julia ela será uma `Matriz` de objetos de cor, e teremos que tratá-la como tal, porém teremos que escrever uma função **genérica** que vai funcionar para qualquer tipo de dado dentro da matriz.

A convolução funciona em uma **janela** pequena de uma imagem, ou seja, uma região centrada ao redor do ponto $(i,j)$. Nos iremos pressupor que a janela é um quadrado de tamanho ímpar e comprimento $2l + 1$, percorrendo de $-\ell,...,0,...,\ell$.

O resultado da convolução sobre uma janela, centrada no ponto $(i,j)$ é um *único número*; esse número é o valor que vamos usar para nossa nova imagem $M'_{i,j}$

Para começarmos vamos nos restringir à convoluções em uma dimensão. Então a janela é uma região de uma dimensão de $-\ell$ até $\ell$.
"""

# ╔═╡ 4aaddb6a-4fcb-11eb-3046-b9be8cd540a7
md"Vamos criar um vetor `v` de números aleatórios e comprimento `n=100`"

# ╔═╡ 757c8f30-4fcb-11eb-381a-27b6d1cc51b7
n = 100

# ╔═╡ 79f8beee-4fcb-11eb-078b-3f8d8c4b934d
v = rand(n)

# ╔═╡ 7eb04bfc-4fcb-11eb-1683-adec6202a732
md"""

### Exercício 3.1
👉 Tente desenhar o vetor `v` usando `colorir_linha(v)`
"""

# ╔═╡ e9a04f1e-4fcb-11eb-3fc1-fd031d738882


# ╔═╡ f4967272-4fcb-11eb-34de-7b7098298940
md"""
### Exercício 3.2

Nós precisamos decidir como vamos trabalhar com as **condições de borda**, ou seja, o que vai acontecer quando formos tentar acessar uma posição no vetor `v` que está fora do intervalo `1:n`. A solução mais simples é assumir que &v_i& é 0 fora do vetor original, porém isso pode gerar efeitos estranhos.

Uma solução melhor é usar o valor *mais próximo* que estão dentro do vetor. Efetivamente nos estaremos \"estendendo\" o vetor e copiando os valores extremos nessas posições externas.

👉 Escreva a função `estender(v, i)` que checa se a posição $i$ está dentro de `1:n`. Caso esteja, retorna o $i$-ésimo componente de `v`; caso contrário, retorna o valor mais próximo.

"""

# ╔═╡ 3452acc2-4fcd-11eb-0a33-892a9586d423
md"*Alguns casos teste*"

# ╔═╡ 6da66464-4fcd-11eb-2aa2-812e82a085eb
md"Estendido com 0:"

# ╔═╡ 6ea95d62-4fcd-11eb-2bf6-93342a1f52fa
colorir_linha([0,0,vetor_exemplo..., 0, 0])

# ╔═╡ 83246da6-4fcd-11eb-3195-bb30fbaa5d70
md"Estendido com sua função `estender()`"

# ╔═╡ f71384f2-4fcd-11eb-396b-af2fad0df31c
md"""
### Exercício 3.3

👉 Escreva a função `borar_1D(v,l)` que borra o vetor `v` com uma janela de comprimento `l` calculando a média dos elementos dentro dessa janela, de $-\ell$ até $\ell$. 
"""

# ╔═╡ 74c9f250-4fce-11eb-0a0e-df15d1ca47e4
function borar_1D(v, l)
	
	return missing
end

# ╔═╡ a0a3e014-4fce-11eb-372b-8bad064204f8
md"""
### Exercício 3.4

👉 Aplique o borrão no seu vetor `v Mostre o original e o novo vetor criando duas células que utilizam a função `colorir_linha()`. Faça o parâmetro $\ell$ interativo, utilizando *sliders* assim como os do exercício 2. 
"""

# ╔═╡ 0e8f7b08-4fcf-11eb-3eef-3dfead0e514c


# ╔═╡ 4f124962-4fcf-11eb-17be-7be93f21bb20
md"""
### Exercício 3.5

Esse borrão é um exemplo simples de **convolução**, ou seja, uma função linear de uma janela ao redor de cada ponto, dado por

$$v'_i = \sum_n v_{i-n}k_n,$$

onde $k$ é o vetor chamando de **núcleo** (*kernel*).

Novamente. nos precisamos nos preparar para o que acontece se $v_{i-n}$ caí para fora do vetor.

👉 Escreva a função `convoluciona_vetor(v, k)` que executa a convolução. Você tem que pensar no vetor $k$ como sendo *centrado* na posição $i$. Assim $n$ na fórmula acima percorre por $-\ell$ e $\ell$, onde $2\ell + 1$ é o comprimento do vetor $k$. Você vai precisar fazer as manipulações necessárias nos índices.

"""

# ╔═╡ ed8deb8a-4fd1-11eb-3acf-8f950864c3b9
md"""
### Exercício 3.6

👉 Escreva a função `nucleo_gaussiano`.

A definição de um Gaussiano em 1D é

$$G(x) = \frac{1}{\sqrt{2\pi \sigma^2}} \exp \left( \frac{-x^2}{2\sigma^2} \right)$$

Onde $x$ será cada píxel dentro da região de tamanho $n^2$, depois **normalize** para que a soma do núcleo seja 1.

Por simplicidade assuma $σ = 1$
"""

# ╔═╡ bfac0188-4fd2-11eb-3e10-c75841d61a06
md"Vamos testar sua função de núcleo!"

# ╔═╡ c81fdb46-4fd2-11eb-3a08-bfa84f03c869
nucleo_gaussiano_1D = 3 # mude esse valor ou implemente um slider!

# ╔═╡ 2f89a9e0-4fd3-11eb-3141-3de7e093eb70
md"""
## Exercício 4 - Convoluções de imagem

Agora vamos trabalhar com imagens, ou seja, em duas dimensões. A convoluções é dado por uma matriz **núcleo** $K$

$$M'_{i, j} = \sum_{k, l}  \, M_{i- k, j - l} \, K_{k, l},$$

onde a soma é sobre valores possíveis de $k$ e $l$ na janela. Novamente, devemos pensar na janela como sendo *centrada* em $(i,j)$.

Uma notação comum para essa operação é $*$:

$$M' = M * K.$$
"""

# ╔═╡ 3dc0a4f2-5073-11eb-1106-c7b15f288804
md"""
### Exercício 4.1


👉 Escreva uma função `estender_mat` que recebe uma matriz  `M` e os índices `i` e `j`, e retorna o elemento mais próximo da matriz.
"""

# ╔═╡ 6f1c167e-5075-11eb-2c28-6b0d6219cdb6
md"*Vamos testar!*"

# ╔═╡ 8915c188-5075-11eb-1b62-835db5aa22ce
imagenzinha = Gray.(rand(5,5))

# ╔═╡ 199d063e-5077-11eb-36a7-b172d63a349a
md"Estendido com `0`:"

# ╔═╡ 51899526-5077-11eb-0f2f-a3e2bef024a1
[get(imagenzinha, (i, j), Gray(0)) for (i,j) in Iterators.product(-1:7,-1:7)]

# ╔═╡ a93281b0-5078-11eb-09bf-cb6d1d110d5d
md"""
### Exercício 4.2
👉Implemente uma função `convolve_imagem(M, K)`

"""

# ╔═╡ ceba5818-5078-11eb-143c-8353703ccb0d
function convolve_imagem(M::AbstractMatrix, K::AbstractMatrix)
	
	return missing
end

# ╔═╡ febd7628-5078-11eb-3e27-e1043bd52e46
md"*Vamos testar!*"

# ╔═╡ 0825ad6e-5079-11eb-3d7b-2bbf413a31bf
teste_imagem_borda = [get(imagenzinha, (i, j), Gray(0)) for (i,j) in Iterators.product(-1:7,-1:7)]

# ╔═╡ 41936686-5079-11eb-25ae-996ac5f09a4b
K_teste = [ 
	0   0  0
	1/2 0  1/2
	0   0  0
]

# ╔═╡ 6a87483c-5079-11eb-298d-618ce1f1b2ed
convolve_imagem(teste_imagem_borda, K_teste)

# ╔═╡ 858ad874-5079-11eb-077f-efdfd2b77bc0
convolve_imagem(torre, K_teste)

# ╔═╡ 928ac4f8-5079-11eb-0966-41bc77d675c2
md"Você pode criar qualquer tipo de efeito mudando o núcleo de maneiras diferentes. Por enquanto nós vamos implementar dois núcleos especiais, um **Desfoque Gaussiano** e **Detecção de borda Sobel**."

# ╔═╡ 40d1ecee-507a-11eb-1fb3-734cb9daea29
md"""
### Exercício 4.3
👉 Aplique um **Desfoque Gaussiano**

Aqui, definimos um núcleo Gaussiano 2D como

$$G(x,y)=\frac{1}{2\pi \sigma^2}\exp \left (\frac{-(x^2+y^2)}{2\sigma^2} \right)$$
"""

# ╔═╡ 00a00312-507b-11eb-3e80-fd91a6ca11ab
md"""
### Exercício 4.4
👉 Criar um **Detecção de Borda Sobel**.

Aqui teremos que criar dois filtros separados, assim poderemos detectar bordas nas horizontais e nas verticais:

```math
\begin{align}

G_x &= \left(\begin{bmatrix}
1 \\
2 \\
1 \\
\end{bmatrix} \otimes [1~0~-1]
\right) * A = \begin{bmatrix}
1 & 0 & -1 \\
2 & 0 & -2 \\
1 & 0 & -1 \\
\end{bmatrix}*A\\
G_y &= \left(
\begin{bmatrix}
1 \\
0 \\
-1 \\
\end{bmatrix} \otimes [1~2~1]
\right) * A = \begin{bmatrix}
1 & 2 & 1 \\
0 & 0 & 0 \\
-1 & -2 & -1 \\
\end{bmatrix}*A
\end{align}
```

Aqui $A$ é um *array* corresponde com sua imagem, Podemos pensar como derivadas no sentido de $x$ e $y$.

Então os combinamos achando a magnitude do **gradiente** (no mesmo contexto que cálculo multi variável) definido por

$$G_\text{total} = \sqrt{G_x^2 + G_y^2}.$$

Por simplicidade você pode escolher um dos \"canais\" (cores) na imagem para aplicar isso.
"""

# ╔═╡ c9108e88-4f96-11eb-0b58-6bddf7c63a4b
hint(text) = Markdown.MD(Markdown.Admonition("hint", "Dica", [text]))

# ╔═╡ 52f70cf2-4f98-11eb-2bb0-ebc25971596d
hint(md"Lembre-se da função `rand()` que vimos nas aulas passadas. Você também pode descobrir mais sobre qualquer função criando uma célula nova e digitando:

```
?rand
```

Você também pode abrir o *Live docs* no canto inferior direito, ele te dará informação sobre qualquer função e caracteres reservados da linguagem.
	")

# ╔═╡ 8ecb4f3e-4fae-11eb-166c-e1a69d381664
hint(md"Lembre-se das funções `sum()` (que faz a somatória de um *array*) e da função `length()` que retorna o tamanho de um *array*")

# ╔═╡ 656d28f4-4fb5-11eb-20c4-d95fa69638a3
hint(md"Você pode acessar uma cor específica de um pixel escrevendo `nome_do_pixel.<inicial da cor em inglês>`, por exemplo, para pegarmos a parte vermelha de im pixel podemos escrever:
	
```
pixel.r
```
	")

# ╔═╡ 529b0316-4fb7-11eb-247b-b790e2301080
hint(md"A função `rand()` gera um ponto flutuante uniformemente aleatório emtre $0$ e $1$")

# ╔═╡ 7e7d56e6-4fd0-11eb-0a6f-f3c216f476dc
hint(md"`l = (length(k) - 1) ÷ 2`")

# ╔═╡ d2c60912-4f96-11eb-092c-69e96e2ad762
almost(text) = Markdown.MD(Markdown.Admonition("warning", "Quase lá!", [text]))

# ╔═╡ ea5dd62c-4f96-11eb-3324-658b6f548c72
still_missing(text=md"Troque `faltando` por sua resposta") = Markdown.MD(Markdown.Admonition("warning", "Lá vamos nós!", [text]))

# ╔═╡ 0fd7c458-4f97-11eb-3efc-d37f2ea5c7f0
keep_working(text=md"A respota não está correta.") = Markdown.MD(Markdown.Admonition("danger", "Continue tentando!", [text]))

# ╔═╡ 0fd00d76-4f97-11eb-28a8-832057df550b
yays = [md"Boa!", md"Yay ❤", md"Massa! 🎉", md"Bem feito!", md"Continue assim!", md"Arrasou!", md"Sensacional!", md"Acertou!", md"Vamos para o próximo!"]

# ╔═╡ 6fa8eb1e-4f97-11eb-2713-13cd16ab4ac3
correct(text=rand(yays)) = Markdown.MD(Markdown.Admonition("correct", "Acertou!", [text]))

# ╔═╡ a23c85d6-4f97-11eb-1665-69b2c4a548f0
not_defined(variable_name) = Markdown.MD(Markdown.Admonition("danger", "Uepa!", [md"Vocẽ definiu a variável: **$(Markdown.Code(string(variable_name)))** ?"]))

# ╔═╡ a22fe1b4-4f97-11eb-029f-4902d24f7297
function camera_input(;max_size=200, default_url="https://i.imgur.com/SUmi94P.png")
"""
<span class="pl-image waiting-for-permission">
<style>
	
	.pl-image.popped-out {
		position: fixed;
		top: 0;
		right: 0;
		z-index: 5;
	}

	.pl-image #video-container {
		width: 250px;
	}

	.pl-image video {
		border-radius: 1rem 1rem 0 0;
	}
	.pl-image.waiting-for-permission #video-container {
		display: none;
	}
	.pl-image #prompt {
		display: none;
	}
	.pl-image.waiting-for-permission #prompt {
		width: 250px;
		height: 200px;
		display: grid;
		place-items: center;
		font-family: monospace;
		font-weight: bold;
		text-decoration: underline;
		cursor: pointer;
		border: 5px dashed rgba(0,0,0,.5);
	}

	.pl-image video {
		display: block;
	}
	.pl-image .bar {
		width: inherit;
		display: flex;
		z-index: 6;
	}
	.pl-image .bar#top {
		position: absolute;
		flex-direction: column;
	}
	
	.pl-image .bar#bottom {
		background: black;
		border-radius: 0 0 1rem 1rem;
	}
	.pl-image .bar button {
		flex: 0 0 auto;
		background: rgba(255,255,255,.8);
		border: none;
		width: 2rem;
		height: 2rem;
		border-radius: 100%;
		cursor: pointer;
		z-index: 7;
	}
	.pl-image .bar button#shutter {
		width: 3rem;
		height: 3rem;
		margin: -1.5rem auto .2rem auto;
	}

	.pl-image video.takepicture {
		animation: pictureflash 200ms linear;
	}

	@keyframes pictureflash {
		0% {
			filter: grayscale(1.0) contrast(2.0);
		}

		100% {
			filter: grayscale(0.0) contrast(1.0);
		}
	}
</style>

	<div id="video-container">
		<div id="top" class="bar">
			<button id="stop" title="Stop video">✖</button>
			<button id="pop-out" title="Pop out/pop in">⏏</button>
		</div>
		<video playsinline autoplay></video>
		<div id="bottom" class="bar">
		<button id="shutter" title="Click to take a picture">📷</button>
		</div>
	</div>
		
	<div id="prompt">
		<span>
		Enable webcam
		</span>
	</div>

<script>
	// based on https://github.com/fonsp/printi-static (by the same author)

	const span = currentScript.parentElement
	const video = span.querySelector("video")
	const popout = span.querySelector("button#pop-out")
	const stop = span.querySelector("button#stop")
	const shutter = span.querySelector("button#shutter")
	const prompt = span.querySelector(".pl-image #prompt")

	const maxsize = $(max_size)

	const send_source = (source, src_width, src_height) => {
		const scale = Math.min(1.0, maxsize / src_width, maxsize / src_height)

		const width = Math.floor(src_width * scale)
		const height = Math.floor(src_height * scale)

		const canvas = html`<canvas width=\${width} height=\${height}>`
		const ctx = canvas.getContext("2d")
		ctx.drawImage(source, 0, 0, width, height)

		span.value = {
			width: width,
			height: height,
			data: ctx.getImageData(0, 0, width, height).data,
		}
		span.dispatchEvent(new CustomEvent("input"))
	}
	
	const clear_camera = () => {
		window.stream.getTracks().forEach(s => s.stop());
		video.srcObject = null;

		span.classList.add("waiting-for-permission");
	}

	prompt.onclick = () => {
		navigator.mediaDevices.getUserMedia({
			audio: false,
			video: {
				facingMode: "environment",
			},
		}).then(function(stream) {

			stream.onend = console.log

			window.stream = stream
			video.srcObject = stream
			window.cameraConnected = true
			video.controls = false
			video.play()
			video.controls = false

			span.classList.remove("waiting-for-permission");

		}).catch(function(error) {
			console.log(error)
		});
	}
	stop.onclick = () => {
		clear_camera()
	}
	popout.onclick = () => {
		span.classList.toggle("popped-out")
	}

	shutter.onclick = () => {
		const cl = video.classList
		cl.remove("takepicture")
		void video.offsetHeight
		cl.add("takepicture")
		video.play()
		video.controls = false
		console.log(video)
		send_source(video, video.videoWidth, video.videoHeight)
	}
	
	
	document.addEventListener("visibilitychange", () => {
		if (document.visibilityState != "visible") {
			clear_camera()
		}
	})


	// Set a default image

	const img = html`<img crossOrigin="anonymous">`

	img.onload = () => {
	console.log("helloo")
		send_source(img, img.width, img.height)
	}
	img.src = "$(default_url)"
	console.log(img)
</script>
</span>
""" |> HTML
end

# ╔═╡ d1771b22-4f97-11eb-2d33-c57509f08d96

function process_raw_camera_data(raw_camera_data)
	# the raw image data is a long byte array, we need to transform it into something
	# more "Julian" - something with more _structure_.
	
	# The encoding of the raw byte stream is:
	# every 4 bytes is a single pixel
	# every pixel has 4 values: Red, Green, Blue, Alpha
	# (we ignore alpha for this notebook)
	
	# So to get the red values for each pixel, we take every 4th value, starting at 
	# the 1st:
	reds_flat = UInt8.(raw_camera_data["data"][1:4:end])
	greens_flat = UInt8.(raw_camera_data["data"][2:4:end])
	blues_flat = UInt8.(raw_camera_data["data"][3:4:end])
	
	# but these are still 1-dimensional arrays, nicknamed 'flat' arrays
	# We will 'reshape' this into 2D arrays:
	
	width = raw_camera_data["width"]
	height = raw_camera_data["height"]
	
	# shuffle and flip to get it in the right shape
	reds = reshape(reds_flat, (width, height))' / 255.0
	greens = reshape(greens_flat, (width, height))' / 255.0
	blues = reshape(blues_flat, (width, height))' / 255.0
	
	# we have our 2D array for each color
	# Let's create a single 2D array, where each value contains the R, G and B value of 
	# that pixel
	
	RGB.(reds, greens, blues)
end

# ╔═╡ 5a03cae6-4f96-11eb-3231-6f5a18cb7976
faltando = missing

# ╔═╡ 27509be2-4f96-11eb-09e2-43f7c9d7c9a4
vetor_aleatorio = faltando # Coloque seu código aqui!

# ╔═╡ 3f727a06-4f96-11eb-148a-cfb752c4a6b4
colorir_linha(vetor_aleatorio)

# ╔═╡ 36a80508-4f96-11eb-2814-85b4eafd383a
if !@isdefined(vetor_aleatorio)
	not_defined(:vetor_aleatorio)
elseif ismissing(vetor_aleatorio)
	still_missing()
elseif !(vetor_aleatorio isa Vector)
	keep_working(md"`vetor_aleatorio` deveria ser um `Vetor`.")
elseif length(vetor_aleatorio) != 10
	keep_working(md"`vetor_aleatorio` não possue o tamanho correto.")
else
	correct()
end

# ╔═╡ 35ff9ba6-4fa6-11eb-252b-11ec3aaac465
if ismissing(vetor_aleatorio)
	md"""
	!!! info
	    O erro abaixo ocorreu porque `vetor_aleatorio` ainda não foi definido. Você fez o primeiro exercício?
	"""
end

# ╔═╡ b74c69b4-4fa6-11eb-30e5-87f19c1db5d9
copia_vetor_aleatorio = copy(vetor_aleatorio)

# ╔═╡ 0a0c64a0-4f99-11eb-0195-81622c38c7f7
function media(x)
	
	return faltando
end

# ╔═╡ 3e9a69ba-4f99-11eb-1cb2-29c6f6c5f502
media([1,2,3])

# ╔═╡ 44585614-4f99-11eb-318d-c36a2944bcfe
if !@isdefined(media)
	not_defined(:media)
else
	let
		result = media([1,2,3])
		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você esqueceu de escrever `return`?")
		elseif result != 2
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ 07ede1f2-4fa4-11eb-2e1f-bb3d215efb72
m = faltando

# ╔═╡ 0b265232-4fa4-11eb-3320-4b0ad1a2ca0d
if !@isdefined(m)
	not_defined(:m)
elseif ismissing(m)
	still_missing()
elseif !(m isa Number)
	keep_working(md"`m` devia ser um número.")
elseif m != media(vetor_aleatorio)
	keep_working()
else
	correct()
end

# ╔═╡ b0837b00-4fa5-11eb-3434-ad9123573804
function tira_media(x)
	
	return faltando
end

# ╔═╡ 9ef91ed4-4fa6-11eb-0e7e-3b5319a43afe
media(tira_media(copia_vetor_aleatorio))

# ╔═╡ fcd5dd66-4fa7-11eb-26fa-4bc9616d82ee
function cria_barra()
	
	return faltando
end

# ╔═╡ 13aabf52-4fa8-11eb-1664-290900c05535
colorir_linha(cria_barra())

# ╔═╡ 1df19242-4fa8-11eb-3368-91981d6d9649
if !@isdefined(cria_barra)
	not_defined(:cria_barra)
else
	let
		result = cria_barra()
		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você esqueceu de escrever`return`?")
		elseif !(result isa Vector) || length(result) != 100
			keep_working(md"O resultado devia ser um `Vector` com 100 elementos.")
		elseif result[[1,50,100]] != [0,1,0]
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ 8c880f10-4fa8-11eb-19b9-5b11ceae864f
function vetvet_para_matriz(vetvet)
	
	return faltando
end

# ╔═╡ 188d55d2-4faa-11eb-2443-0d5887b8cd67
vetvet_para_matriz([[1,2], [3,4]])

# ╔═╡ 25819c4e-4faa-11eb-1057-efc5372d49d6
if !@isdefined(vetvet_para_matriz)
	not_defined(:vetvet_para_matriz)
else
	let
		input = [[6,7],[8,9]]

		result = vetvet_para_matriz(input)
		shouldbe = [6 7; 8 9]

		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você se esqueceu de escrever `return`?")
		elseif !(result isa Matrix)
			keep_working(md"O resultado deveria ser uma `Matriz`")
		elseif result != shouldbe && result != shouldbe'
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ 8d6fc056-4faa-11eb-33ee-239bd78af8d5
function matriz_para_vetvet(matriz)
	
	return faltando
end

# ╔═╡ 97e78dfc-4faa-11eb-07ce-c5d1821397fa
matriz_para_vetvet([6 7; 8 9])

# ╔═╡ a8d7f8b8-4faa-11eb-0971-032ae837aeea
if !@isdefined(matriz_para_vetvet)
	not_defined(:matriz_para_vetvet)
else
	let
		input = [6 7 8; 8 9 10]
		result = matriz_para_vetvet(input)
		shouldbe = [[6,7,8],[8,9,10]]
		shouldbe2 = [[6,8], [7,9], [8,10]]

		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você se esqueceu de escrever `return`?")
		elseif result != shouldbe && result != shouldbe2
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ d0dfb7de-4fae-11eb-0c16-5bdc5a1bb527
function media_cores(imagem)
	
	return faltando
end

# ╔═╡ 04ce11ee-4faf-11eb-016c-4794e11cf55a
media_cores(torre)

# ╔═╡ 0d08861e-4faf-11eb-35b5-d5ad5b7a7f23
if !@isdefined(media_cores)
	not_defined(:media_cores)
else
	let
		input = reshape([RGB(1.0, 1.0, 1.0), RGB(1.0, 1.0, 0.0)], (2,1))
		
		result = media_cores(input)
		shouldbe = (1.0, 1.0, 0.5)
		shouldbe2 = RGB(shouldbe...)

		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Vocẽ se esqueceu de escrever `return`?")
		elseif !(result == shouldbe) && !(result == shouldbe2)
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ 19cfd202-4fb0-11eb-2b40-19abff9a1aff
begin
	function quantifica(x::Number)
		
		return faltando
	end
	
	function quantifica(color::AbstractRGB)
		# você vai escrever essa função em um exercício futuro
		return faltando
	end
	
	function quantifica(image::AbstractMatrix)
		# você vai escrever essa função em um exercício futuro
		return faltando
	end
end

# ╔═╡ ce503cb2-4fb0-11eb-20ac-19f2ed9b4da5
quantifica(0.267), quantifica(0.91)

# ╔═╡ d9fca866-4fb0-11eb-1251-d784f590d6ba
if !@isdefined(quantifica)
	not_defined(:quantifica)
else
	let
		result = quantifica(.3)

		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você se esqueceu de escrever `return`?")
		elseif result != .3
			if quantize(0.35) == .3
				almost(md"O que quantificar(`0.2`) deve ser?")
			else
				keep_working()
			end
		else
			correct()
		end
	end
end

# ╔═╡ fb222f3c-4fb2-11eb-34b8-cda1789d3776
quantifica(torre)

# ╔═╡ 936be0e8-4fb4-11eb-1c09-d5679c20cebd
torre_invertida = faltando

# ╔═╡ 84f4fc46-4fb6-11eb-2ae5-7d96c966df07
begin
	function limite(x::Number)
		
		return faltando
	end
	
	function aplica_ruido(x::Number, s)
		
		return faltando
	end
	
	function aplica_ruido(color::AbstractRGB, s)
		# você vai escrever essa função em um exercício futuro
		return faltando
	end
	
	function aplica_ruido(image::AbstractMatrix, s)
		# você vai escrever essa função em um exercício futuro
		return faltando
	end
end

# ╔═╡ d5681418-4fb8-11eb-339f-b5c33c21200c
aplica_ruido(vermelho, ruido_cor)

# ╔═╡ 0807809a-4fbc-11eb-3e85-5f50aae01b79
aplica_ruido(torre, ruido_torre)

# ╔═╡ 10a8a1fa-4fcd-11eb-1e7c-1f2bd632ab5f
function estender(v, i)
	
	return faltando
end

# ╔═╡ 3e53350c-4fcd-11eb-0e81-d729af36db67
estender(v, 1)

# ╔═╡ 3ee7755a-4fcd-11eb-3dc5-4b540d0c07ce
estender(v, -8)

# ╔═╡ 3f65b6f4-4fcd-11eb-010f-15c33f7735f4
estender(v, n + 10)

# ╔═╡ 930dead8-4fcd-11eb-03b0-c3e1fac81d70
if estender(v,1) === missing
	missing
else
	colorir_linha([estender(vetor_exemplo, i) for i in -1:12])
end

# ╔═╡ a190f514-4fcd-11eb-28a7-ff1aecf543b8
if !@isdefined(estender)
	not_defined(:estender)
else
	let
		result = estender([6,7],-10)

		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você se esqueceu de escrever o `return`?")
		elseif result != 6 || estender([6,7],10) != 7
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ 7025b1ba-4fd0-11eb-364a-4d116aeb79ee
function convoluciona_vetor(v, k)
	
	return faltando
end

# ╔═╡ a3fb4f10-4fd0-11eb-1184-b9bf732c1b46
testar_convolucao = let
	v = [1, 10, 100, 1000, 10000]
	k = [0, 1, 0]
	convoluciona_vetor(v,k)
end

# ╔═╡ 9a0cdc80-4fd0-11eb-2f3b-8bbfb7f91444
colorir_linha(testar_convolucao)

# ╔═╡ ebc9858a-4fd0-11eb-02c5-fd63eac1a341
if !@isdefined(convoluciona_vetor)
	not_defined(:convoluciona_vetor)
else
	let
		x = [1, 10, 100]
		result = convoluciona_vetor(x, [0, 1, 1])
		shouldbe = [11, 110, 200]
		shouldbe2 = [2, 11, 110]

		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você se esqueceu de escrever `return`?")
		elseif !(result isa AbstractVector)
			keep_working(md"O objeto retornado não é um `Vector`.")
		elseif size(result) != size(x)
			keep_working(md"O vetor retornado não possue as dimensões corretas.")
		elseif result != shouldbe && result != shouldbe2
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ 7fb0544e-4fd2-11eb-20d4-d9dc885d8c50
function nucleo_gaussiano(n)
	
	return faltando
end

# ╔═╡ f4fe8342-4fd2-11eb-0eec-73bcccbb949a
teste_gaussiano_1D_a = let
	v = vetor_aleatorio
	k = nucleo_gaussiano(nucleo_gaussiano_1D)
	
	if k !== missing
		convoluciona_vetor(v,k)
	end
end

# ╔═╡ 7b8bdb22-4fd2-11eb-23d1-5d0b3066664d
colorir_linha(teste_gaussiano_1D_a)

# ╔═╡ 1dbfff22-4fd3-11eb-2bcf-31d8c1ece25d
teste_gaussiano_1D_b = let
	v = cria_barra()
	k = nucleo_gaussiano(nucleo_gaussiano_1D)
	
	if k !== missing
		convoluciona_vetor(v,k)
	end
end

# ╔═╡ 305c6076-4fd3-11eb-2c3e-23b3c897620e
colorir_linha(teste_gaussiano_1D_b)

# ╔═╡ 59c44134-5075-11eb-36c7-d14a4f5cef2a
function estender_mat(M::AbstractMatrix, i, j)
	
	return faltando
end

# ╔═╡ 7b3a3664-5077-11eb-0427-b760ac8cdef8
[estender_mat(imagenzinha, i, j) for (i,j) in Iterators.product(-1:7,-1:7)]

# ╔═╡ a28288ca-5077-11eb-1224-09a7a6752be0
if !@isdefined(estender_mat)
	not_defined(:estender_mat)
else
	let
		input = [42 37; 1 0]
		result = estender_mat(input, -2, -2)

		if ismissing(result)
			still_missing()
		elseif isnothing(result)
			keep_working(md"Você se esqueceu de escrever `return`?")
		elseif result != 42 || extend_mat(input, -1, 3) != 37
			keep_working()
		else
			correct()
		end
	end
end

# ╔═╡ bc867df8-5077-11eb-08eb-f36e60d911a2
let
	torre_corte = torre[250:430,110:230]
	[estender_mat(torre_corte, i, j) for (i,j) in Iterators.product(-50:size(torre_corte,1)+51, (-50:size(torre_corte,2)+51))]
end

# ╔═╡ daa9821e-507a-11eb-1139-7184ae80040f
function com_desfoque_gaussiano(imagem)
	
	return faltando
end

# ╔═╡ ef604d96-507a-11eb-0471-37d8f9edd132
com_desfoque_gaussiano(torre)

# ╔═╡ 42cda0e0-507c-11eb-28db-ade8da2ea506
function com_detecção_sobel(imagem)
	
	return faltando
end

# ╔═╡ 7ae48aca-507c-11eb-3fd8-e97dba8758f6
com_detecção_sobel(torre)

# ╔═╡ Cell order:
# ╟─dcc741e8-4f93-11eb-20f6-91d4b4b0488d
# ╟─f112dce0-4f93-11eb-0ef6-0d409ff699fc
# ╟─c55a4f6a-4f94-11eb-2ccd-f1d49cae59db
# ╠═d53c4a78-4f94-11eb-2baf-e587cdab4ed7
# ╟─0f47b4c8-4f95-11eb-07ef-e9f623230936
# ╟─193cf6be-4f95-11eb-26e5-47328c1ab8c1
# ╠═895efdd4-4f95-11eb-242b-a9c7610b3c47
# ╟─edf8bf8c-4f95-11eb-2e6b-df37349ef6f2
# ╠═27509be2-4f96-11eb-09e2-43f7c9d7c9a4
# ╠═3f727a06-4f96-11eb-148a-cfb752c4a6b4
# ╟─36a80508-4f96-11eb-2814-85b4eafd383a
# ╟─52f70cf2-4f98-11eb-2bb0-ebc25971596d
# ╟─ecf45558-4f98-11eb-3341-31a6f74aca09
# ╠═0a0c64a0-4f99-11eb-0195-81622c38c7f7
# ╠═3e9a69ba-4f99-11eb-1cb2-29c6f6c5f502
# ╟─44585614-4f99-11eb-318d-c36a2944bcfe
# ╟─ebb72ed8-4fa3-11eb-3ee5-995d752c7da3
# ╠═07ede1f2-4fa4-11eb-2e1f-bb3d215efb72
# ╟─0b265232-4fa4-11eb-3320-4b0ad1a2ca0d
# ╟─afcc53bc-4fa5-11eb-1fff-6d2c56fdfc3a
# ╠═b0837b00-4fa5-11eb-3434-ad9123573804
# ╟─e2f66cd2-4fa5-11eb-228a-0b44226e6d12
# ╟─35ff9ba6-4fa6-11eb-252b-11ec3aaac465
# ╠═9ef91ed4-4fa6-11eb-0e7e-3b5319a43afe
# ╠═b74c69b4-4fa6-11eb-30e5-87f19c1db5d9
# ╟─c89f83cc-4fa6-11eb-227e-5ba3bd8b4759
# ╠═fcd5dd66-4fa7-11eb-26fa-4bc9616d82ee
# ╟─13aabf52-4fa8-11eb-1664-290900c05535
# ╟─1df19242-4fa8-11eb-3368-91981d6d9649
# ╟─76e43116-4fa8-11eb-0234-830556110fdc
# ╠═8c880f10-4fa8-11eb-19b9-5b11ceae864f
# ╠═188d55d2-4faa-11eb-2443-0d5887b8cd67
# ╟─25819c4e-4faa-11eb-1057-efc5372d49d6
# ╟─6af78af4-4faa-11eb-0b8b-c38ab0d64270
# ╠═8d6fc056-4faa-11eb-33ee-239bd78af8d5
# ╠═97e78dfc-4faa-11eb-07ce-c5d1821397fa
# ╟─a8d7f8b8-4faa-11eb-0971-032ae837aeea
# ╟─7beb740c-4f95-11eb-3ffb-f3ff441ec1cb
# ╟─f53fa76e-4faa-11eb-3e4f-1f1d200ab072
# ╠═f780fe1e-4fba-11eb-0023-850bad65e808
# ╟─35e88438-4fac-11eb-3794-2d82a1ef0ca2
# ╠═bd01653e-4fac-11eb-31c5-a16560d178ef
# ╟─cb69d71e-4fac-11eb-37c2-bf1200e5e7c0
# ╟─339ab4ec-4fae-11eb-2f3e-c9b49104b72e
# ╠═d0dfb7de-4fae-11eb-0c16-5bdc5a1bb527
# ╟─8ecb4f3e-4fae-11eb-166c-e1a69d381664
# ╠═04ce11ee-4faf-11eb-016c-4794e11cf55a
# ╟─0d08861e-4faf-11eb-35b5-d5ad5b7a7f23
# ╟─74ea8278-4faf-11eb-182d-1334102584eb
# ╠═19cfd202-4fb0-11eb-2b40-19abff9a1aff
# ╠═ce503cb2-4fb0-11eb-20ac-19f2ed9b4da5
# ╟─d9fca866-4fb0-11eb-1251-d784f590d6ba
# ╟─656d28f4-4fb5-11eb-20c4-d95fa69638a3
# ╟─6d123fbc-4fb1-11eb-1500-411879a49d1b
# ╟─9ab9f38c-4fb2-11eb-34cc-a92c30f6decb
# ╠═fb222f3c-4fb2-11eb-34b8-cda1789d3776
# ╟─133dfa56-4fb3-11eb-1f45-2fe4de2fb77f
# ╠═63970676-4fb3-11eb-0a6b-278d5f0c9a76
# ╟─76bea544-4fb3-11eb-2f1d-670554b9c899
# ╟─6104037a-4fb3-11eb-0cd9-79ad0d4a128c
# ╠═8aa64a8c-4fb3-11eb-0724-df50b81be6fd
# ╠═97ed2cd6-4fb3-11eb-2856-6b62bdb73a15
# ╠═a5fcf9b4-4fb3-11eb-017f-5fbb8fc4b675
# ╟─88302360-4fb4-11eb-2b5a-156bd18db321
# ╠═936be0e8-4fb4-11eb-1c09-d5679c20cebd
# ╟─9adaa9f4-4fb4-11eb-0161-7d8f3656128d
# ╠═84f4fc46-4fb6-11eb-2ae5-7d96c966df07
# ╟─529b0316-4fb7-11eb-247b-b790e2301080
# ╟─aa26f9b4-4fb7-11eb-0f53-515679a89553
# ╟─b8e79b62-4fbb-11eb-2aa0-cf47a72d505a
# ╠═d5681418-4fb8-11eb-339f-b5c33c21200c
# ╟─4f2c855e-4fb9-11eb-1486-b5df04d6569b
# ╟─f22e5926-4fbb-11eb-0fe5-c146f5980b99
# ╠═0807809a-4fbc-11eb-3e85-5f50aae01b79
# ╟─b90b98a4-4fbc-11eb-16d3-5794322db207
# ╟─4aaddb6a-4fcb-11eb-3046-b9be8cd540a7
# ╠═757c8f30-4fcb-11eb-381a-27b6d1cc51b7
# ╠═79f8beee-4fcb-11eb-078b-3f8d8c4b934d
# ╟─7eb04bfc-4fcb-11eb-1683-adec6202a732
# ╠═e9a04f1e-4fcb-11eb-3fc1-fd031d738882
# ╟─f4967272-4fcb-11eb-34de-7b7098298940
# ╠═10a8a1fa-4fcd-11eb-1e7c-1f2bd632ab5f
# ╟─3452acc2-4fcd-11eb-0a33-892a9586d423
# ╠═3e53350c-4fcd-11eb-0e81-d729af36db67
# ╠═3ee7755a-4fcd-11eb-3dc5-4b540d0c07ce
# ╠═3f65b6f4-4fcd-11eb-010f-15c33f7735f4
# ╟─6da66464-4fcd-11eb-2aa2-812e82a085eb
# ╟─6ea95d62-4fcd-11eb-2bf6-93342a1f52fa
# ╟─83246da6-4fcd-11eb-3195-bb30fbaa5d70
# ╟─930dead8-4fcd-11eb-03b0-c3e1fac81d70
# ╟─a190f514-4fcd-11eb-28a7-ff1aecf543b8
# ╟─f71384f2-4fcd-11eb-396b-af2fad0df31c
# ╠═74c9f250-4fce-11eb-0a0e-df15d1ca47e4
# ╟─a0a3e014-4fce-11eb-372b-8bad064204f8
# ╠═0e8f7b08-4fcf-11eb-3eef-3dfead0e514c
# ╟─4f124962-4fcf-11eb-17be-7be93f21bb20
# ╠═7025b1ba-4fd0-11eb-364a-4d116aeb79ee
# ╟─7e7d56e6-4fd0-11eb-0a6f-f3c216f476dc
# ╟─9a0cdc80-4fd0-11eb-2f3b-8bbfb7f91444
# ╠═a3fb4f10-4fd0-11eb-1184-b9bf732c1b46
# ╟─ebc9858a-4fd0-11eb-02c5-fd63eac1a341
# ╟─ed8deb8a-4fd1-11eb-3acf-8f950864c3b9
# ╠═7fb0544e-4fd2-11eb-20d4-d9dc885d8c50
# ╟─bfac0188-4fd2-11eb-3e10-c75841d61a06
# ╠═c81fdb46-4fd2-11eb-3a08-bfa84f03c869
# ╟─7b8bdb22-4fd2-11eb-23d1-5d0b3066664d
# ╠═f4fe8342-4fd2-11eb-0eec-73bcccbb949a
# ╟─305c6076-4fd3-11eb-2c3e-23b3c897620e
# ╠═1dbfff22-4fd3-11eb-2bcf-31d8c1ece25d
# ╟─2f89a9e0-4fd3-11eb-3141-3de7e093eb70
# ╟─3dc0a4f2-5073-11eb-1106-c7b15f288804
# ╠═59c44134-5075-11eb-36c7-d14a4f5cef2a
# ╟─6f1c167e-5075-11eb-2c28-6b0d6219cdb6
# ╟─8915c188-5075-11eb-1b62-835db5aa22ce
# ╟─199d063e-5077-11eb-36a7-b172d63a349a
# ╟─51899526-5077-11eb-0f2f-a3e2bef024a1
# ╟─7b3a3664-5077-11eb-0427-b760ac8cdef8
# ╟─a28288ca-5077-11eb-1224-09a7a6752be0
# ╟─bc867df8-5077-11eb-08eb-f36e60d911a2
# ╟─a93281b0-5078-11eb-09bf-cb6d1d110d5d
# ╠═ceba5818-5078-11eb-143c-8353703ccb0d
# ╟─febd7628-5078-11eb-3e27-e1043bd52e46
# ╟─0825ad6e-5079-11eb-3d7b-2bbf413a31bf
# ╟─41936686-5079-11eb-25ae-996ac5f09a4b
# ╠═6a87483c-5079-11eb-298d-618ce1f1b2ed
# ╠═858ad874-5079-11eb-077f-efdfd2b77bc0
# ╟─928ac4f8-5079-11eb-0966-41bc77d675c2
# ╟─40d1ecee-507a-11eb-1fb3-734cb9daea29
# ╠═daa9821e-507a-11eb-1139-7184ae80040f
# ╠═ef604d96-507a-11eb-0471-37d8f9edd132
# ╟─00a00312-507b-11eb-3e80-fd91a6ca11ab
# ╠═42cda0e0-507c-11eb-28db-ade8da2ea506
# ╠═7ae48aca-507c-11eb-3fd8-e97dba8758f6
# ╟─c9108e88-4f96-11eb-0b58-6bddf7c63a4b
# ╟─d2c60912-4f96-11eb-092c-69e96e2ad762
# ╟─ea5dd62c-4f96-11eb-3324-658b6f548c72
# ╟─0fd7c458-4f97-11eb-3efc-d37f2ea5c7f0
# ╟─0fd00d76-4f97-11eb-28a8-832057df550b
# ╟─6fa8eb1e-4f97-11eb-2713-13cd16ab4ac3
# ╟─a23c85d6-4f97-11eb-1665-69b2c4a548f0
# ╟─a22fe1b4-4f97-11eb-029f-4902d24f7297
# ╟─d1771b22-4f97-11eb-2d33-c57509f08d96
# ╟─5a03cae6-4f96-11eb-3231-6f5a18cb7976
