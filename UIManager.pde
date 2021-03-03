public static class UIManager
{
  public static ArrayList<UI> UIs = new ArrayList<UI>();
  public static ArrayList<UI> drawList = new ArrayList<UI>();
  public static ArrayList<Vector2> corners = new ArrayList<Vector2>();
  public static int themeID = 0;
  public static UI selectedUI, hoverUI;
  
  public static int registerUI(UI ui)
  {
    UIs.add(ui);
    return UIs.size() - 1;
  }
  
  public static int registerDrawList(UI ui)
  {
    drawList.add(ui);
    return drawList.size() - 1;
  }
  
  public static void deleteDrawUI(UI ui)
  {
    drawList.remove(ui);
  }
  
  public static void deleteUI(UI ui)
  {
    UIs.remove(ui);
  }
}

public Theme theme = themes[UIManager.themeID];
