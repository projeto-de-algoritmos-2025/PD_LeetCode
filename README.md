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

[188. Best Time to Buy and Sell Stock IV - Nível Difícil](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/description/)

Para resolver o problema, modelei cada operação de compra–venda como um intervalo $j,d$ com peso igual ao lucro `prices[d] - prices[j]` e montei a tabela `dp[t][d]` que indica o lucro máximo usando até `t` transações nos primeiros `d+1` dias; em cada célula, decido entre não usar nenhuma transação que termine em `d` (`dp[t][d-1]`) ou usar a melhor transação que termine em `d`, calculada como `prices[d] + bestDiff` onde `bestDiff` mantém `max_{j<d}(dp[t-1][j] - prices[j])`; aplicando esse esquema iterativamente para todos os valores de `t` até `k` e para todos os dias de 0 a n−1, obtenho em `dp[k][n-1]` o resultado ótimo em O(k·n) tempo e O(n) espaço adicional, caracterizando a forma tabular do Weighted Interval Scheduling.

![188](/assets/188.png)

## Instalação 
**Linguagem**: Scala<br>





