public class GraphUI extends UI
{
  public ArrayList<Vector2> dataSet;
  public int lineColorIndex;
  public float lineStrokeWeight;
  public int xInterval, yInterval, displayLength;
  public float lowXLim, lowYLim, highXLim, highYLim;
  public String xLable, yLable;
  GraphUI(Vector2 origin, Vector2Int dimension, Vector2 offset, int lineColorIndex, int lineStrokeWeight, ArrayList<Vector2> dataSet, int xInterval, int yInterval, String xLable, String yLable, int displayLength)
  {
    super(origin, dimension, offset);
    this.dataSet = dataSet;
    this.displayLength = displayLength;
    this.xInterval = xInterval;
    this.yInterval = yInterval;
    this.lineColorIndex = lineColorIndex;
    this.lineStrokeWeight = lineStrokeWeight;
    this.xLable = xLable;
    this.yLable = yLable;
  }
  
  GraphUI(Vector2 origin, Vector2Int dimension, Vector2 offset, ArrayList<Vector2> dataSet, String xLable, String yLable)
  {
    this(origin, dimension, offset, 1, 2, dataSet, 10, 10, xLable, yLable, 50);
  }
  
  public int getShorterLength()
  {
    if (displayLength < dataSet.size())
      return displayLength;
    return dataSet.size();
  }
  
  @Override
  public void update()
  {
    if (dataSet.size() > 0)
    {
      this.lowXLim = dataSet.get(Vector2.minXIndexByLength(dataSet, getShorterLength())).x;
      this.lowYLim = dataSet.get(Vector2.minYIndexByLength(dataSet, getShorterLength())).y;
      this.highXLim = dataSet.get(Vector2.maxXIndexByLength(dataSet, getShorterLength())).x;
      this.highYLim = dataSet.get(Vector2.maxYIndexByLength(dataSet, getShorterLength())).y;
      println(this.lowXLim);
    }
    
    // Has to be first to ensure drawn at correct location
    updateDrawOrigin();
    
    fill(theme.pallet[5]);
    textSize(10);
    float yCoeff = (abs(this.highYLim - this.lowYLim) / this.yInterval);
    float xCoeff = (abs(this.highXLim - this.lowXLim) / this.xInterval);
    for (int y = 1; y < this.yInterval; y++)
    {
      text(String.valueOf(Math.round((yCoeff * y + this.lowYLim) * 100.0) / 100.0), this.drawOrigin.x + this.dimension.x - this.padding * 4, this.drawOrigin.y + (this.dimension.y - this.padding) - ((this.dimension.y - this.padding) / this.yInterval) * y);
    }
    
    for (int x = 0; x < this.xInterval - 1; x++)
    {
      text(String.valueOf(Math.round((xCoeff * x + this.lowXLim) * 100.0) / 100.0), this.drawOrigin.x + this.padding + ((this.dimension.x) / this.xInterval) * x, this.drawOrigin.y + this.dimension.y - this.padding);
    }
    
    strokeCap(SQUARE);
    stroke(theme.pallet[this.lineColorIndex]);
    strokeWeight(this.lineStrokeWeight);
    for (int i = this.dataSet.size() - getShorterLength() + 1; i < this.dataSet.size(); i++)
    {
      float x1 = (((this.dataSet.get(i-1).x - this.lowXLim) / abs(this.highXLim - this.lowXLim)) * (this.dimension.x - this.padding * 3)) + this.drawOrigin.x + this.padding * 2;
      float y1 = this.drawOrigin.y + this.dimension.y - (((this.dataSet.get(i-1).y - this.lowYLim) / abs(this.highYLim - this.lowYLim)) * (this.dimension.y - this.padding * 2)) - this.padding;
      float x2 = (((this.dataSet.get(i).x - this.lowXLim) / abs(this.highXLim - this.lowXLim)) * (this.dimension.x - this.padding * 3)) + this.drawOrigin.x + this.padding * 2;
      float y2 = this.drawOrigin.y + this.dimension.y - (((this.dataSet.get(i).y - this.lowYLim) / abs(this.highYLim - this.lowYLim)) * (this.dimension.y - this.padding * 2)) - this.padding;
      line(x1, y1, x2, y2);
    }
    
    strokeWeight(this.lineStrokeWeight * 2.5);
    for(int i = this.dataSet.size() - getShorterLength(); i < this.dataSet.size(); i++)
    {
      float x = (((this.dataSet.get(i).x - this.lowXLim) / abs(this.highXLim - this.lowXLim)) * (this.dimension.x - this.padding * 3)) + this.drawOrigin.x + this.padding * 2;
      float y = this.drawOrigin.y + this.dimension.y - (((this.dataSet.get(i).y - this.lowYLim) / abs(this.highYLim - this.lowYLim)) * (this.dimension.y - this.padding * 2)) - this.padding;
      rect(x, y, 0, 0);
    }
    
    fill(theme.pallet[2]);
    textSize(11);
    text(this.xLable, this.drawOrigin.x + (this.dimension.x - textWidth(this.xLable)) / 2, this.drawOrigin.y + this.dimension.y + this.padding);
    text(this.yLable, this.drawOrigin.x, this.drawOrigin.y + (this.dimension.y / 2));
    strokeWeight(1);
    line(this.drawOrigin.x + this.padding, this.drawOrigin.y + this.dimension.y - this.padding / 2, 
      this.drawOrigin.x + this.dimension.x - this.padding, this.drawOrigin.y + this.dimension.y - this.padding / 2);
    
    // has to be last to make sure parent get drawn first
    super.update();
  }
  
  @Override
  public boolean mouseOver()
  {
     if (mouseX <= drawOrigin.x + dimension.x && mouseX >= drawOrigin.x && mouseY <= drawOrigin.y + dimension.y && mouseY >= drawOrigin.y)
    {
      return true;
    }
    return false;
  }
}
