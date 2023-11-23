@ECHO OFF

SET source=%1
SET filename=%~n1
SET output="%~dp1%filename%-compressed.pdf"

ECHO --- Ghost Compressor ---
ECHO Source: %source%
ECHO Output: %output%
ECHO/

@ECHO ON
gswin64c -dPDFSETTINGS=/ebook -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUITE -dBATCH -sOutputFile=%output% %source%

PAUSE
