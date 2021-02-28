public abstract class DraggableUI extends UI
{
  public Vector2 topXClip, topYClip, botXClip, botYClip;
  public boolean draggable;
  public Vector2Int headerDim;
  public String header;
  
  DraggableUI(Vector2 origin, Vector2Int dimension, Vector2Int headerDim, String header, Vector2 offset)
  {
    super(origin, dimension, offset);
    this.headerDim = headerDim;
    this.header = header;
  }
  
  DraggableUI(Vector2 origin, Vector2Int dimension, String header)
  {
    this(origin, dimension, new Vector2Int(dimension.x, 40), header, new Vector2(0, 0));
  }
  
  DraggableUI(Vector2 origin, Vector2Int dimension, Vector2 offset)
  {
    this(origin, dimension, new Vector2Int(dimension.x, 40), "", offset);
  }
  
  @Override
  public boolean mouseOver()
  {
    if (mouseX <= drawOrigin.x + headerDim.x && mouseX >= drawOrigin.x && mouseY <= drawOrigin.y + headerDim.y && mouseY >= drawOrigin.y)
    {
      return true;
    }
    return false;
  }
  
  @Override
  public void update()
  {
    // Header border
    rectMode(CORNER);
    strokeWeight(2);
    stroke(theme.pallet[7]);
    fill(theme.pallet[0]);
    rect(this.drawOrigin.x, this.drawOrigin.y, this.headerDim.x, this.headerDim.y);
    
    // Header text
    textSize(13);
    fill(theme.pallet[1]);
    text(this.header, this.drawOrigin.x + this.padding, this.drawOrigin.y + this.headerDim.y - this.padding);
    
    // has to be last to make sure parent get drawn first
    super.update();
  }
}
