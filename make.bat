@echo off
"tool/vasmz80_psi-x.exe" -maxerrors=0 -Fbin -start=0 -o s1built.gg -L main.lst -Lall main.asm 2> errors.log
pause