library(data.table)
# leer con fread
df <- fread("C:/Users/Edgar/Documents/Agroasemex/SAP/20220731.csv",
            sep=',')
View(df)
####
n <- 1e6
exitos <- 0
for(i in 1:n){
  x1 <- runif(1)
  x2 <- runif(1)
  x3 <- runif(1)
  if((x1<=x2) & (x2<=x3)){
    exitos = exitos + 1
  }
}
print(exitos/n)
###
# dplyr
library(dplyr)
mtcars1 <- mtcars
rownames(mtcars1)
# mutate: modificar el dataframe
mutate(mtcars1, modelo = tolower(rownames(mtcars)),
       modelo_upper = toupper(modelo), galon_x2 = mpg*2)

# pipe: %>% composición de funciones ( x %>% f en vez de f(x))
0 %>% sin() # sin(0)

# filter: filtra los dataframes
filter(mtcars, mpg >20)
# equivalente a
mtcars %>% filter(mpg > 10)

# select: seleccionar columnas
select(mtcars1, mpg, cyl)

# arrange: reordenar (default de menor a mayor)
arrange(mtcars1, mpg)
# de mayor a menor
arrange(mtcars1, -mpg)
# ordenar por varios criterios
arrange(mtcars1, cyl, -mpg)

# summarise: hace un resumen por una función dada
mtcars1  %>%
  summarise(mean_hp = mean(hp), max_hp = max(hp))

# group_by: agrupa por datos
mtcars %>% 
  group_by(cyl) %>% 
  summarise(mean_hp = mean(hp))
# un group_by va seguido de un summarise

###########
# ggplot2
library(ggplot2)
mtcars1 %>% 
  filter(hp <= 150) %>% 
  mutate(am = as.factor(am)) %>% 
  ggplot(aes(x = am, y = mpg)) + geom_boxplot()




# 
install.packages("shiny", type="binary")
install.packages("plumber")
library(shiny)
