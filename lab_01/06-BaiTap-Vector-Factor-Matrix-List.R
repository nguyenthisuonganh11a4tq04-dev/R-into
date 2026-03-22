# ### BÀI TẬP ###
# 
# 1. Tạo một factor với các giá trị "a", "b", "c" có độ dài 7. 
f1 <- factor(rep(c("a","b","c"), length.out = 7))
f1
# Gán nhãn (labels) cho các levels
levels(f1) <- c("Letter A", "Letter B", "Letter C")
# Xem levels sau khi đổi nhãn
levels(f1)
# Tóm tắt (đếm tần suất mỗi mức)
summary(f1)


###### 
# 2. Tạo một vector số có giá trị từ 1-4 và độ dài 10. 
v <- sample(1:4, size = 10, replace = TRUE)
v
# Tóm tắt + kiểm tra kiểu
summary(v)
class(v)
# Tạo ordered factor từ vector v
# levels 1 < 2 < 3 < 4 tương ứng low < medium < high < very high
f2 <- factor(v,
             levels = c(1,2,3,4),
             labels = c("low","medium","high","very high"),
             ordered = TRUE)
f2

# Tóm tắt factor
summary(f2)
# So sánh với vector ban đầu (cùng dữ liệu nhưng dạng phân loại)
v
f2


######
# 3. Tạo một ma trận có 5 hàng và 2 cột, điền số 0. 
table <- matrix(0, nrow = 5, ncol = 2)
table
class(table)  # matrix (bên trong vẫn là numeric)

# a) Điền cột 1 với giá trị 3
table[, 1] <- 3
table

# b) Đặt phần tử thứ 3 của cột 2 thành 20
table[3, 2] <- 20
table

# c) In các giá trị cột 2 + kiểm tra kiểu
col2 <- table[, 2]
col2
class(col2)

# d) Thay đổi phần tử thứ 4 của cột 2 thành "twelve". 
table[4, 2] <- "twelve"
table

# In lại cột 2 và kiểm tra kiểu
col2_new <- table[, 2]
col2_new
class(col2_new)

# e) Kiểu giá trị của cột 1 là gì? Tại sao?
class(table[, 1])
# Cột 1 cũng thành character, vì Matrix không được chứa lẫn số và chữ → R chuyển hết về kiểu “mạnh” hơn là character.


#####
# 4. Tạo bốn biến với các kiểu khác nhau (vectors, matrices, 
#                                           single values).
# Tạo một list từ các đối tượng này đặt tên "myList".
# a) Lấy phần tử thứ nhất của list và thêm một giá trị vào đó.
# Lưu thay đổi để nó hiển thị trong list.
# b) Thêm phần tử mới vào cuối list - tạo thành vector 6 phần tử 
# với bất kỳ kiểu nào.
# c) In phần tử thứ 4 của đối tượng cuối cùng trong list.
# d) Thay đổi giá trị của phần tử thứ 5 của đối tượng cuối cùng 
# thành NA.

# Tạo các biến khác nhau
vec1 <- c("a", "b", "c")
mat1 <-matrix(1:6, nrow=2)
single_val <-100
vec2 <- c(1,2,3)

# Tạo list
myList <- list(vec1, mat1, single_val, vec2)

# a
myList[[1]]<-c(myList[[1]], c("d"))

#b
length(myList)

myList[[length(myList)+1]] <- c(5,6,7,8,9)

#c
myList[[length(myList)]][4]

#d
myList[[length(myList)]][5] <-NA