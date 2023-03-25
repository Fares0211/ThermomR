# thermomR : Implémentation d'une fonction prédictive de la température de l'air sur RStudio.
## Projet de mathématiques appliquées sur la régression linéaire.

--------------

### Partie I : Questions théoriques

La régression linéaire simple permet d'expliquer une variable quantitative Y par un seul régresseur X : Y =β0+β1X+ε avec ε∼N(0,σ2).
La variable X est supposée déterministe, tandis que Y et ε sont aléatoires
Pour estimer les paramètres du modèle β0 et β1 et σ, nous disposons de n observations (y1, x1), . . . , (yn, xn). Les variables εi sont supposées être indépendantes et suivre la même loi. Les estimateurs des moindres carrés
de β0 et β1 sont définis par :
􏰀ni=1(xi - x ̄)(yi - y ̄) β0 = y ̄ - β1x ̄ β1 = 􏰀ni=1(xi - x ̄)2
􏰀n 2 l'estimateur de σ2 est donné par σˆ2 = i=1 eˆi .ˆˆˆˆn-2

1. Quelle est la loi des variables aléatoires (βˆ0, βˆ1) ?
2. Les variables sont-elles Yi indépendantes ? Sont-elles identiquement distribuées ? Justifiez votre réponse
3. Donnez un exemple pratique où ce modèle peut être utilisé. Que représente la variable cible Y ? Que représente le régresseur X ?


### Partie II : Applications pratiques

##### 2.1. Régression linéaire simple

2.1.1 Etude préliminaire

Dans cette section, vous allez ajuster un modèle linéaire pour prédire la teneur en ozone en fonction d'autres variables météorologiques. Dans moodle, vous trouverez un fichier texte attribué à votre groupe de TD appelé ozone.txt. Ce fichier contient les variables suivantes :
- la teneur maximale en ozone mesurée au cours de la journée (maxO3), - la température à midi (T12),
- la nébulosité à midi (Ne12) et
- la teneur maximale en ozone la veille (maxO3v).

Exercice 1. Ouvrez le fichier texte et enregistrez-le dans votre répertoire de travail. Importez les données dans un cadre de données que vous nommerez oz.
- Dans R, utilisez la commande read.table. Vous pouvez utiliser la commande attach(oz) pour pouvoir utiliser directement les noms des variables.
- En Python, utilisez la fonction read_csv() de la bibliothèque pandas.
Combien d'observations ce jeu de données contient-il ? Combien y a-t-il de variables ?

Exercice 2. Calculez les statistiques descriptives pour toutes les variables de l'ensemble de données :
- Dans R, vous pouvez utiliser la fonction summary() pour produire des statistiques descriptives pour chaque variable. En outre, utilisez la fonction
En outre, utilisez la fonction plot() pour tracer le diagramme de dispersion des variables.
- En Python, la commande oz.describe() permet de calculer des statistiques descriptives. En outre, la fonction scatter_matrix() de la bibliothèque pandas.
Interprétez le diagramme de dispersion.
Quelles sont les valeurs de la moyenne, des quartiles, du maximum et du minimum de la teneur maximale en ozone au cours de la journée ? Interprétez le diagramme de dispersion avec vos propres mots.
Vous allez maintenant calculer la matrice de corrélation pour toutes les caractéristiques de l'ensemble de données.
Quelle est la variable la plus corrélée avec la teneur en ozone maxO3 ? Interprétez le coefficient de corrélation.
- Dans R, utilisez la fonction cor() pour calculer la matrice de corrélation empirique.
- En Python, la commande oz.corr() permet de calculer la matrice de corrélation empirique.
     
2.1.2 Ajustement du modèle et qualité de l'ajustement

Exercice 3. Dans cet exercice, vous allez ajuster un modèle linéaire simple avec un seul régresseur, la nubelosité,
pour prédire la teneur en ozone.
- Dans R, utilisez la fonction lm() pour ajuster le modèle : maxO3 = β0 + β1Ne12 + ε. Vous noterez la sortie de la fonction lm
sortie de la fonction lm oz.regsimple.
- En Python, vous utiliserez le module statsmodels, un module qui permet de spécifier des modèles
à l'aide de formules de style R et de pandas DataFrames :
import statsmodels . api as sm
lm = sm.OLS.from formula('maxO3 ̃ Ne12', oz)
oz regsimple = lm. fit () print oz regsimple .summary()
Quelles sont les estimations des coefficients ? Interprétez l'estimation du coefficient βˆ1.
En outre, vous pouvez dessiner le diagramme de dispersion entre maxO3 et Ne12 et ajouter la ligne de régression qui vient d'être ajustée. Pour ce faire, vous pouvez utiliser les fonctions plot() et abline() de R. En Python, vous pouvez utiliser la fonction pour Utiliser la commande abline pour ajouter au nuage de points. En Python, vous pouvez utiliser le code matplotlib library :
import matplotlib . pyplot as plt
plt.scatter(oz.Ne12, oz.maxO3)
plt.plot([x,x], [x,x], 'k-', color = 'r') #trace 2 points de la ligne ajustée

