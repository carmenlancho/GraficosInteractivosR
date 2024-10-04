# https://johnguerra.co/slides/SUSummit2022/#/4/3

# Ejemplo básico en R base
data <- data.frame(edad = c(45, 50, 55, 60, 65, 70, 75, 80, 85, 90))
hist(data$edad, col = "lightblue", main = "Distribución de Edad de Pacientes", xlab = "Edad", ylab = "Frecuencia")


library(ggplot2)

# Ejemplo con ggplot2
data <- data.frame(
  edad = c(45, 50, 55, 60, 65, 70, 75, 80, 85, 90),
  genero = rep(c("Hombre", "Mujer"), each = 5)
)
ggplot(data, aes(x = edad, fill = genero)) +
  geom_bar(stat = "count", position = "dodge") +
  labs(title = "Pacientes por Rango de Edad y Género", x = "Edad", y = "Número de Pacientes")


library(plotly)

# Convertir ggplot a plotly
p <- ggplot(data, aes(x = edad, fill = genero)) +
  geom_bar(stat = "count", position = "dodge")

ggplotly(p)


# Crear un conjunto de datos sencillo con edades de pacientes
edades <- c(45, 50, 55, 60, 65, 70, 75, 80, 85, 90)

# Crear un histograma
hist(edades, 
     col = "lightblue", 
     main = "Distribución de Edad de Pacientes", 
     xlab = "Edad", 
     ylab = "Frecuencia",
     breaks = 5)


# Crear un conjunto de datos
colesterol <- c(200, 210, 220, 180, 170, 250, 260, 240, 230)
grupo <- c("Grupo A", "Grupo A", "Grupo A", "Grupo B", "Grupo B", "Grupo B", "Grupo C", "Grupo C", "Grupo C")

# Crear un boxplot
boxplot(colesterol ~ grupo, 
        col = c("lightgreen", "lightblue", "lightcoral"), 
        main = "Colesterol por Grupo de Pacientes", 
        xlab = "Grupo", 
        ylab = "Colesterol (mg/dL)")


library(ggplot2)

# Crear datos
data <- data.frame(
  edad = c(45, 50, 55, 60, 65, 70, 75, 80, 85, 90),
  genero = rep(c("Hombre", "Mujer"), each = 5)
)

# Gráfico de barras
ggplot(data, aes(x = factor(edad), fill = genero)) +
  geom_bar(position = "dodge") +
  labs(title = "Pacientes por Rango de Edad y Género", x = "Edad", y = "Número de Pacientes") +
  scale_fill_manual(values = c("Hombre" = "lightblue", "Mujer" = "lightcoral")) +
  theme_minimal()



data <- data.frame(
  edad = c(45, 50, 55, 60, 65, 70, 75, 80, 85, 90),
  colesterol = c(180, 190, 200, 210, 220, 230, 240, 250, 260, 270)
)

