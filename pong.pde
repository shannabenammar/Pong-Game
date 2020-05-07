/*
Move left,right, up, and down with arrow keys to move human to catch the trophy.
Win-Lose-Conditions:
TO WIN: Get over or equal to 200 points
TO LOSE: Get less than or equal to -10 points 
Types of fun:
1) Once you catch the trophy you win 10 point. If you don't catch the trophy you lose 5 point. 
2) After you receive 50 point, another trophy is added to the game. Allowing for opportunities to win and lose points.
3) Once you catch a trophy a random curve will appear that the user has the option to change the color of
Features:
1) Press either 'B', 'G', 'Y', or 'R' to pause the game. (each letter creates a different colored pause screen)
2) Press 'O' to unpause the game
3) Press 'A' to get the average of the image
4) Once you catch a trophy a random curve will appear
5) If you click your mouse, the curve will be a different color next time it appears
6) Press 'C' to temporarly change the background to black or white which will change the curve to the opposing color
*/

Sprite cat1;
Sprite apple;
Sprite apple2;
Sprite bez;
PImage bg, bg2;
TimedMessage tm;
int points,number,colorSp;
int value =0;
color rgb2;
PShape curve;
float randomX, randomX2, randomX3, randomX4;
float randomY, randomY2, randomY3, randomY4; 

void setup() {
	
	size(480, 320);
	frameRate(10);
	
	//Sets the radom values for the random valued float variables
	randomX = random(50,200);
	randomX2 = random(50,200);
	randomX3 = random(50,200);
	randomX4 = random(50,200);
	
	randomY = random(50,320); 
	randomY2 = random(50,320);
	randomY3 = random(50,320);
	randomY4 = random(50,320);
	
	//intial value for the color of the curve
	colorSp = 0;
	
	// Load human image
	PImage[] catImage = new PImage[2];
	catImage[0] = loadImage("image_test2.png");
	catImage[1] = loadImage("image_test10.png");
	cat1 = new Sprite(catImage);
	// Set scale of cat to 0.2
	cat1.setScale(0.2);
	// Set position to cat to middle of screen on the bottom
	cat1.setPosition(width/2, height/2);
	cat1.setScale(0.1);
	
	
	// Load award image
	PImage[] appleImage = new PImage[1];
	appleImage[0] = loadImage("Academy_Award_trophy.png");
	// Create apple sprite
	apple = new Sprite(appleImage);
	// Set scale of apple to 0.2
	apple.setScale(0.1);
	// Set position of apple to random x and y=0
	apple.setPosition(random(10, width-10), 0);
	
	// Load award image
	PImage[] appleImage2 = new PImage[1];
	appleImage2[0] = loadImage("Academy_Award_trophy.png");
	// Create apple sprite
	apple2 = new Sprite(appleImage);
	// Set scale of apple to 0.2
	apple2.setScale(0.1);
	// Set position of apple to random x and y=0
	apple2.setPosition(random(10, width-10), 0);
	

	// Load two background images
	bg = loadImage("Background.jpg");
	bg2 = loadImage("Background.jpg");
	
	
	// Create timed message centered on the screen
	fill(255, 215, 0);
	tm = new TimedMessage(width/2, height/2, 60);
	// Set it to display "Ready, go!" for 20 frames
	tm.show("Ready, go!", 20);
	
	
}

