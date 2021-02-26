public class TextUI extends UI
{
  public String text;
  public float fontSize;
  public int colorIndex;
  
  TextUI(Vector2 origin, Vector2 offset, String text, float fontSize, int colorIndex)
  {
    super(origin, new Vector2Int(0, 0), offset);
    this.text = text;
    this.fontSize = fontSize;
    this.colorIndex = colorIndex;
  }
  
  TextUI(Vector2 origin, String text)
  {
    this(origin, new Vector2(0,0), text, 10, 4);
  }
  
  @Override
  public void update()
  {
    updateDrawOrigin();
    
    fill(theme.pallet[this.colorIndex]);
    textSize(this.fontSize);
    text(this.text, this.drawOrigin.x + this.padding, this.drawOrigin.y + this.padding);
    
  }
  
  @Override
  public boolean mouseOver()
  {
    return false;
  }
  
}
