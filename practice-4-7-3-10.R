# 複雑なデータ抽出

## bekutoru
x <- c(4,1,2,9,8,3,6)
x[c(5,2)]
x[-c(2,3,7)]

(idx <- x > 3) # xのうち、3以上のもののリスト
x[idx]
x[x > 3]

x[c(2,5)] = c(0,1) #おきかえ
(x)
names(x) <- letters[1:length(x)]
(x)

## dataframe
dim(airquality) # サイズ（行数と列数）
names(airquality) # 列名
head(airquality) # 先頭
str(airquality) # 構造（データの型、内容など）がわかる。

### Ozoneが100以上のものを取り出したいとする
#### まずはベクトルと同じように取ってみる
idx <- airquality$Ozone > 100
airquality[idx,]
(idx)

#### NAが入っていると評価されず、TRUE, FALSE, NANの3パターンになることがわかる。
#### NAが結果として入り込んでしまうため利用できない

#### whichを利用するとNAを無視できる
which(idx)
airquality[which(airquality$Ozone > 100), ]
airquality[which(airquality$Ozone > 100), c("Month", 'Day')]

#### もっと簡略に書く(subsetを利用する)
subset(airquality, Ozone > 100)
subset(airquality, Ozone > 100, select=Wind:Day)
subset(airquality, !is.na(Ozone) & Day %in% c(1,2)) #OzoneがNAでなく、日付が1、2のもの
subset(airquality, Ozone > 120 | Temp >= 95)# Ozoneが120より大きく、気温が95以上
subset(airquality, Day == 1, select = -Temp) # 日付が1のもので、気温以外のカラム