void draw() {
	
	background(255);
	image(bg, 240, 160, 480,320);

	//Draw the four sprites
	noTint();
	apple.draw();
	cat1.draw();
	tm.draw();
	
	// Make the trophy fall 5 pixels
	apple.changePosition(0, 5);

	
		//Condition statements
		if(value == 1){
				color rgb = getAverage();
				noTint();
				fill(rgb);
				stroke(0);
				rect (40, 40, 55, 55);
		}
		if(color(rgb2) > color(0,0,0)){
				changeColor(rgb2);
		}
	 if(points > 50){
					apple2.draw();
					apple2.changePosition(0, 5);
		}
	
	if(points< -10 || points == -10){
				tm.show("YOU LOSE", 10);
	}
	else{
		if(points> 200 || points == 200){
		tm.show("YOU WIN", 10);
		}
		else{
		if (apple.overlapsSprite(cat1)) {

			// Set the position of the trophy to random x and y=0 again
			apple.setPosition(random(10, width-10), 0);
			
			// Show timed message "Got it!" for 10 frames
			fill(255, 204, 0);
			tm.show("Got it! +10 points", 10);
			points = points + 10; 

		
				if(colorSp == 0){
				curveSp(colorSp);
				}
			 else{
				curveBez(colorSp);
				}


		} 
	if (apple2.overlapsSprite(cat1)) {

			// Set the position of the trophy to random x and y=0 again
			apple2.setPosition(random(10, width-10), 0);
			
			// Show timed message "Got it!" for 10 frames
			fill(255, 204, 0);
			tm.show("Got it! +10 points", 10);
			points = points + 10; 

				if(colorSp == 0){
				curveSp(colorSp);
				}
			 else{
				curveBez(colorSp);
				}


		} 
		else if (apple2.y > height - 30) {

			// Set the position of the trophy to random x and y=0 again
			apple2.setPosition(random(10, width-10), 0);
			

			// Show timed message "Missed it!" for 10 frames
			fill(140, 71, 10);
			tm.show("Missed it! -5 points", 10);
					points = points-5;
			
				if(colorSp == 0){
				curveSp(colorSp);
				}
				 else{
					curveBez(colorSp);
				}
			
		}
		else if (apple.y > height - 30) {

			// Set the position of the trophy to random x and y=0 again
			apple.setPosition(random(10, width-10), 0);
			

			// Show timed message "Missed it!" for 10 frames
			fill(140, 71, 10);
			tm.show("Missed it! -5 points", 10);
					points = points-5;
			
				if(points > 50){
				apple2.setPosition(random(10, width-10), 0);
				}	
				if(colorSp == 0){
				curveSp(colorSp);
				}
				 else{
					curveBez(colorSp);
				}
		}
		}

		}
	
	fill(255, 204, 0);
	textSize(10);
	text("You have",20, 20, 45, 45);
	text(points, 40,45);
	text("Points",40, 60);
	textSize(15);
	text("Instructions", 240,275);
	
	fill(255);
	textSize(10);
	text(" GOAL: Catch the trophy to get 10 point.  USE ARROWS: to Move person up, down, left, right.  ",240,290);
	text("USE KEYS:  'A': get average , 'B': pause with blue tint , 'G': pause with green tint, ", 240,300);
	text("'R': pause red tint, 'Y': pause yellow tint, 'O': Unpause and go back to original color ",240,310);

}



void curveBez(colorSp){

			noFill();
		beginShape();
			stroke(colorSp);
		//Attempt to make curves more interesting 
			//vertex(random(50,450),random(50,300)); // first point
			//bezierVertex(random(50,450), random(50,300), random(50,450), random(50,300), random(50,450), random(50,300));
			//bezierVertex(random(50,450), random(50,300), random(50,450), random(50,300), random(50,450), random(50,300));
		vertex(randomX2,randomY2); // first point
			bezierVertex(randomX, randomY, randomX4, randomY4, randomX2, randomY2);
			bezierVertex(randomX, randomY, randomX4, randomY4, randomX3, randomY3);	
		endShape();

}

void curveSp(color){

		noFill();
		stroke(color);
	beginShape();
		curveVertex(randomX, randomY); // the first control point
		curveVertex(randomX, randomY); // is also the start point of curve
		curveVertex(randomX2, randomY2);
		curveVertex(randomX3, randomY3);
		curveVertex(randomX4, randomY4); // the last point of curve
		curveVertex(randomX4, randomY4); // is also the last control point
	 endShape(CLOSE);

		noStroke();
		fill(255, 0, 0);
		ellipse(randomX, randomY, 5, 5);
		ellipse(randomX2, randomY2, 5, 5);
		ellipse(randomX3, randomY3, 5, 5);  
		ellipse(randomX4, randomY4, 5, 5);  
	
}
void changeColor(rgb3){
	
		background();
		noTint();
		tint(rgb3);
		image(bg, 240, 160, 480,320);
		fill(0);
		textSize(30);
		text("PAUSED", 250,150);

}

void mousePressed(){
 if(colorSp ==0){
 colorSp = 255;
 }
	else{
	colorSp=0;
	}
}

