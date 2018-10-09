/*
* Gjoreski Aleksandar
* 2018
*
* Fluid resistance simulation simplified (with vectors)
* A "Mover" object stores position, velocity, acceleration as vectors and mass and color
* A "Liquid" object stores 5 variables: 4 to rappresent the rectangle of the liquid and one which is the coefficient of drag
* The motion is controlled by affecting the position of the movers by adding acceleration and liquid resistance force to each one
* which results in movers slowing down when int the liquid, each one depending on the mass
*/

// Five moving bodies
Mover[] movers = new Mover[5];

// Liquid
Liquid liquid;

void setup() {
  size(500, 500);
  randomSeed(1);
  reset();
  // Create liquid object
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);
  
  // Draw water
  liquid.display();

  for (int i = 0; i < movers.length; i++) {
    
    // Is the Mover in the liquid?
    if (liquid.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = liquid.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }

    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    // Apply gravity
    movers[i].applyForce(gravity);
   
    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
  fill(0);
  text("click mouse to reset",10,30);
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5*2.25,3*2.25), 20*2.25+i*40*2.25, 0,color(int(random(100,200)),int(random(100,200)),int(random(100,200))));
  }
}
