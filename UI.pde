abstract class UI  
{ 
  public PGraphics pGraphics;
  public Vector2 origin, offset;
  Vector2 drawOrigin;
  public float padding = 10f;
  private int index = -2;
  private ArrayList<UI> childUIs;
  public Vector2Int dimension;
  
  UI(Vector2 origin, Vector2Int dimension, Vector2 offset)
  {
    this.dimension = dimension;
    this.pGraphics = createGraphics(dimension.x, dimension.y);
    this.origin = origin;
    this.index = UIManager.registerUI(this);
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
  
  public void addChild(UI ui)
  {
    if (childUIs == null)
      this.childUIs = new ArrayList<UI>();
    
    this.childUIs.add(ui);
    ui.origin = this.origin;
    UIManager.deleteUI(ui);
  }
  
  public void removeChild(UI ui)
  {
    this.childUIs.remove(ui);
    ui.origin = new Vector2(this.origin.x, this.origin.y);
  }
  
  public int getIndex()
  {
    return this.index;
  }
  
  public void recall()
  {
    this.origin.x = random(0, displayWidth);
    this.origin.y = random(0, displayHeight);
  }
  
  public void update()
  {
    if (this.childUIs != null && this.childUIs.size() > 0)
      for (UI child : this.childUIs)
        child.update();
  }
  
  public abstract boolean mouseOver();
}