void keyPressed() {
	
	if (key == CODED && keyCode == LEFT) {
		
			cat1.changePosition(-5,0);
			cat1.nextCostume();
		
	} 
	else if (key == CODED && keyCode == RIGHT) {
		
			cat1.changePosition(5,0);
			cat1.nextCostume();
		
	} 
	else if(key == CODED && keyCode == UP){
	     cat1.changePosition(0,-5);
			 cat1.nextCostume();
	}
	else if(key == CODED && keyCode == DOWN){
	     cat1.changePosition(0,5);
			 cat1.nextCostume();
	}
	else if((key == 'a') || (key == 'A')){
		value = 1;
			
	}
		else if((key == 'b') || (key == 'B')){
			rgb2 = color(100,0,255);
	}
	else if((key == 'g') || (key == 'G')){
		rgb2 = color(100,255,50);
	}
	else if((key == 'y') || (key == 'Y')){
		
		rgb2 = color(175,70,0);
			
	}else if((key == 'r') || (key == 'R')){
		
		rgb2 = color(255,0,50);
		
	}else if((key == 'o') || (key == 'O')){
		
			rgb2 = color(0,0,0);
	}
	else if((key == 'c') || (key == 'C')){
		
		if((number%2 == 0) && number> 0){
			colorSp = 0;
			background(255);
			number = number + 1;
		}
		else{
			colorSp = 255;
			background(0);
			number = number +1;
		}
			
	}
	
	
}



color getAverage(){
 
  long redBucket = 0;
  long greenBucket = 0;
  long blueBucket = 0;

  
  bg2.loadPixels();   
  int index = 0;
  
  for (int y = 0; y < bg2.height; y++) {
    for (int x = 0; x < bg2.width; x++) {
    
      color c = bg2.pixels[index];

      redBucket += red(c);
      greenBucket += green(c);
      blueBucket += blue(c);
      
      index++;      
    }
  }
  
  long redAverage = redBucket / index;
  long greenAverage = greenBucket / index;
  long blueAverage = blueBucket / index;
  color rgbAverage = color(redAverage, greenAverage, blueAverage);
  
  
	return rgbAverage;
 
}




// TimedMessage class, an object to show text messages for a certain number of frames
class TimedMessage {
	float x, y;
	int mySize, framesLeft;
	string msg;
	
  // Constructor takes coordinates and text size to use
	TimedMessage(float tmpX, float tmpY, int tmpSize) {
		x = tmpX;
		y = tmpY;
		mySize = tmpSize;
	}
	
	// Set the message to display and the time to display it for
	void show(string tmpMsg, int forFrames) {
		msg = tmpMsg;
		framesLeft = forFrames;
	}
	
	// Show the message if time isn't up yet
	void draw() {
		if (framesLeft > 0) {
			textSize(mySize);
			textAlign(CENTER);
			text(msg, x, y);
			framesLeft = framesLeft - 1;
		}
	}
}

// Sprite: a class that mimics Sprites in Scratch
class Sprite {
	float x, y, angle, myScale;
	int currentCostume;
	float myWidth, myHeight;
	PImage[] costumes;

	// Cache coordinates of corners
	float[] cornerCoordsX = new float[4];
	float[] cornerCoordsY = new float[4];

	// Constructor: give array of costumes to use
	Sprite(PImage[] tmpCostumes) {
		x = width/2;
		y = height/2;
		angle = 0;
		myScale = 1.0;
		currentCostume = 0;
		costumes = tmpCostumes;
		
		myWidth = 0;
		myHeight = 0;
	}
	
  // Draw on the canvas at current position, scale, and rotation
	void draw() {		
		pushMatrix();
		translate(x, y);
		rotate(radians(angle));
		scale(myScale);
		rectMode(CENTER);
		noFill();
		// rect(-1, -1, myWidth+1, myHeight+1);
		imageMode(CENTER);
		image(costumes[currentCostume], 0, 0);
		popMatrix();
	}
	
	// Set new position
	void setPosition(float newX, float newY) {
		x = newX;
		y = newY;
		updateCornerCoords();
	}
	
	// Update position relative to current position
	void changePosition(float changeInX, float changeInY) {
		x = x + changeInX;
		y = y + changeInY;
		updateCornerCoords();
	}
	
