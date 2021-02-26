public class Vector2Int
{
  public int x, y;
  Vector2Int(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  public static Vector2Int add(Vector2Int v, Vector2Int v2)
  {
    return new Vector2Int(v.x + v2.x, v.y + v2.y);
  }
  
  public static  Vector2Int sub(Vector2Int v, Vector2Int v2)
  {
    return new Vector2Int(v.x - v2.x, v.y - v2.y);
  }
  
  public static Vector2Int multiply(Vector2Int v, Vector2Int v2)
  {
    return new Vector2Int(v.x * v2.x, v.y * v2.y);
  }
  
  public static Vector2Int divide(Vector2Int v, Vector2Int v2)
  {
    return new Vector2Int(v.x / v2.x, v.y / v2.y);
  }
  
  public float distance(Vector2Int v)
  {
    return (float) Math.sqrt(Math.pow(v.x - this.x, 2) + Math.pow(v.y - this.y, 2));
  }
  
  @Override
  public String toString()
  {
    return "X: " + this.x + " Y: " + this.y;
  }
}
