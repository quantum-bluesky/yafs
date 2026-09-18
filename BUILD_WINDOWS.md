# Build YAFS độc lập trên Windows

Repo này chứa đầy đủ mã nguồn YAFS, script build, cấu hình CMake, bài kiểm tra XML
và mã nguồn Xerces-C++ 3.3.0 tại `third_party/xerces-c-3.3.0`.
Không cần checkout CopyUSB hay lấy file từ thư mục cha; không tự tải qua mạng.

## Yêu cầu máy build

Windows x64; Visual Studio 2022 hoặc Build Tools 2022 với **Desktop development
with C++**, Windows SDK, **C++ CMake tools for Windows**. Có thể dùng CMake 3.15+
trên PATH nếu VS chưa có CMake. Script tự tìm VS bằng vswhere.

## Build

Tại gốc repo YAFS:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\Build-Yafs.ps1 -Version 1.2.0
# Hoặc chọn x64:
.\Build-Yafs.ps1 -Version 1.2.0 -Architecture x64
```

Có thể bấm `Build-Yafs.cmd` (version mặc định 1.0.0), hoặc chạy
`Build-Yafs.cmd -Version 1.2.0`. Script chỉ build YAFS; không đóng gói app khác.
Tăng version hoặc dùng `-OutputDirectory` mới nếu đầu ra đã tồn tại.

Kết quả:

- `dist/<version>-<architecture>/`: EXE, XSD, license, NOTICE, `build-info.json`,
  log kiểm tra khởi động và `source.zip`.
- `dist/YAFS-<version>-<architecture>.zip` và SHA-256: gói YAFS độc lập.
- `source.zip` giữ đúng cấu trúc gốc repo: giải nén rồi chạy `Build-Yafs.ps1`
  ngay trong đó để build lại, không cần di chuyển thư mục nguồn.
- `dist/build-x86` hoặc `dist/build-x64`: cache compiler, không đưa vào Git.

YAFS và Xerces cùng dùng Release `/MT`; EXE không cần DLL Xerces hay VC++ runtime
rời, chỉ dùng DLL hệ thống Windows. Mặc định x86 dành cho Windows 10 x86 và Windows
10/11 x64. Chọn x64 nếu chỉ dùng trên Windows x64. ARM64 và Windows cũ chưa xác nhận.
Quyền thao tác FAT trực tiếp và phạm vi FAT16/FAT32 vẫn theo chức năng của YAFS.

## Đưa bản đã build vào CopyUSB

Đây là một bước riêng, thực hiện tại repo CopyUSB sau khi build YAFS hoàn tất:

```powershell
.\Build-CopyUSB.ps1 -Version 1.1.1 -YafsDirectory D:\Source\yafs\dist\1.2.0-x86
```

CopyUSB chỉ chép bản phát hành đã có, không gọi compiler và không cần Visual Studio.
Một bản YAFS có thể được tái sử dụng cho nhiều phiên bản CopyUSB.

## Kiểm tra và tái lập

Script kiểm tra lỗi compiler/linker, DLL phụ thuộc của EXE, chạy `yafs -h` với PATH
chỉ còn Windows, và parse/chuyển mã XML UTF-8 tiếng Việt. Không chạm thiết bị USB.
`build-info.json` ghi version, kiến trúc, kiểu runtime và SHA-256 của EXE.
Đây không thay thế việc thử trên máy Windows sạch hoặc USB thử nghiệm.

Nếu đổi compiler hay nguồn, dùng `-OutputDirectory` mới để tránh cache cũ. Nếu bị
ngắt sau khi tạo thư mục release, dùng output mới hoặc kiểm tra rồi đổi tên thư mục
release chưa hoàn tất trước khi chạy lại. Giữ `source.zip` và license cùng binary.
