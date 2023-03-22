library(Hmisc)
library(corrplot)
library(corrr)

data <- as.matrix(data)
data_sign <- rcorr(data)

dpadj <- p.adjust(data_sign$P,method="bonferroni")
head(data_sign)

#write.csv(data_sign$r, file="PhysBio_compress_corr.csv")
#write.csv(data_sign$P, file="PhysBio_compress_sign.csv")
#write.csv(data_sign$P, file="PhysBio_compress_sign_Bonf.csv")

#draw plot of coefficients
corrplot(data_sign$r, type="upper", order="original", sig.level = 0.05, insig = "blank", tl.cex=0.5)


#with corrr
d <- correlate(data, quiet = TRUE)
d %>% shave() %>% rplot() + theme(text = element_text(size = 12), axis.text.x = element_text(angle = 90, hjust = 1))

