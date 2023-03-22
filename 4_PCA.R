
library(vegan)
library(plyr)

data <- data.matrix(data) #convert all to numeric

#PCA on categories data following ordination instructions from Borcard2011
data.transf <- decostand(data, "range", na.rm = TRUE) #transform data so no negative #s (all vars scaled between 0-1)
data.transf <- data.transf[complete.cases(data.transf),]

#hellinger transformation
data.hell <- decostand(x, 'hellinger', na.rm = TRUE)  #Hellinger pre-transformation of data (see Barcord2011 p31)
data.hell.pca <- rda(data.hell)
data.hell.pca
summary(data.hell.pca)

#Simple preview plot of PCA data
plot(data.hell.pca)

pca <- summary(data.hell.pca)
pca.df.algae <- as.data.frame(pca[1])
pca.df.sites <- as.data.frame(pca[2])
siteStrings <- rownames(pca.df.sites) #different site names

#Output the eigenvalues
pca.eigenvalues <- summary(data.hell.pca)
pca.eigenvalues <- pca.eigenvalues$cont$importance
print(pca.eigenvalues)
#write.csv(pca.eigenvalues, "results_eigenvalues.csv") #don't forget to change the file name!



###############################################################
#PCA with prcomp (to graph with eigenvectors)
###############################################################

#install.packages("devtools")
library(devtools)
#install_github("vqv/ggbiplot")
library(ggbiplot)

#remove data with zero variance
data_filtered.hell <- data.hell[,apply(data.hell, 2, var, na.rm = TRUE) != 0]

#Apply PCA
data.hell.prcomp <- prcomp(data_filtered.hell, scale = FALSE)
str(data.hell.prcomp)

bioRealms$Realm <- as.factor(bioRealms$Realm)
Realm <- bioRealms$Realm
unique(Realm)

#Plot PCA
g <- ggbiplot(data.hell.prcomp, 
              group = Realm, ellipse = TRUE,
              circle = FALSE, labels = NULL, labels.size = 6, 
         varname.size = 4, varname.adjust = TRUE, var.axes = TRUE) +
  geom_point(shape=Realm) +
  ggtitle("") +
  theme_bw()

plot(data.hell.prcomp, type = "l")


