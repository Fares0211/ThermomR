# I. Theorical questions
# peut être : beta1 et 2 constantes non aléatoires proba = 1

# II. Pratical application

# Exercice 1

getwd()
#attach(ozone)
#summary(ozone)
data <- read.csv("ozone.txt",sep=" ")
print(data)
print(data$T12)
d<-subset(data,Ne12==8)
print(d)
# Dans ce dataset nous avons 50 observations et 4 variables

# Exercice 2


summary(data)

# maxO3            T12             Ne12          maxO3v
# Min.   : 41.8   Min.   : 7.90   Min.   :0.00   Min.   : 38.00
# 1st Qu.: 66.6   1st Qu.:17.40   1st Qu.:3.00   1st Qu.: 63.40
# Median : 83.9   Median :19.75   Median :6.00   Median : 83.40
# Mean   : 86.3   Mean   :20.32   Mean   :5.02   Mean   : 84.28
# 3rd Qu.:102.2   3rd Qu.:24.32   3rd Qu.:7.00   3rd Qu.:102.75
# Max.   :139.0   Max.   :29.50   Max.   :8.00   Max.   :142.80


plot(data)
# plot(data) affiche les graphiques des variables (Vi,Vj) avec i,j
#allant de 1 à 4
# Certaines variables sont corrélées d'autres pas
#Les variables plus au moins corrélées positivement : maxO3 & T12,
#maxO3 & maxO3v, maxO3v & max03, etc.
# A compléter

# On peut cibler le graphiques de deux variables donnée : exemple
plot(data$T12,data$Ne12)
plot(data$maxO3,data$T12)
plot(data$T12,data$maxO3)
plot(data$Ne12,data$maxO3)
plot(data$maxO3v,data$maxO3)

summary(data$maxO3)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
# 41.8    66.6    83.9    86.3   102.2   139.0

plot(data$maxO3)
#maxO3 est corrélées positivement : maxO3 & T12, maxO3 & maxO3v.
#maxO3 est corrélées négativement : maxO3 & Ne12.

cor(data)

#         maxO3        T12       Ne12     maxO3v
# maxO3   1.0000000  0.5282814 -0.7701171  0.6643758
# T12     0.5282814  1.0000000 -0.4880260  0.3353368
# Ne12   -0.7701171 -0.4880260  1.0000000 -0.5293615
# maxO3v  0.6643758  0.3353368 -0.5293615  1.0000000

# Ne12 est la variable la plus corrélée avec max03
# le coefficient de corélation est égal à -0.7701171.
# Il s'agit d'une corrélation négative assez forte, i.e.
# Ne12i < Ne12j  => maxO3i  > mac03j pour plus de 77/% des cas


# Exercice 3



#maxO3 = β0 + β1Ne12 + ε.

oz.regsimple <- lm(data$maxO3~data$Ne12)
summary(oz.regsimple)
# Call:
#   lm(formula = data$Ne12 ~ data$maxO3, data = data)
#
# Residuals:
#   Min      1Q  Median      3Q     Max
# -4.6524 -0.7266  0.1729  0.9424  3.2266
#
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)
# (Intercept)   12.070147   0.874003  13.810  < 2e-16 ***
#   data$maxO3  -0.081693   0.009767  -8.364 6.24e-11 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 1.634 on 48 degrees of freedom
# Multiple R-squared:  0.5931, Adjusted R-squared:  0.5846
# F-statistic: 69.96 on 1 and 48 DF,  p-value: 6.236e-11

# Les coéfficients estimates correspondent respectivement à l'ordonnée
#à l'origine
# (c'est à dire la valeur de max03 quand Ne12 = 0) et à la pente de la
#régression
# (le changement ou le delta de max03 pour un changement d'une unité de Ne12)

# Le coéfficient estimaté βˆ1 est égal à -7.260. Il confirme la
#tendance de la corrélation
# calculée dans la question précédente (-0.7701171) en termes du signe négatif
# et de la valeur. Cette valeur exprime le fait que plus la nebulosité augmente,

# t value :
# p value = p(t>=valeur t value) = à comparer à alpha/2 de l'IC
# si p value < alpha alors on rejete H0 et on retient H1 beta <> 0

# plus le maximum d'ozone diminue environ 7 fois.

# Les étoiles de préciser les bonnes performances du modèle

# Solution : lire la colonne “Estimate” β0^=−1.6048 et β1^=0.5174.
# Les écarts-type estimé pour ses estimateurs sont dans la colonne “Std. Error


plot(data$Ne12 , data$maxO3)

abline(122.744 , -7.260)

#Exercice 4


