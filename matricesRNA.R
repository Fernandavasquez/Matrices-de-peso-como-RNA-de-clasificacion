library(neuralnet)
library(tidyverse)
library(caret)
data = iris
muestra = createDataPartition(data$Species,p = 0.8, list = F)
train = data[muestra,]
test = data[-muestra,]
red.neuronal = neuralnet(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = train,hidden = c(2,3))
red.neuronal$act.fct
plot(red.neuronal)
#predecir especie
prediccion =  predict(red.neuronal, test, type = 'class')
#Columna q tiene el calor maximo
decodifica.col = apply(prediccion,1, which.max)
codificado =  data_frame(decodifica.col)
codificado = mutate(codificado, especie = recode(codificado$decodifica.col,"1"="Setosa: ","2" = "Versicolor: ", "3"="Virginica: "))
test$Especie = codificado$especie
print(weights_in_hidden1 <- red.neuronal$weights[[1]])
#visualizar datos

