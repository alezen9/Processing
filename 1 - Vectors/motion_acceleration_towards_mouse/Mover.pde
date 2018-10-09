/*
* Gjoreski Aleksandar
* 2018
*/


class Mover {

  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  color c = color(int(random(50,200)),int(random(50,200)),int(random(50,200)));
  float d = random(20, 50);

  Mover() {
    // Start in the center
    position = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update() {
    // Compute a vector that points from position to mouse
    PVector mouse = new PVector(mouseX,mouseY);
    acceleration = PVector.sub(mouse,position);
    // Set magnitude of acceleration
    acceleration.setMag(0.2);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // position changes by velocity
    position.add(velocity);
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(position.x,position.y,d,d);
  }

}
