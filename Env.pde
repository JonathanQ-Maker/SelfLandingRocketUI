public static class Env
{
  public static int sizeX = 500, sizeY = 500;
  public static int fps = 32;
}

Theme[] themes = new Theme[] 
{
  new Theme(
  color(4,5,5),         // 0:Black         (background)
  color(255, 255, 255), // 1:White         (Text)
  color(5,142,143),     // 2:cyan          (Button, clickable / text)
  color(9,59,58),       // 3:dark cyan     (Button, unclickable / text)
  color(61,96,68),      // 4:mush green    (Text)
  color(149,149,149),   // 5:grey          (Text / border)
  color(23,235,20),     // 6:bright green  (all good indicator)
  color(38,246,233)     // 7:brigh blue    (Border highlighter)
  )
};


boolean lastMouseDown = false;
public boolean OnMouseDown()
{
  return (!lastMouseDown && mousePressed);
}

public boolean OnMouseUp()
{
  return (lastMouseDown && !mousePressed);
}

public void UILoop()
{
  UIManager.hoverUI = null;
  for (UI ui : UIManager.UIs)
  {
    ui.update();
    if (ui.mouseOver())
    {
      UIManager.hoverUI = ui;
      cursor(HAND);
    }
  }
  
  if (UIManager.hoverUI == null)
    cursor(ARROW);
  
  if (OnMouseDown())
  {
    UIManager.selectedUI = UIManager.hoverUI;
  }
  
  
  if (mousePressed)
  {
    if (UIManager.selectedUI != null)
    {
      if (UIManager.selectedUI instanceof DraggableUI)
      {
        UIManager.selectedUI.origin.x = mouseX;
        UIManager.selectedUI.origin.y = mouseY;
      }
    }
  }
  
  if (OnMouseUp())
  {
    UIManager.selectedUI = null;
  }
  lastMouseDown = mousePressed;
}


void hotkeyLoop()
{
  
}
