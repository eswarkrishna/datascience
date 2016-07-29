# This mini-project is based on the K-Means exercise from 'R in Action'
# Go here for the original blog post and solutions
# http://www.r-bloggers.com/k-means-clustering-from-r-in-action/

# Exercise 0: Install these packages if you don't have them already

# install.packages(c("cluster", "rattle","NbClust"))

# Now load the data and look at the first few rows
data(wine, package="rattle")
head(wine)

# Exercise 1: Remove the first column from the data and scale
# it using the scale() function
wine$Type <- NULL
df <- wine

# Now we'd like to cluster the data using K-Means. 
# How do we decide how many clusters to use if you don't know that already?
# We'll try two methods.

# Method 1: A plot of the total within-groups sums of squares against the 
# number of clusters in a K-means solution can be helpful. A bend in the 
# graph can suggest the appropriate number of clusters. 

wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
}

wssplot(df)
dev.off()

set.seed(1234)
# Clusters 
fit <- kmeans(df, 3, nstart=25)

require(graphics)

# Plot the Clusters
pdf("clusters.pdf")
plot(df, col=fit$cluster)
points(fit$centers, col=1:3, pch = 8, cex = 2)
dev.off()

# ggplot visual
df$cluster <- factor(fit$cluster)
centers <- as.data.frame(fit$centers)
require(ggplot2)
pdf("Clustering of Wine data.pdf")
ggplot(data=df, aes(x=Alcohol,y=Malic,color=cluster)) + geom_point()
dev.off() 

# Size of the Clusters
size <- fit$size
