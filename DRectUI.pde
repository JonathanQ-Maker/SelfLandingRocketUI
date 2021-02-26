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
  public void update()
  {
    // Has to be first to ensure drawn at correct location
    updateDrawOrigin();
    
    
    this.pGraphics.beginDraw();
    rectMode(CORNER);
    strokeWeight(2);
    stroke(theme.pallet[7]);
    fill(theme.pallet[0]);
    rect(this.drawOrigin.x, this.drawOrigin.y + this.headerDim.y, this.dimension.x, this.dimension.y);
    this.pGraphics.endDraw();
    
    // has to be last to make sure parent get drawn first
    super.update();
  }
}
