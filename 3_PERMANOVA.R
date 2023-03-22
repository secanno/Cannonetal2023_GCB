library(vegan)



######## Realm 13

#run permanova for variables that had VIF < 10 in the Realm13 region
x <- adonis2(abund_table ~ msec_reefarea_200km + msec_wave_mean + Depth + MeanSST_surveymonth + chl_a_kurt +
              msec_reefarea_15km + par_ave_surveymonth + cumul_humanimpact_score + aspect + Management,
             data = meta_table, permutations = 999, by = NULL)
x
x_full <- adonis2(abund_table ~ msec_reefarea_200km + msec_wave_mean + Depth + MeanSST_surveymonth + chl_a_kurt +
                    msec_reefarea_15km + par_ave_surveymonth + cumul_humanimpact_score + aspect + Management,
                  data = meta_table, permutations = 999)
x_full

######## Realm 16

#run permanova for variables that had VIF < 10 in the Realm16 region

x <- adonis2(abund_table ~ score_cyclones + maxDHW + nutrient_percent + NDVI_scaled + chl_a_kurt + NumStorms_5Yrs_Type3Plus + 
               Latitude + par_ave_surveymonth + msec_wave_mean + Management,
             data = meta_table, permutations = 999, by = NULL)
x
x_full <- adonis2(abund_table ~ score_cyclones + maxDHW + nutrient_percent + NDVI_scaled + chl_a_kurt + NumStorms_5Yrs_Type3Plus + 
                    Latitude + par_ave_surveymonth + msec_wave_mean + Management,
                  data = meta_table, permutations = 999)
x_full




########
# Realm 17


#run permanova for variables that had VIF < 10 in the Realm17 region


x <- adonis2(abund_table ~ Habitat + aspect + Management + Depth + NDVI_scaled + par_ave_surveymonth + MeanSST_surveymonth,
             data = meta_table, permutations = 999, by = NULL)
x
x_full <- adonis2(abund_table ~ Habitat + aspect + Management + Depth + NDVI_scaled + par_ave_surveymonth + MeanSST_surveymonth,
                  data = meta_table, permutations = 999)
x_full



######## Realm 20

#run permanova for variables that had VIF < 10 in the Realm20 region


x <- adonis2(abund_table ~ NDVI_scaled + WWE + aspect + msec_wave_mean,
             data = meta_table, permutations = 999, by = NULL)
x
x_full <- adonis2(abund_table ~ NDVI_scaled + WWE + aspect + msec_wave_mean,
                  data = meta_table, permutations = 999)
x_full


######## Realm 29
#redo for Realm 29

#run permanova for variables that had VIF < 10 in the Realm29 region

x <- adonis2(abund_table ~ chl_a_kurt + nutrient_percent + Management + WWE,
             data = meta_table, permutations = 999, by = NULL)
x
x_full <- adonis2(abund_table ~ chl_a_kurt + nutrient_percent + Management + WWE,
                  data = meta_table, permutations = 999)
x_full



######## Realm 9
#redo for Realm 9

#run permanova for variables that had VIF < 10 in the Realm9 region

x <- adonis2(abund_table ~ NumStorms_5Yrs_Type3Plus + nutrient_percent,
             data = meta_table, permutations = 999, by = NULL)
x
x_full <- adonis2(abund_table ~ NumStorms_5Yrs_Type3Plus + nutrient_percent,
                  data = meta_table, permutations = 999)
x_full