confint(oz.regsimple, level=0.80)

#                   5 %       95 %
#   (Intercept) 114.573810 130.914843
# data$Ne12    -8.715601  -5.804051

#                 10 %       90 %
#   (Intercept) 116.414173 129.074480
# data$Ne12    -8.387696  -6.131956

# Expression générale :
# l'intervalle de confiance IC à 1- α (niveau de risque α) pour β1
# est défini par P(β1 ∈ IC) = 1- α
# Dans notre cas, cela correspond à [-8.387696  -6.131956]
# Pour rappel, l’intervalle de confiance à 95% de la pente est une
#étendue de valeurs qui a une probabilité de 95% de contenir la vraie
#pente (celle de la population).

# Soit α ∈]0, 1[. On note cn−2(u) le u-quantile de la loi χ2(n − 2).
#

#Exercice 5

summary(oz.regsimple)

oz.regsimple2 <- lm(data$maxO3v~data$Ne12)
summary(oz.regsimple2)

names(oz.regsimple)
summary(oz.regsimple)$coefficients
summary(oz.regsimple2)$r.squared

plot(data$Ne12, data$maxO3v)

# Call:
#   lm(formula = data$maxO3 ~ data$Ne12, data = data)
#
# Residuals:
#   Min      1Q  Median      3Q     Max
# -31.944 -11.045  -2.726   9.424  34.615
#
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)
# (Intercept)  122.744      4.872  25.197  < 2e-16 ***
#   data$Ne12     -7.260      0.868  -8.364 6.24e-11 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 15.4 on 48 degrees of freedom
# Multiple R-squared:  0.5931, Adjusted R-squared:  0.5846
# F-statistic: 69.96 on 1 and 48 DF,  p-value: 6.236e-11

# 4.872
# 0.868
# Ces valeurs correspondent aux ecart-type estimés des résidues.
# On peut en déduire que la dispersion des erreurs pour beta1 sont plus grandes
# alors que pour beta2 sont faibles (moins dispersées)

#zero slope hypothesis test
# Le test de significativité (H0) : β1 = 0 contre (H1) : β1 􏰤 0
#permet de tester l’utilité du modèle
# de régression
# L'idée est de supposer que la pente est nulle, i.e. max03 et Ne12
#sont indépendant
# pour voir si on doit rejeter l'hypothèse ou pas
# Etant donné que la p-value est très faible, on peut déduire que
#l'hypothèse H0 doit être rejetée
# et que les deux variables sont corrélées


#Exercice 6

oz.regmult<-lm(data$maxO3 ~ data$Ne12 + data$maxO3v, data=data)
summary(oz.regmult)
#
# Call:
#   lm(formula = data$maxO3 ~ data$Ne12 + data$maxO3v, data = data)
#
# Residuals:
#   Min      1Q  Median      3Q     Max
# -29.602  -8.109  -0.038   9.295  28.888
#
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)
# (Intercept) 85.02028   11.09425   7.663 8.13e-10 ***
#   data$Ne12   -5.48007    0.91018  -6.021 2.50e-07 ***
#   data$maxO3v  0.34160    0.09248   3.694 0.000575 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 13.7 on 47 degrees of freedom
# Multiple R-squared:  0.6846, Adjusted R-squared:  0.6712
# F-statistic: 51.02 on 2 and 47 DF,  p-value: 1.668e-12

# Estimates : la valeur à l'origine et les pentes en fonction de Ne12
#et de max03v

# t=b-beta0/SEb

confint(oz.regmult, level = 0.80)

#Exercice 7

oz.regsimple <- lm(maxO3~Ne12, data = data)
new.dataS <- data.frame(Ne12=6)
predict.lm(oz.regsimple, new.dataS)

oz.regmult = lm(maxO3 ~ Ne12 + maxO3v, data = data)
new.dataM <- data.frame(Ne12=6, maxO3v=80)
predict.lm(oz.regmult, new.dataM)


#Exercice 8

summary(oz.regsimple)$r.squared

summary(oz.regsimple)

summary(oz.regmult)$r.squared

summary(oz.regmult)

# Les variances par rapport au modèle.
# Les valeurs de la variance des regressions simples et multiple sont
# autour 70% qui sont bonnes

# On peut remarquer aussi que la regression multiple en intégrant une
# variable supplémentaire
# est plus performante que dans le cas de la regression simple.
# Ceci est aussi valable pour les variances ajustées

# On peut remarquer que les variances ajustées sont inférieurs dans le
# cas des regression multiple.
# Ceci est normal car la variance dans ce cas doit dépendre de
# plusieurs variables.

