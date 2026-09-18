# Third-party source

`xerces-c-3.3.0/` contains the Xerces-C++ 3.3.0 source tree copied from the existing
local source used for the YAFS build. Generated build/cache directories were
excluded; source files were copied without modification. No network download was
performed. See the included `LICENSE`, `NOTICE`, `README` and `configure.ac`.

This source is vendored directly, not a submodule or a prebuilt DLL. Keep it in
Git so a checkout of the YAFS repository can build offline after the compiler,
Windows SDK and CMake have been installed. The Windows build statically links
Xerces with networking disabled and the Windows transcoder/in-memory messages.
