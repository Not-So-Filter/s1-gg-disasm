@echo off
call tool/md5 s1built.gg md5
if "%md5%" equ "8a95b36139206a5ba13a38bb626aee25" (
      echo MD5 identical!
) else (
      echo MD5 does not match with r0.
)
pause