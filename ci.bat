@echo off
cargo build --release
if errorlevel 1 exit /b %errorlevel%

cargo test
if errorlevel 1 exit /b %errorlevel%

if not exist "build\release\hello.exe" (
    echo Expected executable not found: build\release\hello.exe 1>&2
    exit /b 1
)
