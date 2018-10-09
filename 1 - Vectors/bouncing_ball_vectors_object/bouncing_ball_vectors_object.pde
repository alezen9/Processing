/*
* Gjoreski Aleksandar
* 2018
*
* Simple ball moving around the screen (with vectors)
* A "Ball" object stores position and velocity as vectors
* The motion is controlled by affecting the position by adding velocity
*/

Ball b;
Ball c;

void setup() {
  size(500, 500);
  b = new Ball();
  c = new Ball();
}

void draw() {
  background(255);
  b.update();
  b.display();
  c.update();
  c.display();
}
