/*
* Gjoreski Aleksandar
* 2018
*/

class Ball {
  PVector position;
  PVector velocity;
  // circle diametar
  int d = int(random(30, 50));
  // fill color
  color c = color(int(random(50,200)),int(random(50,200)),int(random(50,200)));
  Ball() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(-2.5, 2.5),random(3, 5));
  }

  void update() {
    // Add the current speed to the position.
    position.add(velocity);
    // check edges
    if ((position.x > width-(d/2)) || (position.x < d/2)) {
      velocity.x = velocity.x * -1;
    }
    if ((position.y > height-(d/2)) || (position.y < d/2)) {
      velocity.y = velocity.y * -1;
    }
  }
  void display() {
    // Display circle at x and y position
    noStroke();
    fill(c);
    ellipse(position.x, position.y, d, d);
  }
}
