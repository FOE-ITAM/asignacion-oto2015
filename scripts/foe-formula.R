foe.data <- read.csv('~/Downloads/datos-FOE-M.csv',
                     head=T, row.names = 1)

model.k <- lm(PUNTOS ~ ., foe.data)
model <- lm(PUNTOS ~ . -1, foe.data)

# Análisis de los modelos
summary(model.k)
summary(model)

# Medimos la diferencia en predicción
model.k.pred <- as.matrix(predict(model.k, foe.data))
model.pred <- as.matrix(predict(model, foe.data))

model.k.diff <- foe.data$PUNTOS - model.k.pred
model.diff <- foe.data$PUNTOS - model.pred

norm(model.k.diff)
norm(model.diff)

foe.data$PRED <- model.k.pred
