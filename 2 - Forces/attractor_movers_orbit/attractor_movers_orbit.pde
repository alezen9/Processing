/*
* Gjoreski Aleksandar
* 2018
*
* Orbit simulation simplified (with vectors)
* A "Mover" object stores position, velocity, acceleration as vectors and mass
* An "Attractor" object stores position and drag (from prev position to mouse position) as vectors, mass, radius and two booleans for calculations
* The motion is controlled by affecting the position of the movers by adding acceleration and atrraction force to each one
*/

Mover[] movers = new Mover[10];

Attractor a;

float g = 1;

void setup() {
  size(500,500);
  a = new Attractor();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(5,15),random(width),random(height)); 
  }
}

void draw() {
  background(10);

  a.display();
  a.drag();
  a.rollover(mouseX, mouseY);

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].repel(movers[i]);
        movers[i].applyForce(force);
      }
    }

    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    movers[i].display();
  }
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a.stopDragging();
}
