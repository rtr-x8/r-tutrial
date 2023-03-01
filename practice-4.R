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
