#install.packages(vegan)
library(vegan)

data <- data.matrix(data) #convert all to numeric 
simp_results <- simper(data, realm, permutations = 999) #percent cover results 
results <- summary(simp_results, ordered = TRUE) #view cumulative contributions

simp_results
summary(simp_results)
summary(results)
results

#save to CSV
sink("results_all_percentcover.csv")
print(results)
sink()

sink("results_cumulativecontributions.csv")
print(simp_results)
sink()


