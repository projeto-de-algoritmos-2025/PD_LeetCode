class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n < 2 { return 0 }
        let k = 2
        
        // Caso ilimitado: podemos somar todos os incrementos positivos
        if k >= n / 2 {
            var profit = 0
            for i in 1..<n {
                if prices[i] > prices[i - 1] {
                    profit += prices[i] - prices[i - 1]
                }
            }
            return profit
        }
        
        // dp[t][d] = lucro máximo usando até t transações nos primeiros d+1 dias
        var dp = Array(repeating: Array(repeating: 0, count: n), count: k + 1)
        
        for t in 1...k {
            // bestDiff = max_{j<d} (dp[t-1][j] - prices[j])
            var bestDiff = dp[t - 1][0] - prices[0]
            
            for d in 1..<n {
                // Optar por não usar transação que termine em d, ou usar a melhor que termine em d
                dp[t][d] = max(dp[t][d - 1], prices[d] + bestDiff)
                // Atualiza bestDiff para o próximo dia
                bestDiff = max(bestDiff, dp[t - 1][d] - prices[d])
            }
        }
        
        return dp[k][n - 1]
    }
}