ggplot(data, aes(x = edad, y = colesterol)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", se = FALSE, color = "orange") +
  labs(title = "Relación entre Edad y Colesterol", x = "Edad", y = "Colesterol (mg/dL)") +
  theme_classic()



library(plotly)

# Convertir ggplot a gráfico interactivo
p <- ggplot(data, aes(x = edad, y = colesterol)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", se = FALSE, color = "orange") +
  labs(title = "Relación entre Edad y Colesterol", x = "Edad", y = "Colesterol (mg/dL)")

ggplotly(p)



library(plotly)

# Datos de ejemplo
data <- data.frame(
  edad = c(45, 50, 55, 60, 65, 70, 75, 80, 85, 90),
  colesterol = c(180, 190, 200, 210, 220, 230, 240, 250, 260, 270),
  paciente = c("Juan", "María", "Pedro", "Ana", "Luis", "Marta", "Carlos", "Sofía", "David", "Laura")
)

# Crear el gráfico de dispersión interactivo con información en el hover
fig <- plot_ly(data, x = ~edad, y = ~colesterol, type = 'scatter', mode = 'markers',
               marker = list(size = 10, color = 'rgba(152, 0, 0, .8)', line = list(width = 2)),
               text = ~paste("Paciente:", paciente, "<br>Colesterol:", colesterol, "<br>Edad:", edad),
               hoverinfo = 'text')

fig <- fig %>% layout(title = "Relación entre Edad y Colesterol",
                      xaxis = list(title = "Edad"),
                      yaxis = list(title = "Colesterol (mg/dL)"))

fig



library(plotly)

# Datos de ejemplo
data <- data.frame(
  edad = c("40-50", "50-60", "60-70", "70-80", "80-90"),
  hombres = c(10, 15, 13, 12, 8),
  mujeres = c(12, 14, 9, 10, 7)
)

# Crear el gráfico de barras interactivo
fig <- plot_ly(data, x = ~edad, y = ~hombres, type = 'bar', name = 'Hombres',
               text = ~paste("Hombres:", hombres), hoverinfo = 'text',
               marker = list(color = 'rgba(55, 128, 191, 0.7)'))
fig <- fig %>% add_trace(y = ~mujeres, name = 'Mujeres',
                         text = ~paste("Mujeres:", mujeres), hoverinfo = 'text',
                         marker = list(color = 'rgba(255, 65, 54, 0.7)'))
fig <- fig %>% layout(title = "Pacientes por Rango de Edad y Género",
                      xaxis = list(title = "Edad"),
                      yaxis = list(title = "Número de Pacientes"),
                      barmode = 'group')

fig



library(plotly)

# Datos de ejemplo
data <- data.frame(
  tiempo = c(1, 2, 3, 4, 5),
  Juan = c(180, 190, 200, 210, 215),
  María = c(170, 180, 190, 200, 210),
  Pedro = c(160, 170, 185, 195, 205)
)

# Crear el gráfico de líneas interactivo
fig <- plot_ly(data, x = ~tiempo, y = ~Juan, type = 'scatter', mode = 'lines+markers', name = 'Juan',
               text = ~paste("Juan - Colesterol:", Juan), hoverinfo = 'text',
               line = list(color = 'purple'))
fig <- fig %>% add_trace(y = ~María, name = 'María',
                         text = ~paste("María - Colesterol:", María), hoverinfo = 'text',
                         line = list(color = 'orange'))
fig <- fig %>% add_trace(y = ~Pedro, name = 'Pedro',
                         text = ~paste("Pedro - Colesterol:", Pedro), hoverinfo = 'text',
                         line = list(color = 'green'))

fig <- fig %>% layout(title = "Evolución del Colesterol por Paciente",
                      xaxis = list(title = "Tiempo (Meses)"),
                      yaxis = list(title = "Colesterol (mg/dL)"))

fig



#Parte 1: Gráficos en R base
# Ejemplo: Gráfico de dispersión de la relación entre edad y colesterol
# Instalar y cargar MASS si no está instalado
# install.packages("MASS")
library(MASS)
library(kmed) # aquí están los datos

# Usar el conjunto de datos `heart`
data(heart)

# Gráfico de dispersión
plot(heart$age, heart$chol,
     main = "Relación entre Edad y Colesterol",
     xlab = "Edad (años)",
     ylab = "Colesterol (mg/dL)",
     col = "blue",
     pch = 19)


# Parte 2: ggplot2
# Ejemplo: Gráfico de barras de la distribución de sexo en el conjunto de datos heart

# Instalar y cargar ggplot2 si no está instalado
# install.packages("ggplot2")
library(ggplot2)

# Gráfico de barras
ggplot(heart, aes(x = factor(sex))) +
  geom_bar(fill = "orange") +
  labs(title = "Distribución de Sexo en Pacientes con Enfermedades del Corazón",
       x = "Sexo (1 = Hombre, 0 = Mujer)",
       y = "Frecuencia") +
  theme_minimal()



# Parte 3: Plotly
# Ejemplo: Gráfico interactivo mostrando la relación entre presión arterial máxima y colesterol
# Instalar y cargar plotly si no está instalado
# install.packages("plotly")
library(plotly)

# Crear un data frame
evolucion <- heart[, c("trestbps", "chol")]

# Gráfico interactivo
plot_ly(evolucion, x = ~trestbps, y = ~chol, type = 'scatter', mode = 'markers', 
        marker = list(color = 'purple'), name = 'Relación PA y Colesterol') %>%
  layout(title = 'Relación entre Presión Arterial Máxima y Colesterol',
         xaxis = list(title = 'Presión Arterial Máxima (mmHg)'),
         yaxis = list(title = 'Colesterol (mg/dL)'))
