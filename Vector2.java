

public class Vector2
{
  public float x, y;
  Vector2(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  public static Vector2 add(Vector2 v, Vector2 v2)
  {
    return new Vector2(v.x + v2.x, v.y + v2.y);
  }
  
  public static  Vector2 sub(Vector2 v, Vector2 v2)
  {
    return new Vector2(v.x - v2.x, v.y - v2.y);
  }
  
  public static Vector2 multiply(Vector2 v, Vector2 v2)
  {
    return new Vector2(v.x * v2.x, v.y * v2.y);
  }
  
  public static Vector2 divide(Vector2 v, Vector2 v2)
  {
    return new Vector2(v.x / v2.x, v.y / v2.y);
  }
  
  public float distance(Vector2 v)
  {
    return (float) Math.sqrt(Math.pow(v.x - this.x, 2) + Math.pow(v.y - this.y, 2));
  }
  
  @Override
  public String toString()
  {
    return "X: " + this.x + " Y: " + this.y;
  }
}
