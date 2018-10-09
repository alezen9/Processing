/*
* Gjoreski Aleksandar
* 2018
*/

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x , float y) {
    mass = m;
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(255,50);
    fill(100,50,250,250);
    ellipse(position.x,position.y,mass*2,mass*2);
  }

  PVector repel(Mover m) {
    PVector force = PVector.sub(position,m.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance,1.0,10000.0);                   // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.setMag(-(g * mass * m.mass) / (distance * distance));   // inverse gravitational force
    return force;
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } 
    else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    }

    if (position.y > height) {
      position.y = height;
      velocity.y *= -1;
    } 
    else if (position.y < 0) {
      position.y = 0;
      velocity.y *= -1;
    }

  }

}
