#install.packages(vegan)
library(vegan)

data <- data.matrix(data) #convert all to numeric 
simp_results <- simper(data, realm, permutations = 999)
results <- summary(simp_results, ordered = TRUE)

simp_results
summary(simp_results)
summary(results)
results

#save to CSV
sink("results_all_percentcover_byregion.csv")
print(results)
sink()

sink("results_cumulativecontributions_all_byregion.csv")
print(simp_results)
sink()


