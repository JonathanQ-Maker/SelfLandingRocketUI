abstract class UI  
{ 
  public Vector2 origin, offset;
  Vector2 drawOrigin;
  public float padding = 10f;
  private int index = -2, drawIndex = -1;
  private ArrayList<UI> childUIs;
  public Vector2Int dimension;
  
  UI(Vector2 origin, Vector2Int dimension, Vector2 offset)
  {
    this.dimension = dimension;
    this.origin = origin;
    this.index = UIManager.registerUI(this);
    this.drawIndex = UIManager.registerDrawList(this);
    this.offset = offset;
    drawOrigin = Vector2.add(offset, origin);
  }
  
  public void updateDrawOrigin()
  {
    this.drawOrigin = Vector2.add(this.offset, this.origin);
  }
  
  public ArrayList<UI> getChild()
  {
    return this.childUIs;
  }
  
  public void updateOrigin(Vector2 v)
  {
    this.origin = v;
    if (this.childUIs != null)
    for (UI child : this.childUIs)
    {
      child.origin = v;
    }
  }
  
  public void addChild(UI ui)
  {
    if (childUIs == null)
      this.childUIs = new ArrayList<UI>();
    
    this.childUIs.add(ui);
    ui.updateOrigin(this.origin);
    UIManager.deleteDrawUI(ui);
  }
  
  public void removeChild(UI ui)
  {
    this.childUIs.remove(ui);
    ui.origin = this.origin.clone();
  }
  
  public int getIndex()
  {
    return this.index;
  }
  
  public void recall()
  {
    this.origin.x = random(0.3f * width, width - 0.3f * width);
    this.origin.y = random(0.3f * height, height - 0.3f * height);
  }
  
  public void update()
  {
    if (this.childUIs != null && this.childUIs.size() > 0)
      for (UI child : this.childUIs)
        child.update();
  }
  
  public abstract boolean mouseOver();
}
