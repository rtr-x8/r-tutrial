# 3Dグラフの描画
install.packages('scatterplot3d')
require('scatterplot3d')

kikou <- read.csv('kikou2016.csv', fileEncoding = 'sjis')
dot <- subset(kikou, select = c('風速', '日射量', '気温'))
par(family = 'HiraginoSans-W4')
scatterplot3d(dot, pch=4, color='orchid')

# 画面の分割
op <- par(mfrow=c(2,2)) # 画面を2x2に分割し、行ごとにプロットする。
                        # 設定を代入しておくとリセットしやすく便利
cl <- terrain.colors(4)
nam <- colnames(kikou)[-(1:2)]

for (i in 1:4) {
  hist(kikou[,nam[i]], col=cl[i], breaks = 25, xlab='', main=paste0(nam[1]))
}

par(op)
# 余白の調整

op0 <- par(mflow=c(1,2))
plot(kikou[,3:4])
op <- par(mar=c(9,2,1,6)) # default: c(5,4,4,2)+_ 0.1 下、左、上、右
plot(kikou[,3:4])
?par
