x <- subset(sleep, group == 1, extra, drop = T)
y <- subset(sleep, group == 2, extra, drop = T)
(out <- lm(y ~ x)) # 線形回帰分析の実行
coef(out) # 推定されたパラメタ値

# 宰相に浄水定量の計算公式
(beta.hat <- cov(x, y)/var(x,y))
(alpha.hat <- mean(y) - beta.hat * mean(x))

# プロット
plot(x,y,xlab='g1', ylab='g2', pch=4)
abline(reg=out,col='red')

# 重回帰分析
# モデル：y = -1 + 2x
set.seed(123)
x <- c(7,2,6,4,3,10,9,1,8,5) # 説明変数
epsilon <- rnorm(length(x)) # 誤差項
y <- -1 + 2 * x + epsilon # 目的変数の観測データ
(out <- lm(y~x)) # 回帰係数の推定
(b <- coef(out)) # 推定された回帰係数の出力

# 最小二乗推定量の計算公式との確認
X <- cbind(rep(1, length(x)), x) # デザイン行列
G <- crossprod(X) # グラム行列 
solve(G) %*% crossprod(X, y)

# あてはめ価と残差が直行する
(yhat <- fitted(out))
(epshat <- resid(out))


model = Ozone ~ Wind + Temp # オゾンを風と温度で表すモデルを定義する。formulaクラスが返る
(est <- lm(model, data = airquality))
