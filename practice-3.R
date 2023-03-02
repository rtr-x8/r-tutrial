# 逆行列の計算

# Aにかけたら単位行列になる

(A <- matrix(c(2,3,4,7,11,13,17,19,23), nrow=3, ncol=3))
(B <- solve(A))
A %*% B # なっていないように見えるが、数値誤差の影響で歯数が出ているだけ。


# ベクトルと行列の計算：積
# 
(A<-matrix(1:16,ncol=4, nrow=4))
(b <- c(2,3,5,7))
(A %*% b) # 列ベクトルとして計算（a x 3になる）
(b %*% A) # 行ベクトルとして計算（3 x 1になる）

# 行列・逆行列を分析において利用することはあまりない

# 関数
# 関数functionを利用することで自作関数を定義できる。

myfunc <- function(r) {
  return (r * 2)
}
(myfunc(4))

# 制御文

x <- 5
if(x>0){
  print("0より大きい")
}else {
  print("0以下")
}

# 短縮
ifelse(x < 0, "true", "not true")

# 繰り返し
y <- 0
for(i in 1:10) {
  y <- y+i
}
print(y)

z <- 1
n <- 0
while(z < 100){
  z <- 2* z
  n <- n + 1
}
print(z)
print(n)

# 演習3.1
ruijou <- function(n) {
  r <- 1
  for(i in 1:n) {
    r <- r * i
  }
  return(r)
}
# factorial 関数もある

# 行列Xが与えられた時の列の平均
avrg <- function(X) {
  rowCount <- ncol(X)
  result <- double(rowCount)
  for (i in 1:rowCount) {
    result[i] <- mean(X[,i])
  }
  return(result)
}
avrg(matrix(1:9,nrow = 3, ncol=3, byrow = T)) # 4,5,6


######
x <- c(4,1,2,9,8,3,6)
x[c(5,2)] # 5,2個目の値を取り出す
x[-c(2,3,7)] # 2,3,7個目いがいの値を取り出す
(idx <- x > 3) # 3より大きい論理式
x[idx]
x[c(2,5)] <- c(0,1) # 置換
(x)
names(x) <- letters[1:length(x)] # 名前つけ
(x)
x[c("b", "e")] # 名前で抽出


# データフレーム

# airqualityを用いる。NYの大気の状態でーた
?airquality
dim(airquality) # サイズを確認
names(airquality) # 列名
head(airquality) # 先頭6行
str(airquality) # オブジェクトの構造を確認（データ型）
airquality[which(airquality$Ozone>100), ] # 条件抽出。whichは欠損値を無視する。
airquality[which(airquality$Ozone>100), c("Month", "Day")] # 条件抽出 & 欲しい列

# データ抽出のメソッドを用いる
subset(airquality, Ozone > 100) # 上と同じ意味
subset(airquality, Ozone > 100, select = Wind:Day) # 列の指定
subset(airquality, !is.na(Ozone) & Day %in% c(1,2)) # OzoneがNAでない、かつ、Dayが1or2
subset(airquality, Ozone > 100 | Temp > 95) # オゾンが100以上、または気温が95以上
subset(airquality, Day==1, select = -Temp) # Dayが1で、Temp列以外

# 課題

subset(airquality, Month == 7,  Ozone)
subset(airquality, !is.na(Solar.R), c(Month, Day))
subset(airquality, Wind >= 10 & Temp >= 80)


