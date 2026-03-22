# LIST TRONG R

# List là cấu trúc dữ liệu linh hoạt trong R
# Có thể chứa:
# - Nhiều kiểu dữ liệu khác nhau
# - Các đối tượng có độ dài khác nhau
# - Các cấu trúc phức tạp (vector, matrix, dataframe, thậm chí list khác)

# TẠO MỘT LIST ĐƠN GIẢN

student <- list(
  name = 'Tung',                 # Chuỗi ký tự
  age = 18,                      # Số nguyên
  grades = c(8.5, 9.0, 7.5),     # Vector số
  passed = TRUE                  # Giá trị logic
)

student   # Hiển thị toàn bộ list

# TRUY CẬP DỮ LIỆU TRONG LIST
# Cách 1: Dùng [ ] → trả về LIST CON (vẫn là kiểu list)
student[1]
class(student[1])

# Cách 2: Dùng [[ ]] → trả về GIÁ TRỊ bên trong phần tử
student[[1]]
class(student[[1]])

# Truy cập phần tử 1 và 3 trong vector grades
student[[3]][c(1,3)]

# Cách 3: Dùng $ → truy cập theo TÊN phần tử
student$grades

# THÊM PHẦN TỬ VÀO LIST
student$id <- '012345678'   # Thêm mã sinh viên
print(student)

# CẬP NHẬT GIÁ TRỊ TRONG LIST
student$grades <- c(10,10,10)  # Cập nhật điểm mới
student
