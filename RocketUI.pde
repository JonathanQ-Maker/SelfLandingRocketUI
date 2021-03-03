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
  loadFontOf(0);
  
  drawTestGraph();
  drawTestBasicUI();
}

void draw()
{
  background(theme.pallet[0]);
  UILoop();
}
int s = 0;
void mouseWheel(MouseEvent event) {
  UImouseEvent(event);
  s++;
  data.add(new Vector2(s, random(0, 100)));
}
