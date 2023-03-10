# パッケージのインストール
###########################
# RStudioを利用してインストールするか、コンソールからインストールする。

# 1. Packagesタブをクリック、Installをクリックして欲しいパッケージ名を検索する
# 2. Packageのlistに追加されるので、チェックするとロードされる。

# 1. コンソールにてinstall.packages(package_name)と入力する
# 2. require(package_name)としてロードする

# データ構造（ベクトル、行列、リスト、データフレーム）
###########################

# Rオブジェクトはベクトルとして扱われることが多い

## 実数
(x <- 4)
print(x^10)
print(x^100)
print(x^1000) #上限突破

## 複素数
print(1i)

## 文字列
(y <- "foo")
(z <- "bar")
(paste(y,z, sep = "_")) # 文字列の結合
(paste0(y,z)) # 文字列の結合
# (y+z) #例外となる。文字列の加算はできない

## 真偽値
(TRUE)
(T)
(FALSE)
(F)

(1<2)
(1>2)
(1>=2)

(as.numeric(TRUE)) # 数値に変換
(as.numeric(F))

TRUE + TRUE # TRUEが1に変換されて計算される
TRUE * 3

## ベクトル
# c(1,b,c,...)で生成できる。
# 添字でアクセスできる。1から始まる

(x <- c(0,1,2,3,4)) # ベクトル作成
(x <- c(0:4)) # ベクトル作成（上と同じ）
(y <- c("foo", "bar")) # 文字列のベクトル

(x[2]) # 添字でアクセスする
(x[0]) # 0ではアクセスできない
x[c(1,3,5)] # 添字をベクトルで指定する

(x <- seq(0,3,by=0.5)) # 等差数列のベクトルを生成する。0から3までの0.5刻み
(y <- seq(0,3,length=5)) # 長さを指定して生成する。

(z <- 1:10) #seq(1,10,by=1)と同義
(z[3:8]) # 3から8まで

(z <- rep(1,7)) #1を7回繰り返す
(y <- rep(c(1,2,3), times=3)) # 1,2,3を3回繰り返す
(y <- rep(c(1,2,3), each=3)) # 1,2,3を1つずつ3回繰り返す

(x <- seq(0,2,by=0.3)) # 2まで行かない。
(length(z)) # ながさ
(z <- c(x,y)) # x,yを結合する
rev(x) # 逆転
(LETTERS) # 文字列アルファベットのベクトル
(letters) # 小文字のアルファベットのベクトル

## 課題
(seq(17,1,by=-1))
(17:1)
(seq(1,30,by=2))
(rep(pi, 10))


# 行列

# ベクトルから作成することが多い。
# 全ての要素がaのm x nの行列：matrix(a,m,n)

# 高次元のデータ構造としてarrayを用いることがある

x <- c(2,3,5,7,11,13)
(X <- matrix(x,2,3)) # 縦（列）から行列が埋まることに注意
(Y <- matrix(x,2,3, byrow = TRUE)) # 横（ぎょう）にもできる

nrow(X) # 行数
ncol(X) # 列数

X[1,2] # 要素
X[1,] # 要素
X[,2] # 要素

(as.vector(X)) # ベクトルに戻す
(dim(x) <- c(2,3))  # ベクトルに次元属性を持たせて行列化

(x)

# 課題
(matrix(1:6, 2, 3, byrow = T))
??diagonal
(diag(c(3,1,4))) # 行列を対角成分とする行列を作る

# リスト

# ベクトルを一般化したもの
# ベクトルはスカラのみだが、リストは何でもOK
# 統計量計算の関数の返り値がリストになっていることが多い

# リストLへのアクセスはL[[i]]とアクセスする

(L1 <- list(c(1,2,5,4), matrix(1:4, 2), c("Hello", "World"))) # さまざまなデータ型を入れることができる
(L1[[1]])
(L1[[2]])
(L1[[c(3,2)]]) # 3番目を取得してから2番目を取得する
(L1[[3]][2]) #　上と同じ
L1[c(2,3)] # 複数成分を取り出す

L1[1] # リストとして取り出す
L1[[1]] #  L1の第1成分を取り出す

# named list
(L2 <- list(Info = "解析授業", List1 = L1))
(L2[["Info"]]) # 取り出し
(L2$Info) #取り出し

# 後から名前をつける
names(L1) <- c("Vector", "matrix", "character")
(L1)


# 型：データフレーム
# 行列風のリスト。各成分の長さが等しいベクトル、のようなもの（よくわからん
# 長さが等しいベクトルx,yを用いて 、data.frame(x,y,...)で作成する

(x <- data.frame(
  month=c(4,5,6,7),
  price=c(900,1000,1200,1100),
  deal=c(100,80,50,75)
))
(x[2,3]) # 2ぎょう3列を取得
(x[3,])
(x$price)
(x[[2]]) # リストを取り出す
(x[2]) # DFとして取り出す

rownames(x) # 列名
rownames(x) <- c("Apre", "May", "Jun", "Jul") #変更
(x)

colnames(x) # 行名、列と同様に変更できる

# 課題
(y <- data.frame(国語 = seq(90, 60, by=-10),
                数学 = seq(25, 100, by = 25),
                row.names = LETTERS[1:4]))

# ベクトル計算
# 数値と同じように和と差を計算できる

a <- 1:3
b <- 4:6
(a + b)
(a + 1:6) # 長さが足りないときは、繰り返して計算される
(rep(1:3, times=2) + 1:6) # 上と同じ
(rep(1:3, times=2) + 1:5) # 多い方が整数倍ではないとき、警告となる
a - b # 引き算
a * 2 # スカラばい

# ベクトル同士のかけ算は成分ごとになる。（ハダマード積）
# 内積を計算するときは別の手法がある

a <- 1:3
b <- 4:6
a %*% b # 内積（通常の積）
try(a %*% (1:6)) # 長さが異なるときはエラーとなる
a * b
a * 1:6 # 長さが足りないときは周期的に計算

(a <- (1:6) * pi/2)
sin(a) # 関数の結果も成分ごとに計算となる
exp(a) # 同じ
log(a) # 同じ


# 行列の演算

(A <- matrix(1:6,nrow=2,ncol=3)) # ベクトルを行列化
(b <- rbind(c(2,3,5), c(7,11,13))) # 行ベクトル
(C <- cbind(c(0,0),c(0,1), c(1,0))) # 列ベクトル

A + B - C

(A <- matrix(1:6,nrow=2,ncol=3)) # ベクトルを行列化
(B <- rbind(c(2,3,5), c(7,11,13))) # 行ベクトル
(C <- cbind(c(2,3,5), c(7,11,13))) # 列ベクトル

A * B # 要素ごとの積
A / B # 要素ごとの除算
A %*% C # 行列の積(2x2)
C %*% B # 行列の積(3x3)
try(A %*% A) # 行列の積(3x3) 例外
A %*% t(A) # A x Aの転置行列(2x2)

sin(A) #行列の成分ごとに結果が帰ってくる
exp(A)


# 行列式
(A <- matrix(1:9,nrow=3,ncol=3))
det(A)
# 対角成分の総和
sum(diag(A))

# Hamilton-Cayleyの定理
A <- matrix(1:4,2)
A^2
A %*% A
