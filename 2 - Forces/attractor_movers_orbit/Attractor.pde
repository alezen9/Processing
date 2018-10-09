/*
* Gjoreski Aleksandar
* 2018
*
* A class for a draggable attractive body in the canvas
*/

class Attractor {
  float mass;    // Mass, tied to size
  float radius;  // Radius of the attractor
  PVector position;   // position
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector drag;  // holds the offset for when object is clicked on

  Attractor() {
    // start in the center
    position = new PVector(width/2,height/2);
    mass = 10;
    radius = mass * 3;
    drag = new PVector(0.0,0.0);
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(position,m.position);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d,5.0,25.0);                          // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.setMag((g * mass * m.mass) / (d * d));        // Normalize vector, Calculate gravitional force magnitude and assign it to the force
    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    noStroke();
    if (dragging || rollover) fill (255,255,0,100);
    else fill(255,70);
    ellipse(position.x,position.y,radius*2,radius*2);
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx,my,position.x,position.y);
    if (d < radius) {
      dragging = true;
      drag.x = position.x-mx;
      drag.y = position.y-my;
    }
  }

  void rollover(int mx, int my) {
    float d = dist(mx,my,position.x,position.y);
    if (d < radius) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if (dragging) {
      position.x = mouseX + drag.x;
      position.y = mouseY + drag.y;
    }
  }
}
