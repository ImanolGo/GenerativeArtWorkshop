-------------------------------------------------------------------------------
CMYK

A few examples that demonstrate the use of a slightly modified 
Processing PGraphicsPDF class which permits, among a few other things, 
to set colors in CMYK space.
This class was used used at a Resonate.io workshop in Belgrade, 2013

-------------------------------------------------------------------------------
Purpose

The actual Processing PDF library permits to create PDF documents 
with the familiar Processing graphics API. 
The library includes the iText Open Source Library for Java but does not 
expose all of it’s functionalities. 
The purpose of the custom PDF class is to give access to some useful functions
(by breaking the seamless integration in Processing).
The library is now just a visible Processing class which allows eventual 
implementation of further functions.
Use at own risk.

-------------------------------------------------------------------------------
Examples

1. cmyk
This example creates a four pages pdf document with CMYK and spot colors; 
overprint is demonstrated on page two. To preview the overprint you 
may need to print the document or to open it with software that allows overprint 
preview. Gradients are on page three and four.
See comments in code for more details.

2. preview
An example which shows how to preview the graphics in rgb color space (monitor) 
before creating the CMYK output (pdf).

3. template
This example loads an existing pdf file and uses it as a template to create 
a series of business cards, each with a slightly different form. 
The output file is ready for (offset) print.

-------------------------------------------------------------------------------
Author

Andreas Gysin
@andreasgysin
http://ertdfgcvb.com/CMYK
http://github.com/ertdfgcvb/CMYK	

-------------------------------------------------------------------------------
Copyright (c) 2013 Andreas Gysin

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published 
by the Free Software Foundation, either version 3 of the License, 
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.
If not, see <http://www.gnu.org/licenses/>.