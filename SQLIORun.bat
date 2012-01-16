:: This is a base line SQLIO test batch file
:: it runs random and sequential 1k to 1024k read and write 1 to 128 queue depth
:: You should do at a minimum 
@ECHO OFF

SET paramfile=%1
SET runtime=%2
SET cooloff=%3
SET outfile=%4
SET desc=%5

ECHO ComputerName: %COMPUTERNAME% > %OUTFILE%
ECHO Date: %DATE% %TIME% >> %OUTFILE%
ECHO Runtime: %RUNTIME% >> %OUTFILE%
ECHO Cool Off: %COOLOFF% >> %OUTFILE%
ECHO Parameters File: %PARAMFILE% >> %OUTFILE%
ECHO Description: %DESC% >> %OUTFILE%
ECHO Test Start >> %OUTFILE%

:: ranodm write 1k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 2k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 4k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 8k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 16k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 32k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 64k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 128k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 256k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: ranodm write 1024k 
sqlio -kW -s%RUNTIME% -frandom -o1 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o2 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o4 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o8 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o16 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o32 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o64 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -frandom -o128 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 1k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 2k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 4k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 8k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 16k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 32k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 64k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 128k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 256k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential write 1024k 
sqlio -kW -s%RUNTIME% -fsequential -o1 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o2 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o4 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o8 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o16 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o32 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o64 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kW -s%RUNTIME% -fsequential -o128 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 1k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 2k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 4k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 8k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 16k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 32k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 64k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 128k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 256k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: random read 1024k 
sqlio -kR -s%RUNTIME% -frandom -o1 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o2 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o4 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o8 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o16 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o32 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o64 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -frandom -o128 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 1k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b1 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 2k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b2 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 4k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b4 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 8k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b8 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 16k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b16 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 32k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b32 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 64k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b64 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 128k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b128 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 256k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b256 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%

:: sequential read 1024k 
sqlio -kR -s%RUNTIME% -fsequential -o1 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o2 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o4 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o8 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o16 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o32 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o64 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
sqlio -kR -s%RUNTIME% -fsequential -o128 -b1024 -LS -BN -F%PARAMFILE% >> %OUTFILE%
timeout /T %COOLOFF%
