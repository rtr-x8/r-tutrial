# 日本語の描画
# par()を利用してフォントファミリーを指定する
par(family = "HiraginoSans-W3")

kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
kikou
View(kikou)
getwd()
(x <- aggregate(kikou[, -c(1,2)], by=list(月 = kikou$月), FUN="mean"))

plot(x$気温, type="b", lwd=3, col="green", ylim=c(0, max(x$気温)),
     xlab="月", main="2016年気象データ", ylab="", axes = F)
axis(1,1:12,1:12) # x軸
axis(2) # y軸
lines(x$降水量, type="h", lwd=3, col="blue")
lines(x$日射量, lwd=3,lty=2,col="red")
abline(0,0,led=2, lty="dotted")
legend(1,25,c('気温', "降水量", "日射量"),col=c("green", "blue", "red"), lwd=2,lty=c(1,1,2))

# グラフはExport-> から保存できる

# ヒストグラム
hist(kikou$気温)
hist(kikou$気温,
     xlab="",ylab="",
     breaks = 25, # ピンの数
     col="green", main="2016年気温ヒストグラム",
     labels=T)
hist(kikou$風速, freq = F, # 全体に対する割合で表示
     xlab="", ylab="密度", breaks = 25, col="lightblue",
     border="lightblue", #境界の色
     main="2016年風速非卒グラム")

# weylの一様分布
a <- pi 
n <- 10000
x <- (1:n) * a
x <- x - floor(x)
hist(x,breaks = 20, col="gray", border="gray")


f <- function(a,b=20,n=1000,col="gray") {
  x <- (1:n) * a
  x <- x - floor(x)
  hist(x,breaks = b, col=col, border=col)
}
f(sqrt(5))
f(exp(1))
f((1+sqrt(5))/2) # 黄金比
f(-digamma(1),b=100) # オイラー定数

# 箱ひげ図（以上なデータを可視化しやすい）
boxplot(kikou[,-c(1,2)]) # 月日を除く
boxplot(気温 ~ 月, data=kikou, col="orange", main="月毎の気温")
?boxplot
str(kikou)
boxplot(気温 ~ 月, data=kikou, col="purple", main="月毎の気温", horizontal = T)
boxplot(降水量 ~ 月, data=kikou, col="purple", main="月毎の降水量")
boxplot(日射量 ~ 月, data=kikou, col="purple", main="月毎の日射量")
boxplot(風速 ~ 月, data=kikou, col="springgreen", main="月毎の日射量")

# 棒グラフ
x <- aggregate(kikou[,-c(1,2)],by=list(月 = kikou$月),FUN="mean")
barplot(as.matrix(x[,-1]), #行列に変換する
        col=rainbow(12)[c(8:1,12:9)], # いろ
        beside=T, # 向き
        space=c(1.5, 3),
        legend.text = paste0(x[,1], "月"),
        args.legend = list(ncol=2))

y <- aggregate(kikou[,-c(1,2)],by=list(月 = kikou$月), FUN="mean")
y
barplot(as.matrix(y[,-1]),
        beside=T)

# 円グラフ
z <- hist(kikou$日射量, breaks = 5,plot=F)
x <- z$count
y <- z$breaks
names(x) <- paste(y[-length(y)], y[-1], sep="-")
pie(x, col=gray(seq(0,1,length=length(x))))
pie(x, clockwise = T, col=heat.colors(length(x)), main="title")

# 散布図行列

pairs(kikou[,-c(1,2)], col="blue")
pairs(~気温 + 日射量 + 風速, # 絞って表示
      data = kikou,col=rainbow(12)[kikou$月]) # 色を月毎に

# 3次元グラフ
f <- function(x,y) x^2 - y^2
x <- seq(-3,3,length=51)
y <- seq(-3,3,length=51)
z <- outer(x,y,f) # 外積を計算する
persp(x,y,z,col="lightblue")
persp(x,y,z,theta=30,phi=30,expand=0.5,col="royalblue",main=expression(z=x^2-y^2))
