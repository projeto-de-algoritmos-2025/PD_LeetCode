# LeetCode

**Número da Lista**: 5<br>
**Conteúdo da Disciplina**: Programação Dinâmica <br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 22/2006178 | Thales Henrique Euflauzino dos Santos  |
| 22/2021924 | Víctor Hugo Lima Schmidt               |

## Sobre 
Para explorar o conteúdo do tópico de Programação Dinâmica, a dupla escolheu quatro exercícios de nível DIFÍCIL na plataforma online [LeetCode](https://leetcode.com/).

## Screenshots

[123. Best Time to Buy and Sell Stock III - Nível Difícil](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/description/)

Para resolver o problema 123, modeleio cada possível transação “comprar em j, vender em d” como um item de peso 1 e valor `prices[d] – prices[j]` e construo a tabela `dp[t][d]`, em que `dp[t][d]` é o lucro máximo usando até `t` itens (transações) nos primeiros `d+1` dias; para cada `t = 1,2` e cada dia `d`, escolho entre não usar transação que termine em `d` (`dp[t][d-1]`) ou usar a melhor transação que termine em `d`, que calcula o valor `prices[d] + bestDiff` com `bestDiff = max_{j<d}(dp[t-1][j] - prices[j])`; ao final, `dp[2][n-1]` contém o lucro máximo possível, resultando num algoritmo O(n·k) com `k=2`, seguindo a formulação clássica de Knapsack DP.

![123](/assets/123.png)

[188. Best Time to Buy and Sell Stock IV - Nível Difícil](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/description/)

Para resolver o problema, modelei cada operação de compra–venda como um intervalo $j,d$ com peso igual ao lucro `prices[d] - prices[j]` e montei a tabela `dp[t][d]` que indica o lucro máximo usando até `t` transações nos primeiros `d+1` dias; em cada célula, decido entre não usar nenhuma transação que termine em `d` (`dp[t][d-1]`) ou usar a melhor transação que termine em `d`, calculada como `prices[d] + bestDiff` onde `bestDiff` mantém `max_{j<d}(dp[t-1][j] - prices[j])`; aplicando esse esquema iterativamente para todos os valores de `t` até `k` e para todos os dias de 0 a n−1, obtenho em `dp[k][n-1]` o resultado ótimo em O(k·n) tempo e O(n) espaço adicional, caracterizando a forma tabular do Weighted Interval Scheduling.

![188](/assets/188.png)

## Instalação 
**Linguagem**: Scala<br>





