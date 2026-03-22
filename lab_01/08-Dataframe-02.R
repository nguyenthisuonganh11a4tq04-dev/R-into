#1. Các thao tác nâng cao (DataWrangling)
# Tạo dataframe
set1 <- data.frame(IdClient = c(1:6, 8), Product = c(rep("Thit Kho", 4), rep("Ca Kho",3)))
set2 <- data.frame(IdClient = c(1,2,5,9), Region = c(rep("TP. HCM", 3), "Dong Nai"))

set1
set2

#gộp bảng dữ liệu(merging/joins)
##a. INNER JOIN (chỉ lấy phần chug có cả 2 set)
set3 <- merge(set1, set2, by="IdClient")
set3
##b. OUTER JOIN (lấy all, cái nào thiếu thì điền NA)
set4<-merge(set1,set2, by="IdClient", all= TRUE)
set4
##c. LEFT JOIN (giữ nguyên bảng trái set1, tìm bảng phải điền vào)
set5<-merge(set1,set2, by="IdClient", all.x = TRUE) #x là trái
set5
##d. RIGHT JOIN (giữ nguyên bảng phải set2, tìm bảng trái điền vào)
set6<-merge(set1,set2, by="IdClient", all.y = TRUE)
set6


set1 <- data.frame(IdClient = c(1:6, 8), Product = c(rep("Thit Kho", 4), rep("Ca Kho",3)))
set2 <- data.frame(IdClient = c(1,2,5,9), Region = c(rep("TP. HCM", 3), "Dong Nai"))

set1
set2

#gộp bảng dữ liệu(merging/joins)
##a. INNER JOIN (chỉ lấy phần chug có cả 2 set)
set3 <- merge(set1, set2, by="IdClient")
set3
##b. OUTER JOIN (lấy all, cái nào thiếu thì điền NA)
set4<-merge(set1,set2, by="IdClient", all= TRUE)
set4
##c. LEFT JOIN (giữ nguyên bảng trái set1, tìm bảng phải điền vào)
set5<-merge(set1,set2, by="IdClient", all.x = TRUE) #x là trái
set5
##d. RIGHT JOIN (giữ nguyên bảng phải set2, tìm bảng trái điền vào)
set6<-merge(set1,set2, by="IdClient", all.y = TRUE)
set6

#Sắp xếp dữ liệu(sort/order)
sort(set1$IdClient)
sort(set1$IdClient, decreasing = TRUE)
order(set1$IdClient, decreasing = TRUE)
# Sử dụng hàm order để lấy chỉ số index đã sắp xếp sau khi áp dụng cho dataframe
set1[order(set1$IdClient, decreasing = TRUE),]

#Lọc dữ liệu (filtering)
set4[set4$Region=="TP.HCM" & !is.na(set4$Region),]
set4[set4$Product=="Ca Kho" & !is.na(set4$Product),]
set4[set4$Product=="Ca Kho" & !is.na(set4$Product) & set4$IdClient>=6]

# làm việc với factor
str(set4)
set4$Produce <- as.factor(set4$Product)
set4$Region <- as.factor(set4$Region)
summary(set4)

#2. Làm sạch dữ liệu (Datacleaning)


#phát hiện missing value
is.na(set4) # fales thì không NA còn true thì NA
sum(is.na(set4)) # đếm các dòng thiếu

#comlete.cases => dòng đã có đầy đủ dữ liệu
set4[complete.cases(set4),]
#lọc ra các dòng không có NA
set4[complete.cases(set4),]
#xóa đi các dòng bị NA
set4_clean <- na.omit(set4)
set4_clean
#Điền thiếu
set4$Region <- as.character(set4$Region) # ép về kiểu chữ mới điền giá trị thiếu được 
set4[is.na(set4$Region),"Region"]<-"VietNam" #is.na(set4$Region) là cắt dòng, Region là tên cột











