/*
 * Visualization of a Look-and-say sequence algorithm
 * @author TekVila
 */

int pixSize = 50;
int W = 12;
int H = 12;
char start = '5';

void settings() {
  size(W*pixSize, H*pixSize); 
}

void setup() {
  background(0);
}

void draw() {
  int pos = 0;
  String res = ""+ start;
  int newlimit = res.length(); 
  while ( pos < (W*H) ) {
    //Drawing
    for (int i = 0; pos < newlimit && pos < (H*W) ; pos++, i++) {
      int val = Integer.parseInt(""+res.charAt(i));
      if ( (res.length()-1) == i)
        fill( 0,0,0);
      else if (val == 1)
        fill( 0, 255, 0);
      else if (val == 2)
        fill( 0, 0, 255);
      else if (val == 3)
        fill( 255, 0, 0);
      rect( (pos%W)*pixSize, (pos/W) * pixSize, pixSize, pixSize);
    }
    //Next "line"
    String rep = "";
    char prev = 0;
    int count = 1;
    char cur = 0;
    for (int d = 0; d < res.length() ; d++) {
      cur = res.charAt(d);
      if (cur == prev) {
        count++;
      } else {
        if (prev != 0) rep+= String.valueOf(count) + prev;
          count = 1;
        }
        prev = cur;
      }
      rep+= String.valueOf(count) + cur;
      res = rep;
      newlimit = res.length() + pos;
  }
  save("las" + W + "x" + H + "@" + pixSize + "px.png");
}