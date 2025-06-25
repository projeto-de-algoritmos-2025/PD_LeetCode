object Solution {
  def maxProfit(k: Int, prices: Array[Int]): Int = {
    val n = prices.length
    if (n < 2 || k <= 0) return 0

    // Se k >= n/2, podemos fazer todas as subidas (caso ilimitado)
    if (k >= n / 2) {
      var profit = 0
      for (i <- 1 until n if prices(i) > prices(i - 1)) {
        profit += prices(i) - prices(i - 1)
      }
      return profit
    }

    // dp(t)(d) = max lucro usando até t transações nos primeiros d+1 dias (d índice zero-based)
    // vamos usar apenas duas linhas para economizar memória
    val dp = Array.ofDim[Int](k + 1, n)

    for (t <- 1 to k) {
      // bestDiff guarda o máximo de (dp[t-1][j] - prices[j]) para todos j < d
      var bestDiff = dp(t - 1)(0) - prices(0)

      for (d <- 1 until n) {
        // 1) não usar transação que termina em d: dp(t)(d-1)
        // 2) usar: prices(d) + bestDiff  (que já incorpora dp(t-1,j) - prices(j))
        dp(t)(d) = math.max(dp(t)(d - 1), prices(d) + bestDiff)

        // atualiza bestDiff para o próximo dia
        bestDiff = math.max(bestDiff, dp(t - 1)(d) - prices(d))
      }
    }

    dp(k)(n - 1)
  }
}
