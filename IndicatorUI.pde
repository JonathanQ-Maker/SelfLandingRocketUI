public class IndicatorUI extends UI
{
  public float radius, strokeWeight;
  public int borderColorIndex, fillColorIndex;
  
  IndicatorUI(Vector2 origin, Vector2 offset, float radius, float strokeWeight, int borderColorIndex, int fillColorIndex)
  {
    super(origin, new Vector2Int(0, 0), offset);
    this.radius = radius;
    this.strokeWeight = strokeWeight;
    this.borderColorIndex = borderColorIndex;
    this.fillColorIndex = fillColorIndex;
  }
  
  IndicatorUI(Vector2 origin, Vector2 offset)
  {
    this(origin, offset, 10, 1, 5, 0);
  }
  
  public void setFillColor(int colorIndex)
  {
    this.fillColorIndex = colorIndex;
  }
  
  @Override
  public void update()
  {
    updateDrawOrigin();
    
    fill(theme.pallet[fillColorIndex]);
    strokeWeight(this.strokeWeight);
    stroke(theme.pallet[this.borderColorIndex]);
    circle(this.drawOrigin.x + this.padding, this.drawOrigin.y + this.padding, this.radius);
    super.update();
  }
  
  @Override
  public boolean mouseOver()
  {
    return false;
  }
}
