library(vegan)




####
# run ordistep to select variables
cca0 <- cca(abund_table ~ 1, meta_table) #reduced model
cca1 <- cca(abund_table ~ ., meta_table) #full model
cca1

plot(cca1)

finalmod <- ordistep(cca0, scope = formula(cca1), direction = 'both')
finalmod

#anova results
anova.cca(finalmod)

#variance inflation scores
vif.cca(finalmod)

#goodness of fit (note: this is a ratio of inertias, not a "true" r2 value)
RsquareAdj(finalmod)
sink()

plot(finalmod,scaling = 2, display = c('sp',  'cn'))


###############
#repeat for each Realm in the dataset


######
#Realm 13


####
# run ordistep to select variables
cca0 <- cca(abund_13 ~ 1, meta_13) #reduced model
cca1 <- cca(abund_13 ~ ., meta_13) #full model
cca1

plot(cca1)

finalmod <- ordistep(cca0, scope = formula(cca1), direction = 'both')
finalmod
#anova results
anova.cca(finalmod)

#variance inflation scores
vif.cca(finalmod)

#goodness of fit (note: this is a ratio of inertias, not a "true" r2 value)
RsquareAdj(finalmod)


plot(finalmod, scaling = 2, display = c('sp',  'cn'))

#############
#Realm 16

####
# run ordistep to select variables
cca0 <- cca(abund_16 ~ 1, meta_16) #reduced model
cca1 <- cca(abund_16 ~ ., meta_16) #full model
cca1

plot(cca1)

finalmod <- ordistep(cca0, scope = formula(cca1), direction = 'both')
finalmod

#anova results
anova.cca(finalmod)

#variance inflation scores
vif.cca(finalmod)

#goodness of fit (note: this is a ratio of inertias, not a "true" r2 value)
RsquareAdj(finalmod)

plot(finalmod, scaling = 2, display = c('sp',  'cn'))



#############
#Realm 17


####
# run ordistep to select variables
cca0 <- cca(abund_17 ~ 1, meta_17) #reduced model
cca1 <- cca(abund_17 ~ ., meta_17) #full model
cca1

plot(cca1)

finalmod <- ordistep(cca0, scope = formula(cca1), direction = 'both')
finalmod

#anova results
anova.cca(finalmod)

#variance inflation scores
vif.cca(finalmod)

#goodness of fit (note: this is a ratio of inertias, not a "true" r2 value)
RsquareAdj(finalmod)

plot(finalmod, scaling = 2, display = c('sp',  'cn'))


#############
#Realm 20


####
# run ordistep to select variables
cca0 <- cca(abund_20 ~ 1, meta_20) #reduced model
cca1 <- cca(abund_20 ~ ., meta_20) #full model
cca1

plot(cca1)

finalmod <- ordistep(cca0, scope = formula(cca1), direction = 'both')
finalmod

#anova results
anova.cca(finalmod)

#variance inflation scores
vif.cca(finalmod)

#goodness of fit (note: this is a ratio of inertias, not a "true" r2 value)
RsquareAdj(finalmod)

plot(finalmod, scaling = 2, display = c('sp',  'cn'))



#############
#Realm 9

####
# run ordistep to select variables
cca0 <- cca(abund_9 ~ 1, meta_9) #reduced model
cca1 <- cca(abund_9 ~ ., meta_9) #full model
cca1

plot(cca1)

finalmod <- ordistep(cca0, scope = formula(cca1), direction = 'both')
finalmod

#anova results
anova.cca(finalmod)

#variance inflation scores
vif.cca(finalmod)

#goodness of fit (note: this is a ratio of inertias, not a "true" r2 value)
RsquareAdj(finalmod)

plot(finalmod, scaling = 2, display = c('sp',  'cn'))


