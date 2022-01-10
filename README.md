# Barcode Checker
This code checks a string of numbers to determine if the barcode is a legitimate UPC barcode. 

Calculations
---------
with d to denote digit, all legitimate UPC barcodes are 11-digit numbers that follow this formula:

(d1+d3+d5+d7+d9+d11)*3+(d2+d4+d6+d8+d10)%10

Development Environment
---------
Keil µvision IDE was used for this project.
