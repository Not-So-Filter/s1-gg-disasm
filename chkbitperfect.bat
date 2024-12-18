@echo off
call build_tools/md5.bat s1built.gg md5
choice /c:01 /n /m "Which revision?"
if errorlevel==2 goto revision1
:revision0
if "%md5%" equ "8a95b36139206a5ba13a38bb626aee25" (
      echo MD5 identical!
) else (
      echo MD5 does not match with r0.
)
pause
exit
:revision1
if "%md5%" equ "b1de7027824c434ce8de59782705f5c9" (
      echo MD5 identical!
) else (
      echo MD5 does not match with r1.
)
pause
exit