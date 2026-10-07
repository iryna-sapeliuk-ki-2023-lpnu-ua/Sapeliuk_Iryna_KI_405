@echo off
cargo build --release
if errorlevel 1 exit /b 1

cargo test
if errorlevel 1 exit /b 1

echo Executable target\release\hello.exe was created successfully.
