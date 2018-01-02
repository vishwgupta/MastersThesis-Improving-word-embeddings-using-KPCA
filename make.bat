@echo off

IF EXIST "c:\program files (x86)\unixutils" SET UNXUTILS="c:\program files (x86)\unixutils"
IF EXIST d:\programme\unixutils SET UNXUTILS=d:\programme\unixutils

if "%1%" == "fast" goto fast

rem del thesis.bbl
pdflatex thesis
if errorlevel 1 goto ende
bibtex -min-crossrefs=99 thesis
%UNXUTILS%\usr\local\wbin\grep.exe -i "Warning" thesis.blg > NUL
if errorlevel 0 pause
pdflatex thesis
if errorlevel 1 goto ende
%UNXUTILS%\usr\local\wbin\grep.exe -i "Rerun" thesis.log
if errorlevel 1 goto ende
pdflatex thesis
if errorlevel 1 goto ende
%UNXUTILS%\usr\local\wbin\grep.exe -i "Rerun" thesis.log
if errorlevel 1 goto ende
:fast
pdflatex thesis

:ende

