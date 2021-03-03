public static class Env
{
  public static int sizeX = 500, sizeY = 500;
  public static int fps = 32;
  public static String[] fontNames = new String[] 
  {
    "venus rising rg",
    "earthorbiter"
  };
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

public void loadFontOf(int index)
{
  try
  {
    println("Attempting to load font " + Env.fontNames[index]);
    textFont(createFont(Env.fontNames[index] + ".ttf", 32));
    println("Font load successful");
  }
  catch (Throwable e)
  {
    println("Loading font "+Env.fontNames[index]+" failed! Using default");
    println(e);
  }
}

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
  for (UI ui : UIManager.drawList)
  {
    ui.update();
    //println(((DRectUI)ui).dimension);
  }
  
  for (UI ui : UIManager.UIs)
  {
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
        for (Vector2 v : UIManager.corners)
        {
          if (UIManager.selectedUI.origin.distance(v) < 20)
          {
            UIManager.selectedUI.updateOrigin(v.clone());
            
          }
        }
      }
    }
  }
  
  if (OnMouseUp())
  {
    UIManager.selectedUI = null;
  }
  lastMouseDown = mousePressed;
  
  
}


public void UImouseEvent(MouseEvent event)
{
  if (UIManager.selectedUI instanceof GraphUI)
  {
    
  }
}
