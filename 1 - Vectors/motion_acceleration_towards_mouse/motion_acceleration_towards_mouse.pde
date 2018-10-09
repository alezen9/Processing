/*
* Gjoreski Aleksandar
* 2018
*
* Demonstration of the basics of motion with vectors
* A "Mover" object stores position, velocity, and acceleration as vectors
* The motion is controlled by affecting the acceleration (in this case towards the mouse)
*/

Mover[] movers = new Mover[5];

void setup() {
  size(500,500);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  
  background(10);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display(); 
  }
}
