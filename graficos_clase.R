# Cargamos las librerías necesarias
library(mlbench)
library(ggplot2)
library(plotly)
library(tidyverse)
library(viridis)

# Cargamos unos datos en particular
data("PimaIndiansDiabetes2", package = "mlbench")
datos = PimaIndiansDiabetes2
dim(datos)
n = dim(datos)[1]
p = dim(datos)[2]

# Para visualizar cómodamente el conjunto de datos
View(datos)

#######-------------- Diagrama de dispersión --------------#######
# En R base

# Simple Scatterplot
plot(datos$glucose, datos$insulin, main="Diagrama de dispersión con R base",
     xlab="Glucosa ", ylab="Insulina", 
     pch = c(8, 23)[datos$diabetes],
     col=datos$diabetes)
legend("topleft", legend=unique(datos$diabetes), 
       pch=c(8, 23)[datos$diabetes], 
       col=datos$diabetes)


## Con la librería plotly para que sea interactivo

library(plotly)

fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species)

fig

fig <- plot_ly(data = datos, x = ~glucose, y = ~insulin, color = ~diabetes,
               hovertemplate = paste('Diabetes: ',datos$diabetes,
                                     '<br> Glucosa: ',datos$glucose,
                                     '<br> Insulina: ',datos$insulin))

fig <- fig %>% layout(title = 'Diagrama de dispersión de glucosa frente a insulina')

fig











