public class RectUI extends ClippableUI
{
  public int colorIndex;
  public float strokeWeight;
  public Vector2Int dimension;
  
  RectUI(Vector2 origin, Vector2Int dimension, Vector2 offset, int colorIndex, float strokeWeight)
  {
    super(origin, dimension, offset);
    this.dimension = dimension;
    this.colorIndex = colorIndex;
    this.strokeWeight = strokeWeight;
  }
  
  @Override
  public void update()
  {
    updateDrawOrigin();
    strokeWeight(this.strokeWeight);
    stroke(theme.pallet[this.colorIndex]);
    fill(theme.pallet[0]);
    rectMode(CORNER);
    rect(drawOrigin.x, drawOrigin.y, dimension.x, dimension.y);
    super.update();
  }
  
  @Override
  public boolean mouseOver()
  {
    return false;
  }
}
