# MATRIX TRONG R
# Matrix (ma trận) là cấu trúc dữ liệu 2 chiều trong R
# Chứa các phần tử cùng kiểu dữ liệu (numeric, character, logical)
# Các phần tử được sắp xếp theo hàng (rows) và cột (columns)

# TẠO MATRIX
# Cách 1: Chỉ định số hàng và số cột
mat1 <- matrix(1:6, nrow = 2, ncol = 3)
mat1

# Cách 2: Điền dữ liệu theo hàng (byrow = TRUE)
mat2 <- matrix(1:6, ncol = 3, byrow = TRUE)
mat2

# Tạo matrix rỗng (toàn NA)
empty_mat <- matrix(NA, nrow = 3, ncol = 5)
empty_mat

# Tạo matrix toàn số 0
zero_mat <- matrix(0, nrow = 3, ncol = 3)
zero_mat

# VÍ DỤ: BẢNG ĐIỂM SINH VIÊN
grades <- matrix(
  c(
    8.5, 9, 7.5, 8.8,
    9.2, 7.8, 8.5, 9.0,
    7.6, 8.2, 8.9, 8.5
  ),
  nrow = 3, #hàng
  ncol = 4, #cột
  byrow = TRUE
)
grades

# Gán tên hàng và cột
rownames(grades) <- c("Le Nhat Tung", "TITV", "Le Thi C")
colnames(grades) <- c("Toán", "Văn", "Tin", "R")
grades

# VÍ DỤ: DỮ LIỆU BÁN HÀNG
sales <- matrix(
  c(150, 200, 180,
    120, 160, 140,
    180, 220, 200),
  nrow = 3,
  ncol = 3,
  byrow = TRUE,
  dimnames = list(
    c("SP1", "SP2", "SP3"),   # Tên hàng (sản phẩm)
    c("T1", "T2", "T3")      # Tên cột (tháng)
  )
)
sales

# TRUY XUẤT PHẦN TỬ

sales[1, 2]     # Phần tử hàng 1, cột 2
sales[1, ]      # all Hàng 1
sales[, 2]      # all Cột 2
sales[1:2, ]    # Hai hàng đầu
sales[, 2:3]    # Hai cột cuối

# THỐNG KÊ TRÊN MATRIX
rowSums(sales)    # Tổng theo hàng
colSums(sales)    # Tổng theo cột
rowMeans(sales)   # Trung bình theo hàng
colMeans(sales)   # Trung bình theo cột

# Vẽ biểu đồ tổng doanh số theo sản phẩm
barplot(rowSums(sales))

# KHI NÀO NÊN DÙNG MATRIX?
# - Dữ liệu có cấu trúc bảng đều đặn
# - Cần thực hiện phép toán ma trận
# - Làm việc với dữ liệu khoa học
# - Phân tích thống kê đa biến

# LỢI ÍCH CỦA MATRIX
# - Tổ chức dữ liệu hiệu quả
# - Dễ tính toán trên toàn bộ dữ liệu
# - Tiết kiệm bộ nhớ
# - Phù hợp cho thống kê và đại số tuyến tính
