# k meanth

x <- subset(iris, select = -Species)
set.sedd(123)
out <- kmeans(x, centers = 3, nstart = 20) # k=3, 初期値は20通り
# out$cluster
table(iris$Species[out$cluster == 1])
table(iris$Species[out$cluster == 2])
table(iris$Species[out$cluster == 3])

boxplot(x)
# 標準化
out <- kmeans(scale(x), centers = 3, nstart=20)

table(iris$Species[out$cluster == 1])
table(iris$Species[out$cluster == 2])
table(iris$Species[out$cluster == 3])

boxplot(x)

# k= 2 としてみる
out <- kmeans(x, centers = 2, nstart=20)

table(iris$Species[out$cluster == 1])
table(iris$Species[out$cluster == 2])




