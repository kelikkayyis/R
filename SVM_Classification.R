# Set working directoris
setwd("~/_R_Stats/Mastering R - SA/PR3")

# Import Data
datafh <- read.csv("fetal_health.csv")

# Explorasi Data
dim(datafh)
str(datafh)
names(datafh)
summary(datafh)
colSums(is.na(datafh))

# Memisahkan variabel x dan variabel y
x <- datafh[,-22]
names(x)
y <- datafh[22]
names(y)

# Merubah format kolom fetal_health menjadi factor agak terbaca sebagai labels
y$fetal_health <- as.factor(y$fetal_health)
str(y)

# Membuat model SVM Klasifikasi
library(e1071)
model_fh <- svm(fetal_health~., data = datafh, type = "C-classification")
summary(model_fh)

# Membuat Prediksi dengan data awal
pred_fh <- predict(model_fh,x)
summary(pred_fh)

# Membuat Confution Matrix
library(caret)
confusionMatrix(pred_fh,y$fetal_health)
