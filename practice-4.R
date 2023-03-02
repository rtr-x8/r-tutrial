# 作業ディレクトリ

## 作業ディレクトリとは、Rが実行されている場所のこと。
## 基本的にはファイル等をここに準備し、指定しない限りここに保存される
getwd() # 確認
setwd("~/r_practice")
getwd()

# 書き出し
(mydata <- subset(airquality, Ozone > 90, select = -Temp))
dim(mydata)
write.csv(mydata, file = "mydata.csv")

# 読み込み
(newdata <- read.csv(file = "mydata.csv", header = T, row.names = 1))
dim(newdata)

(kikou <- read.csv(file = "kikou2016.csv", fileEncoding = "sjis"))
(str(kikou))
subset(kikou, 月 == 2 & 日 == 29) # 閏日の確認
dim(kikou)
colnames(kikou)

# Rデータの読み書き
# Rのオブジェクトなら何でも保存できる。

(mydata1 <- subset(airquality, Temp>95, select=-Ozone))
(mydata2 <- subset(airquality, Temp<60, select=-Ozone))
dim(mydata1)
dim(mydata2)
save(mydata1, mydata2, file="mydata.rdata") # 書き出し

load("mydata.rdata")
mydata1 # 保存時と同じ変数名で展開される
mydata2

# データの整理
(sum(1:100))
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
kion <- kikou$気温
mean(kion)
max(kion)
min(kion)
which.max(kion) # いつが最大か
kikou[222,]

# 全部の行・列ごとに行いたい時

x <- matrix(1:100, 4,25)
sum(x) # 全成分を合計する
rowSums(x) # 行ごと
apply(x, 1, "sum") # 行ごと

kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
x <- subset(kikou, select = -c(月, 日))
colMeans(x)
apply(x,2,"max") # 列ごとの合計
sapply(x,"max") # 上と同義
apply(x, 2, "min") # 列ごとの合計

# 自作関数でapply
apply(x, 1, function(x) sum(x > mean(x)))

# いくつかのグループ（月毎など）に分けて、統計量を算出する
aggregate(kikou[, -(1:2)], # 月日を除く
          by=list(月 = kikou$月), # 月で集約
          FUN = "mean") # 平均
aggregate( . ~ 月, data = subset(kikou, select = -日), FUN = "mean") # 同義。フォーミュラ形式

aggregate(kikou[, -(1:2)], # 月日を除く
          by=list(月 = kikou$月, 降水のうむ = (kikou$降水量 > 0)), # 月と降水量で集約
          FUN = "mean") # 平均

# 演習
# 月日以外の変数ごとに、最大最小を求めよ
# 月毎の平均最大値を求めよ
x <- subset(airquality, select = -c(Month, Day))
colMeans(x)
colSums(x)
?colMeans
colMeans(x, na.rm=T)
colSums(x, na.rm = T)
apply(x, 2, "max")
apply(x, 2, "max", na.rm = T) # applyの後ろには引用する関数の引数を指定できる
apply(x, 2, "min", na.rm = T) # applyの後ろには引用する関数の引数を指定できる
m <- subset(airquality, select = Month)
(x)
aggregate(x, by = m, "mean", na.rm = T) # ??? by = mについて確認
aggregate(x, by = m, "max", na.rm = T)
aggregate(x, by = m, "min", na.rm = T)

# プロット

plot(1:10)
plot((1:10)^4)
x <- seq(0, 4*pi, by=0.1)
y <- sin(x) + rep_len(c(-0.2, 0.1), length(x))
plot(sin, 0, 4*pi,
     col="blue",
     lwd=2,
     ylab = "sin/cos")
curve(cos,
      add = T,
      col = "red",
      lwd=2)
points(x,y,col="green", pch="*")
plot(x,y,type="p",pch="x", ylim=c(-2,2))
curve(sin, add=T, col="orange", lwd=2)
lines(x,y,col="blue")

# 散布図
plot(Ozone ~ Wind, data = airquality, pch="*", col="red", cex=2)

# 課題
dim(sleep)
str(sleep)
sleep1 = subset(sleep, group == 1, extra, drop=T)
sleep2 = subset(sleep, group == 2, extra, drop=T)
str(sleep2)
?plot
plot(sleep1, sleep2,
     col="blue", pch="x", 
     main="Sleep Data",
     xlab="group 1",
     ylab="group 2")
(sleep1)
(sleep2)

# 判例をつけたい
f <- function(x) exp(-x) * cos(x)
plot(f, 0, 2 * pi, col = "red", lwd=2, ylab = "")
g <- function(x) exp(-x) * sin(x)
curve(g, lty=2, add = T, col="blue", lwd=2)
legend(4, #x座標
       1, #y座標
       legend = c(expression(e^{-x}*cos(x)), expression(e^{-x}*sin(x))),
       lty=c(1,2), lwd = 2, col=c("red", "blue"),
       bty="n", # 凡例の枠線
       y.intersp = 1.5 #凡例の間
       )

