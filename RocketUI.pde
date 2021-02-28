/*
* Author: Jonathan Qiao, First year comp sci @ UBCO
* Date: Feb 26th 2021
*
* Desc: User Interface made for UBCO Aerospace Self Landing Rocket Project
*/



void setup()
{
  surface.setResizable(true);
  size(1000, 600);
  frameRate(Env.fps);
  textFont(createFont("venus rising rg.ttf", 32));
  
  drawTestGraph();
  drawTestBasicUI();
}

void draw()
{
  background(theme.pallet[0]);
  UILoop();
}

void mouseWheel(MouseEvent event) {
  UImouseEvent(event);
}
