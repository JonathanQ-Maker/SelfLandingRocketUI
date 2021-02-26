public static class UIManager
{
  public static ArrayList<UI> UIs = new ArrayList<UI>();
  public static int themeID = 0;
  public static UI selectedUI, hoverUI;
  
  public static int registerUI(UI ui)
  {
    UIs.add(ui);
    return UIs.size() - 1;
  }
  
  public static void deleteUI(UI ui)
  {
    UIs.remove(ui);
  }
}

public Theme theme = themes[UIManager.themeID];
