public class Seperator extends UI
{
  public int colorIndex;
  public float strokeWeight;
  public Vector2 end;
  
  Seperator(Vector2 origin, Vector2 end, Vector2 offset, int colorIndex, float strokeWeight)
  {
    super(origin, new Vector2Int(0, 0), offset);
    this.colorIndex = colorIndex;
    this.strokeWeight = strokeWeight;
    this.end = end;
  }
  
  @Override
  public void update()
  {
    updateDrawOrigin();
    strokeWeight(this.strokeWeight);
    stroke(theme.pallet[this.colorIndex]);
    line(drawOrigin.x, drawOrigin.y, drawOrigin.x + end.x, drawOrigin.y + end.y);
    super.update();
  }
  
  @Override
  public boolean mouseOver()
  {
    return false;
  }
}
