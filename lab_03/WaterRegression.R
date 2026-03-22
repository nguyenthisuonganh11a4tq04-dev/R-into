# BÀI THỰC HÀNH: PHÂN TÍCH CHẤT LƯỢNG NƯỚC BẰNG HỒI QUY LOGISTIC
# ==========================================================

# TÓM TẮT BÀI TOÁN:
# Bài thực hành này sử dụng bộ dữ liệu water_potability để dự đoán liệu một mẫu nước có uống được hay không
# dựa trên các chỉ số hóa học và vật lý khác nhau. Chúng ta sẽ sử dụng mô hình hồi quy logistic để
# xây dựng bộ phân loại nhị phân, đánh giá hiệu suất của mô hình và trực quan hóa kết quả.
# Biến mục tiêu: Potability (0 = không uống được, 1 = uống được)
install.packages(c("ggplot2", "corrplot", "pROC"))
# =========================================
# Logistic Regression + Confusion Matrix 2x2
# Dataset: water_potability
# =========================================

# Thư viện cần thiết
if(!require(caret)) install.packages("caret")
if(!require(pROC)) install.packages("pROC")
if(!require(ggplot2)) install.packages("ggplot2")

library(caret)
library(pROC)
library(ggplot2)

#  Đọc dữ liệu
df <- read.csv("C:/Users/user/OneDrive/Desktop/PTVTQHD/data/water_potability.csv")

#  Chuyển target thành factor
df$Potability <- as.factor(df$Potability)
levels(df$Potability) <- c("Not Drinkable", "Drinkable")

#  Xử lý dữ liệu thiếu
df$ph[is.na(df$ph)] <- mean(df$ph, na.rm = TRUE)
df$Sulfate[is.na(df$Sulfate)] <- mean(df$Sulfate, na.rm = TRUE)
df$Trihalomethanes[is.na(df$Trihalomethanes)] <- mean(df$Trihalomethanes, na.rm = TRUE)

#  Chia train/test
set.seed(42)
train_indices <- createDataPartition(df$Potability, p = 0.7, list = FALSE)
train_data <- df[train_indices, ]
test_data  <- df[-train_indices, ]

#  Xây dựng mô hình Logistic Regression
model <- glm(Potability ~ ., data = train_data, family = binomial(link = "logit"))

#  Dự đoán trên tập test
probabilities <- predict(model, newdata = test_data, type = "response")
predicted_class <- ifelse(probabilities > 0.5, "Drinkable", "Not Drinkable")

# Fix levels để tránh lỗi
test_data$Potability <- factor(test_data$Potability, levels = c("Not Drinkable", "Drinkable"))
predicted_class <- factor(predicted_class, levels = levels(test_data$Potability))

# Trực quan hóa

library(ggplot2)
library(corrplot)

# Xóa NA
data <- na.omit(data)

# Confusion matrix (đảm bảo có)
cm <- table(Predicted = pred, Actual = test_data$Potability)
cm_df <- as.data.frame(cm)

# 1. Phân bố Potability
ggplot(water_potability, aes(x = factor(Potability))) +
  geom_bar(fill = "steelblue")

# 2. Histogram pH
ggplot(water_potability, aes(x = ph)) +
  geom_histogram(bins = 30, fill = "orange", color = "black")

# 3. Boxplot
ggplot(water_potability, aes(x = factor(Potability), y = ph)) +
  geom_boxplot(fill = "lightblue")

# 4. Correlation
cor_matrix <- cor(water_potability, use = "complete.obs")
corrplot(cor_matrix, method = "color")

# 5. Heatmap confusion matrix
ggplot(cm_df, aes(x = Actual, y = Predicted, fill = Freq)) +
  geom_tile() +
  geom_text(aes(label = Freq))

install.packages("caret")
library(caret)
# Confusion Matrix
conf_matrix <- confusionMatrix(predicted_class, test_data$Potability)
print(conf_matrix)

# Vẽ Confusion Matrix 2x2
cm_df <- as.data.frame(conf_matrix$table)
colnames(cm_df) <- c("Prediction", "Reference", "Freq")

ggplot(cm_df, aes(x = Reference, y = Prediction, fill = Freq)) +
  geom_tile(color = "black") +
  geom_text(aes(label = Freq), color = "white", size = 6) +
  scale_fill_gradient(low = "blue", high = "steelblue") +
  labs(title = "Confusion Matrix 2x2 - Water Potability",
       x = "Actual",
       y = "Predicted") +
  theme_minimal(base_size = 14)

