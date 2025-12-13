<div>

### Hướng dẫn chi tiết (theo từng hệ thống) để chuẩn bị môi trường và build YAFS từ các makefile có sẵn.

### Linux (Makefile_unix)

- **Phụ thuộc**: `g++`, thư viện `xerces-c`, `libc`, `pthread`. Các cờ
  biên dịch/lấy liên kết: `-std=c++11 -Wall -g1 -O2`, liên kết
  `-lxerces-c -lc -lpthread`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7g_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

- **Bước chuẩn bị** (ví dụ Debian/Ubuntu):

  1.  `sudo apt-get install build-essential libxerces-c-dev`

  2.  Tạo thư mục đầu ra nếu chưa có: `mkdir -p bin dep`

- **Build**: chạy `make -f Makefile_unix`. Kết quả nhị phân nằm ở
  `bin/yafs`.

- **Clean**:
  `make -f Makefile_unix clean`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7h_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

### macOS (Makefile_macosx)

- **Phụ thuộc**: `pkg-config`, `xerces-c`, `libcurl`, `g++`,
  `CoreServices`. Makefile đã tích hợp lấy cờ qua
  `pkg-config`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7i_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

- **Bước chuẩn bị**:

  1.  Cài Homebrew: <span class="decorated-link cursor-pointer"
      rel="noopener">https://brew.sh<span class="ms-0.5 inline-block align-middle leading-none"
      aria-hidden="true"><img
      src="data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iYmxvY2sgaC1bMC43NWVtXSB3LVswLjc1ZW1dIHN0cm9rZS1jdXJyZW50IHN0cm9rZS1bMC43NV0iIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZmlsbD0iY3VycmVudENvbG9yIiB2aWV3Ym94PSIwIDAgMjAgMjAiIGhlaWdodD0iMjAiIHdpZHRoPSIyMCI+PHBhdGggZD0iTTE0LjMzNDkgMTMuMzMwMVY2LjYwNjQ1TDUuNDcwNjUgMTUuNDcwN0M1LjIxMDk1IDE1LjczMDQgNC43ODg5NSAxNS43MzA0IDQuNTI5MjUgMTUuNDcwN0M0LjI2OTU1IDE1LjIxMSA0LjI2OTU1IDE0Ljc4OSA0LjUyOTI1IDE0LjUyOTNMMTMuMzkzNSA1LjY2NTA0SDYuNjYwMTFDNi4yOTI4NCA1LjY2NTA0IDUuOTk1MDcgNS4zNjcyNyA1Ljk5NTA3IDVDNS45OTUwNyA0LjYzMjczIDYuMjkyODQgNC4zMzQ5NiA2LjY2MDExIDQuMzM0OTZIMTQuOTk5OUwxNS4xMzM3IDQuMzQ4NjNDMTUuNDM2OSA0LjQxMDU3IDE1LjY2NSA0LjY3ODU3IDE1LjY2NSA1VjEzLjMzMDFDMTUuNjY0OSAxMy42OTczIDE1LjM2NzIgMTMuOTk1MSAxNC45OTk5IDEzLjk5NTFDMTQuNjMyNyAxMy45OTUxIDE0LjMzNSAxMy42OTczIDE0LjMzNDkgMTMuMzMwMVoiIC8+PC9zdmc+"
      class="block h-[0.75em] w-[0.75em] stroke-current stroke-[0.75]" /></span></span>

  2.  `brew install pkg-config xerces-c libcurl`

  3.  Tạo thư mục `bin dep` nếu cần: `mkdir -p bin dep`

- **Build**: `make -f Makefile_macosx`. Nhị phân sẽ là `bin/yafs`.

- **Clean**:
  `make -f Makefile_macosx clean`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7j_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

### Windows MinGW (Makefile_mingw)

- **Phụ thuộc**: MinGW `g++`, thư viện `xerces-c`. Cờ biên dịch:
  `-Wall -g1 -O2 -mno-ms-bitfields` (workaround cho bug GCC), liên kết
  `-lxerces-c`. Định nghĩa
  `WIN_SYSTEM`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7k_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

- **Bước chuẩn bị**:

  1.  Cài MinGW-w64 (bao gồm `g++`), thêm vào PATH.

  2.  Cài `xerces-c` bản dành cho MinGW và đảm bảo lib/include trong
      PATH hoặc thông số linker mặc định.

  3.  Tạo thư mục `bin dep`.

- **Build**: mở “MSYS2 MinGW” shell rồi chạy `make -f Makefile_mingw`.
  Nhị phân tạo ra `bin/yafs.exe`.

- **Clean**:
  `make -f Makefile_mingw clean`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7l_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

### Windows MSVC (Makefile_msvc)

- **Phụ thuộc**: MSVC `cl`/`link`, thư viện `xerces-c` (đường dẫn hiện
  hard-code tới `D:\Documents\home\librarys\xerces-c-3.2.3`). Các cờ:
  `/EHsc /nologo /W4 /DWIN_SYSTEM` và disable một số warning; liên kết
  `xerces-c_3.lib`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7m_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

- **Bước chuẩn bị**:

  1.  Mở “x64 Native Tools Command Prompt for VS”.

  2.  Cài Xerces-C cho MSVC; chỉnh lại đường dẫn `CPPFLAGS` và
      `/LIBPATH` trong `Makefile_msvc` cho khớp vị trí cài đặt của bạn.

  3.  Đảm bảo có thư mục `bin`.

- **Build**: `nmake /f Makefile_msvc`. Nhị phân sẽ ở `bin\yafs.exe`.

- **Clean**:
  `nmake /f Makefile_msvc clean`.<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7n_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

### Ghi chú chung

- Danh sách nguồn nằm trong file `sources`; makefile sẽ tự động dùng để
  biên dịch (không cần chỉnh thủ
  công).<span class="bg-token-bg-secondary text-token-text-secondary mx-0.5 inline-flex aspect-square size-min cursor-default items-center justify-center rounded-full p-1"
  aria-controls="radix-_r_7o_" aria-expanded="false"
  aria-haspopup="dialog" type="button"></span>

- Nếu gặp lỗi thiếu header hoặc thư viện, kiểm tra biến môi trường
  `INCLUDE`, `LIB`, `PKG_CONFIG_PATH` (tùy hệ).

- Luôn tạo sẵn `bin` và `dep` để tránh lỗi khi make tạo file `.o/.d`.

</div>