	// Move forward based on current angle
	void moveForward(float steps) {
		x = x + cos(radians(angle)) * steps;
		y = y + sin(radians(angle)) * steps;
		updateCornerCoords();
	}

	// Set new angle (in degrees)
	void setAngle(float newAngle) {
		angle = newangle;
		updateCornerCoords();
	}
	
	// Update angle relative to current angle
	void changeAngle(float changeInAngle) {
		angle = angle + changeInAngle;
		updateCornerCoords();
	}

	// Set new scale (multiplier on size)
	void setScale(float newScale) {
		myScale = newScale;
		updateCornerCoords();
	}

	// Update scale relative to current scale by multiplying them
	void changeScale(float changeInScale) {
		myScale = myScale * changeInScale;
		updateCornerCoords();
	}
	
	// Switch to specified costume number
	void wearCostume(int costume) {
		currentCostume = costume;
	}
	
	// Advance to next costume or start over
	void nextCostume() {
		currentCostume = currentCostume + 1;
		if (currentCostume >= costumes.length) {
			currentCostume = 0;
		}
	}

	// Test if the bounding box of the sprite contains the specified point
	boolean overlapsPoint(float otherX, float otherY) {
		computeSize();
		return pnpoly(cornerCoordsX, cornerCoordsY, otherX, otherY);
	}

	// Test if the bounding box of the sprite overlaps the bounding box of another sprite
	boolean overlapsSprite(Sprite other) {
		return overlapsPoint(other.cornerCoordsX[0], other.cornerCoordsY[0])
				|| overlapsPoint(other.cornerCoordsX[1], other.cornerCoordsY[1])
				|| overlapsPoint(other.cornerCoordsX[2], other.cornerCoordsY[2])
				|| overlapsPoint(other.cornerCoordsX[3], other.cornerCoordsY[3])
				|| other.overlapsPoint(cornerCoordsX[0], cornerCoordsY[0])
				|| other.overlapsPoint(cornerCoordsX[1], cornerCoordsY[1])
				|| other.overlapsPoint(cornerCoordsX[2], cornerCoordsY[2])
				|| other.overlapsPoint(cornerCoordsX[3], cornerCoordsY[3]);
	}

  // Point-polygon collision test
	// From: https://wrf.ecse.rpi.edu//Research/Short_Notes/pnpoly.html
	// And: https://stackoverflow.com/a/2922778/2037288
  // And: https://github.com/jeffThompson/CollisionDetectionFunctionsForProcessing/blob/master/pointPolygon/pointPolygon.pde
	boolean pnpoly(float[] vertx, float[] verty, float testx, float testy) {
  	int i, j;
		boolean c = false;
  	for (i = 0, j = vertx.length-1; i < vertx.length; j = i++) {
    	if ( ((verty[i]>testy) != (verty[j]>testy)) && (testx < (vertx[j]-vertx[i]) * (testy-verty[i]) / (verty[j]-verty[i]) + vertx[i]) ) {
      	c = !c;
			}
  	}
  	return c;
	}

	// Update the stored locations of the corners of the sprite's bounding box. Called from overlapsPoint().
	void updateCornerCoords() {
		float c = myScale*cos(radians(angle));
		float s = myScale*sin(radians(angle));
		float w2 = myWidth/2;
		float h2 = myHeight/2;
				
		cornerCoordsX[0] = x + c*w2 - s*h2; 
		cornerCoordsY[0] = y + c*h2 + s*w2;
		cornerCoordsX[1] = x + c*w2 + s*h2;
		cornerCoordsY[1] = y - c*h2 + s*w2;
		cornerCoordsX[2] = x - c*w2 + s*h2;
		cornerCoordsY[2] = y - c*h2 - s*w2;
		cornerCoordsX[3] = x - c*w2 - s*h2;
		cornerCoordsY[3] = y + c*h2 - s*w2;
	}

	// Compute the size of the sprite's bounding box
	void computeSize() {
		if (myWidth > 0 && myHeight > 0) {
			return;
		}
		for (int i = 0; i < costumes.length; i++) {
			if (costumes[i].width > myWidth) {
				myWidth = costumes[i].width;
			}
			if (costumes[i].height > myHeight) {
				myHeight = costumes[i].height;
			}
		}
				
		updateCornerCoords();
	}
}
