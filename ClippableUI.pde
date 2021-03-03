public abstract class ClippableUI extends UI
{
  public Vector2 topRight, botRight, botLeft;
  
  ClippableUI(Vector2 origin, Vector2Int dimension, Vector2 offset)
  {
    super(origin, dimension, offset);
    topRight = new Vector2(origin.x + dimension.x, origin.y);
    botRight = new Vector2(origin.x + dimension.x, origin.y + dimension.y);
    botLeft = new Vector2(origin.x, origin.y + dimension.y);
    UIManager.corners.add(topRight);
    UIManager.corners.add(botRight);
    UIManager.corners.add(botLeft);
  }
  
  public void updateCorners()
  {
    topRight.x = origin.x + dimension.x;
    topRight.y = origin.y;
    botRight.x = origin.x + dimension.x;
    botRight.y = origin.y + dimension.y;
    botLeft.x = origin.x;
    botLeft.y = origin.y + dimension.y;
  }
  
  @Override
  public void update()
  {
   super.update();
   updateCorners();
  }
}
