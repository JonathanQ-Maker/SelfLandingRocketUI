public class DRectUI extends DraggableUI
{ 
  
  DRectUI(Vector2 origin, Vector2Int dimension, Vector2Int headerDim, String header, Vector2 offset)
  {
    super(origin, dimension, headerDim, header, offset);
  }
  
  DRectUI(Vector2 origin, Vector2Int dimension, String header)
  {
    this(origin, dimension, new Vector2Int(dimension.x, 40), header, new Vector2(0, 0));
  }
  
  DRectUI(Vector2 origin, Vector2Int dimension)
  {
    this(origin, dimension, "Header");
  }
  
  @Override
  public void updateCorners()
  {
    topRight.x = origin.x + dimension.x;
    topRight.y = origin.y;
    botRight.x = origin.x + dimension.x;
    botRight.y = origin.y + dimension.y + headerDim.y;
    botLeft.x = origin.x;
    botLeft.y = origin.y + dimension.y + headerDim.y;
  }
  
  @Override
  public void update()
  {
    // Has to be first to ensure drawn at correct location
    updateDrawOrigin();
    
    
    rectMode(CORNER);
    strokeWeight(2);
    stroke(theme.pallet[7]);
    fill(theme.pallet[0]);
    rect(this.drawOrigin.x, this.drawOrigin.y + this.headerDim.y, this.dimension.x, this.dimension.y);
    
    // has to be last to make sure parent get drawn first
    super.update();
  }
}
