// This skecth generates a two sided PDF document 
// in CMYK color mode with some extra spot colors.
// A font from the font library will be used for text output.

final PVector MARGIN = new PVector(mm(20), mm(30));
final PVector GRID   = new PVector(mm(30), mm(30));
final PVector GUTTER = new PVector(mm(7), mm(7));

void setup() {
  // Create an A4 (210 x 297 mm) document.
  // For precise document size creation it’s possible to use float values for witdh and height
  // Watch out for PDF instances which are cast as PGraphics: println(((PGraphics) pdf).width));
  // Please note that the pdf library needs an absolute path  
  //PDF pdf = new PDF(this, mm(210), mm(297), sketchPath("cmyk.pdf"));
  PDF pdf = new PDF(this, mm(210), mm(297), sketchPath(System.currentTimeMillis() + ".pdf"));  
  // prints a list of all available (system) fonts
  // println(pdf.listFonts());
  // eventually substitute with a font present in your library:
  pdf.textFont(createFont("AkzidenzGroteskBE-Bold", 11));

  // -----------------------------------------------------------------------------------
  // Page 1, Section 1.
  pdf.pushMatrix();
  section(0, "1.", "C, M, Y, K", pdf);
  pdf.noStroke();

  pdf.fillCMYK(1, 0, 0, 0);
  pdf.rect(0, 0, GRID.x, GRID.y);

  pdf.translate(GRID.x + GUTTER.x, 0);
  pdf.fillCMYK(0, 1, 0, 0);
  pdf.rect(0, 0, GRID.x, GRID.y);

  pdf.translate(GRID.x + GUTTER.x, 0);
  pdf.fillCMYK(0, 0, 1, 0);
  pdf.rect(0, 0, GRID.x, GRID.y);

  pdf.translate(GRID.x + GUTTER.x, 0);
  pdf.fillCMYK(0, 0, 0, 1);
  pdf.rect(0, 0, GRID.x, GRID.x);

  pdf.popMatrix();

  // Page 1, Section 2.
  // For black colors it's possible to use K only
  pdf.pushMatrix();
  section(2, "2.", "K\nat 5—20%", pdf);
  for (int i=0; i<4; i++) {
    pdf.fillK(i * 0.05 + 0.05);
    pdf.rect((GRID.x + GUTTER.x) * i, 0, GRID.x, GRID.y);
  }
  pdf.popMatrix();

  // Page 1, Section 3.
  // A few spot colors, in this case Pantone Process C
  // The CMYK quantities have only preview purposes
  pdf.pushMatrix();
  section(4, "3.", "A few Pantone \nProcess C \nspot colors", pdf);
  for (int i=0; i<8; i++) {
    pdf.fillK(0.05);
    if (i == 0) pdf.fillSpot("PANTONE 193 C", 1, 0.16, 1.0, 0.77, 0.05);
    else if (i == 1) pdf.fillSpot("PANTONE 209 C", 1, 0.38, 0.92, 0.58, 0.37); 
    else if (i == 2) pdf.fillSpot("PANTONE 7548 C", 1, 0, 0.23, 1.0, 0); 
    else if (i == 3) pdf.fillSpot("PANTONE CoolGray 1 C", 1, 0.13, 0.11, 0.12, 0);
    //skip 4 
    else if (i == 5) pdf.fillSpot("PANTONE 5753 C", 0.8, 0.59, 0.43, 0.89, 0.28); // the second argument is the amount 
    else if (i == 6) pdf.fillSpot("PANTONE 653 C", 1, 0.87, 0.64, 0.18, 0.3);
    else if (i == 7) pdf.fillSpot("PANTONE 655 C", 1, 1, 0.9, 0.37, 0.37);
    if (i != 4) {
      float rx = (GRID.x + GUTTER.x) * (i % 4);
      float ry = (GRID.x + GUTTER.x) * (i / 4);
      pdf.rect(rx, ry, GRID.x, GRID.y);
    }
  }
  pdf.popMatrix();

  // -----------------------------------------------------------------------------------
  // Let's add a second page
  pdf.nextPage();

  // It is possible to enable or disable overprint.  
  // To see the result of this page you may need to actually print the document 
  // or open it with a program that previews overpint.
  // Page 2, Section 4.
  // Overprint disabled  
  pdf.pushMatrix();   
  section(0, "4.", "Left:\nwithout\noverprint\n\nRight:\nwith\noverprint\n\nPrint out \nto see \nthe difference", pdf);

  float d = GRID.x / 4;
  for (int i=0; i<2; i++) {
    if (i == 0) pdf.overPrint(false); else pdf.overPrint(true);  

    pdf.pushMatrix();
    pdf.translate((GRID.x + GUTTER.x) * 2 * i, 0);    
    pdf.fillCMYK(1, 0, 0, 0);
    pdf.rect(0, 0, GRID.x, GRID.y);
    pdf.fillCMYK(0, 1, 0, 0);
    pdf.rect(d, d, GRID.x, GRID.y);

    pdf.translate(0, (GRID.y + GUTTER.y)*2);
    pdf.fillCMYK(0, 1f, 0, 0);
    pdf.rect(d, d, GRID.x, GRID.y);
    pdf.fillCMYK(1f, 0, 0, 0);
    pdf.rect(0, 0, GRID.x, GRID.y);

    pdf.translate(0, (GRID.y + GUTTER.y)*2);
    pdf.fillCMYK(1f, 0, 0, 0);
    pdf.rect(0, 0, GRID.x, GRID.y);
    pdf.fillCMYK(0, 1f, 0, 0);
    pdf.rect(d, d, GRID.x, GRID.y);
    pdf.fillCMYK(0, 0, 1f, 0);
    pdf.rect(d*2, d*2, GRID.x, GRID.y);
    pdf.fillCMYK(0, 0, 0, 1f);
    pdf.rect(d*3, d*3, GRID.x, GRID.y);

    pdf.popMatrix();
  }
  pdf.popMatrix();


  // -----------------------------------------------------------------------------------
  // And a third page about gradients.
  // Please note that the matrix transforms don't affect the gradient fill.
  pdf.nextPage();
  pdf.pushMatrix();   
  section(0, "5.", "Axial\ngradients", pdf);

  // Absolute coords to define the axial gradient:
  float x0 = 220;
  float y0 = 200;
  float x1 = 480;
  float y1 = 300;
  pdf.axialGradient(x0, y0, x1, y1, new CMYKColor(1f, 0, 0, 0), new CMYKColor(0, 1f, 0, 0));
  pdf.noStroke();
  pdf.rect(0, 0, (GRID.x + GUTTER.x)*4 - GUTTER.x, (GRID.y + GUTTER.y)*4 - GUTTER.y);

  // Note that the fill is still set:
  pdf.strokeK(1.0);
  pdf.strokeWeight(1);
  pdf.rect((GRID.x + GUTTER.x)*1, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*2, GRID.x, GRID.y);

  pdf.popMatrix();  
  // Markers to visualize the graidient parameters:
  marker(x0, y0, 10, pdf);
  marker(x1, y1, 10, pdf);

  pdf.pushMatrix();   
  section(4, "6.", "More axial\nexamples", pdf);
  pdf.noStroke();
  pdf.axialGradient(320, 500, 350, 580, new CMYKColor(0.5, 0, 1f, 0), new CMYKColor(0, 0, 1f, 0));
  pdf.rect((GRID.x + GUTTER.x)*0, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*1, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*3, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.axialGradient(280, 600, 250, 680, new CMYKColor(0, 0, 1f, 0), new CMYKColor(0, 1f, 0, 0));
  pdf.rect((GRID.x + GUTTER.x)*0, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.axialGradient(290, 600, 330, 600, new CMYKColor(0, 1f, 1f, 0), new CMYKColor(0.5, 0.5, 0, 0));
  pdf.rect((GRID.x + GUTTER.x)*1, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.axialGradient(400, 630, 400, 650, new CMYKColor(0.3f, 0, 0.1f, 0.1f), new CMYKColor(0, 0.4, 0.3f, 0.2));
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);

  pdf.popMatrix();  

  // -----------------------------------------------------------------------------------
  // Page four
  // Please note that the matrix transforms don't affect the gradient fill.
  pdf.nextPage();
  pdf.pushMatrix();   
  section(0, "7.", "Radial\ngradients", pdf);

  x0 = 280;
  y0 = 290;
  float r0 = 50;
  x1 = 280;
  y1 = 290;
  float r1 = 165;
  pdf.radialGradient(x0, y0, r0, x1, y1, r1, new CMYKColor(0, 0.7f, 1f, 0), new CMYKColor(0, 0.1f, 1f, 0));
  pdf.noStroke();
  pdf.rect(0, 0, (GRID.x + GUTTER.x)*4 - GUTTER.x, (GRID.y + GUTTER.y)*4 - GUTTER.y);

  // Note that the fill is still set:
  pdf.strokeK(1.0);
  pdf.strokeWeight(1);
  pdf.rect((GRID.x + GUTTER.x)*1, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*2, GRID.x, GRID.y);
  pdf.popMatrix();
  marker(x0, y0, r0, pdf);
  marker(x1, y1, r1, pdf);

  pdf.pushMatrix();
  section(4, "8.", "More radial\nexamples", pdf);
  pdf.noStroke();

  pdf.radialGradient(455, 590, 20, 455, 590, 160, new CMYKColor(1, 0.2f, 0, 0), new CMYKColor(0, 0, 0.1, 0.2));
  pdf.rect((GRID.x + GUTTER.x)*0, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*1, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.rect((GRID.x + GUTTER.x)*3, (GRID.y + GUTTER.y)*0, GRID.x, GRID.y);
  pdf.radialGradient(200, 610, 0, 200, 610, 50, new CMYKColor(0, 0, 1f, 0), new CMYKColor(0, 1f, 0, 0));
  pdf.rect((GRID.x + GUTTER.x)*0, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.radialGradient(315, 660, 0, 315, 660, 30, new CMYKColor(0, 1f, 1f, 0), new CMYKColor(0.5, 0.5, 0, 0));
  pdf.rect((GRID.x + GUTTER.x)*1, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);
  pdf.radialGradient(455, 610, 30, 455, 610, 100, new CMYKColor(0.8f, 0.1f, 1f, 0.1f), new CMYKColor(0.2, 0.6, 0.4f, 0.0));
  pdf.rect((GRID.x + GUTTER.x)*2, (GRID.y + GUTTER.y)*1, GRID.x, GRID.y);

  pdf.popMatrix();   

  // -----------------------------------------------------------------------------------
  // Save and close
  pdf.dispose();
  exit();
}

// Converts mm to PostScript points
// This function should be called “pt” but I like how it looks when used:
// mm(29) will be converted to 29mm
public float mm(float pt) {
  return pt * 2.83464567f;
}

// A small helper function to convert CMYK to Processing RGB, for preview purposes
// Formula from http://www.easyrgb.com/index.php?X=MATH
// Convert CMYK > CMY > RGB
// c,m,y,k ranges from 0.0 to 1.0
int CMYKtoRGB(float c, float m, float y, float k) {
  float C = c * (1-k) + k;
  float M = m * (1-k) + k;
  float Y = y * (1-k) + k;
  float r = (1-C) * 255;
  float g = (1-M) * 255;
  float b = (1-Y) * 255;
  return color(r, g, b);
}

void section(int offs, String nr, String title, PGraphics g) {
  // Watch out: CMYK and Spot colors are not pushed in the style stack by pushStyle
  // Stroke weights, RGB colors, textModes, etc. do. 
  g.pushStyle(); 
  float offsY = (GRID.y + GUTTER.y) * offs;
  float w = GRID.x * 5 + GUTTER.x * 4;
  ((PDF) g).strokeK(1.0); 
  ((PDF) g).fillK(1.0);
  g.translate(MARGIN.x, MARGIN.y + offsY);
  g.strokeWeight(0.3);
  g.line(0, -GUTTER.y / 2, w, -GUTTER.y / 2);
  g.textAlign(RIGHT, TOP);
  g.text(nr, -GUTTER.x, 0);
  g.textAlign(LEFT, TOP);
  g.text(title, 0, 0); 
  g.translate(GRID.x + GUTTER.x, 0);  // final offset, ready to draw
  g.popStyle();
}

// Just a simple marker
void marker(float x, float y, float r, PDF g) {
  g.strokeWeight(0.3);
  g.strokeK(1f);
  g.noFill();
  g.ellipse(x, y, r*2, r*2);
  g.noStroke();
  g.fillK(1f);
  g.ellipse(x, y, 5, 5);
}

