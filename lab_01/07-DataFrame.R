# 1. Tạo dataframe
# Dataframe được tạo ra từ các vector có chung độ dài

column1 <- c(1:3)
column2 <- c("sa","suong","anh")
column3 <- c(T, T, F)

dataset1 <- data.frame(column1, column2, column3)

#Hiển thị ra console
dataset1
print(dataset1)

#view dữ liệu
View(dataset1)

#Tên của các cột
colnames(dataset1)
#Đổi tên cột 2
colnames(dataset1)[2] <- "Name"
#Đổi tên cột hàng loạt
colnames(dataset1) <- c("STT","Name","Check")
dataset1

#2. Thêm dòng mới cho dataframe
newRow <- c(8, "Sa", T)
dataset2 <- rbind(dataset1, newRow)

newRowDF <- data.frame(27, "Khun Thee", F)
names(newRowDF) <- c("STT", "Name", "Check")
dataset3 <- rbind(dataset2, newRowDF)
dataset3

#Thêm cột mới
newColumn <- c("a", "b", "c", "d", "f")
dataset4 <- cbind(dataset3, newColumn)
dataset4
#Cách 2
dataset4$newColumn2 <- c(1,2,3,4,5)

# dấu "$" là sự ngăn cách giữa dataframe và tên cột

#4. Truy xuất dữ liệu
#Truy xuất bảng ghi chỉ số
dataset4[3,2] # dòng 3, cột 2

#Truy xuất dữ liệu bằng chỉ số và tên cột
dataset4[3, "Check"]

#Truy xuất bằng tên cột
dataset4["Name"]
dataset4[,"Name"]
dataset4$Name


#5. Các hàm thường dùng
head(dataset4) # hiển thị vài dòng đầu
tail(dataset4) # hiển thị vài dòng cuối
str(dataset4) # hiển thị cấu trúc của dữ liệu
summary(dataset4)
#6. Thay đổi dữ liệu cột
dataset4$Check <- as.logical(dataset4$Check)
summary(dataset4)



######### Bài tập:
######### Bộ dữ liệu iris
data() #lấy ra toàn bộ dataset được buid trong R
iris

View(iris)
str(iris)
summary(iris)
head(iris)
tail(iris)


CO2
View(CO2)
str(CO2)
summary(CO2)
head(CO2)
tail(CO2)


data()


women
View(women)
str(women)
summary(women)
head(women)
tail(women)