Exercice 4. Intervalles de confiance (IC) pour les paramètres
[Donnez l'expression générale d'un intervalle de confiance 1 - α pour le paramètre β1. Calculez l'intervalle de confiance à 90% pour ce coefficient. Interprétez les résultats.
- Dans R, la commande confint() permet de calculer les intervalles de confiance pour les paramètres du modèle. - En Python, vous pouvez utiliser la commande oz_regsimple.conf_int(alpha= ).

Exercice 5. Vous pouvez obtenir un rapport récapitulatif de l'ajustement en exécutant :
- la commande summary(oz.regsimple) dans R.
- la commande oz_regmult.summary() en Python et en imprimant la sortie.
Vous obtiendrez le tableau suivant :
Estimation Erreur std. valeur t P r(> |t|)
                             (Intercept)
Ne12
βˆ σˆ statistict p-valuedu testH :β =0 0ˆβ00
β0 0
βˆ σˆ statisticT p-valuedu testH :β =0 1ˆβ01
β1 1
1. [Que pouvez-vous dire des variances estimées des coefficients estimés ?
2. [Développez le test d'hypothèse de la pente nulle et concluez s'il existe une relation entre la teneur maximale en ozone la veille de maxO3v et la nébulosité Ne12. Est-ce que β1 est significativement non nul ?
3. [Interprétez la valeur de R2. Que pouvez-vous dire sur la qualité du modèle ?
3

##### 2.2 Régression linéaire multiple
Dans cette section, vous effectuerez une régression linéaire avec plus d'un régresseur et comparerez ce modèle à celui obtenu par l'ajustement d'une régression linéaire simple.

Exercice 6. Ajustez le modèle de régression sur deux prédicteurs : la nébulosité Ne12 et la teneur maximale en ozone la veille de maxO3v.
maxO3 = β0 + β1Ne12 + β2maxO3v + ε
Vous pouvez utiliser les mêmes fonctions que celles utilisées pour la régression linéaire simple avec la formule :
'maxO3 ∼ Ne12 + maxO3v' Vous appellerez la sortie de la fonction oz.regmult.
[Quelles sont les estimations des coefficients ? Donnez une interprétation à ces coefficients. Effectuez le test d'hypothèse de la pente nulle.
2.2.1 Faire des prédictions

Exercice 7. Nous aimerions prédire la teneur en ozone pour demain. Aujourd'hui, la teneur maximale en ozone
Aujourd'hui, la teneur maximale en ozone est de 80 et les prévisions météorologiques estiment que la nébulosité sera de 6 demain à midi.
[Quelle est la valeur prédite de maxO3 ? Utilisez les modèles de régression simple et multiple précédemment ajustés. Comparez les deux résultats.
-
-
Dans R, la fonction predict.lm() prédit les valeurs estimées de la variable cible pour de nouvelles valeurs des régresseurs. Elle prend comme valeur d'entrée au moins un objet de type lm() et un cadre de données avec les nouvelles valeurs. Pour créer un nouveau cadre de données, vous pouvez exécuter la commande new.data <- data.frame(Ne12=6,maxO3v=80).
En Python, utilisez la fonction predict() après avoir créé un cadre de données avec les nouvelles valeurs à l'aide de la fonction DataFrame() de la bibliothèque pandas.
          Coefficient de détermination R2
Dans le cours, nous avons défini le coefficient de détermination R2 et le coefficient ajusté de dé-
de détermination R2 et le coefficient de dé- termination ajusté R ̄2 pour évaluer la qualité de l'ajustement de notre modèle. Exercice 8.
1. Que mesurent les coefficients R2 et R ̄2 ? A votre avis, lequel est le plus adapté pour comparer les modèles oz.regsimple et oz.regmult ?
2. Le rapport de synthèse vous donne les coefficients R2 et R ̄2 de vos modèles. Quel modèle choisiriez-vous pour prédire la teneur en ozone pour demain ?

