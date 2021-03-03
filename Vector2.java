import java.util.ArrayList;

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
  
  public Vector2 clone()
  {
     return new Vector2(x, y);
  }
  
  public static int maxXIndex(ArrayList<Vector2> v)
  {
    float max = v.get(0).x;
    int maxIndex = 0;
    for (int i = 0; i < v.size(); i++)
    {
      if (v.get(i).x > max)
      {
        max = v.get(i).x;
        maxIndex = i;
      }
    }
    return maxIndex;
  }
  
  public static int minXIndex(ArrayList<Vector2> v)
  {
    float min = v.get(0).x;
    int minIndex = 0;
    for (int i = 0; i < v.size(); i++)
    {
      if (v.get(i).x < min)
      {
        min = v.get(i).x;
        minIndex = i;
      }
    }
    return minIndex;
  }
  
  public static int maxXIndexByLength(ArrayList<Vector2> v, int length)
  {
    float max = v.get(v.size() - length).x;
    int maxIndex = v.size() - length;
    for (int i = v.size() - length; i < v.size(); i++)
    {
      if (v.get(i).x > max)
      {
        max = v.get(i).x;
        maxIndex = i;
      }
    }
    return maxIndex;
  }
  
  public static int minXIndexByLength(ArrayList<Vector2> v, int length)
  {
    float min = v.get(v.size() - length).x;
    int minIndex = v.size() - length;
    for (int i = v.size() - length; i < v.size(); i++)
    {
      if (v.get(i).x < min)
      {
        min = v.get(i).x;
        minIndex = i;
      }
    }
    return minIndex;
  }
  
  public static int maxYIndex(ArrayList<Vector2> v)
  {
    float max = v.get(0).y;
    int maxIndex = 0;
    for (int i = 0; i < v.size(); i++)
    {
      if (v.get(i).y > max)
      {
        max = v.get(i).y;
        maxIndex = i;
      }
    }
    return maxIndex;
  }
  
  public static int minYIndex(ArrayList<Vector2> v)
  {
    float min = v.get(0).y;
    int minIndex = 0;
    for (int i = 0; i < v.size(); i++)
    {
      if (v.get(i).y < min)
      {
        min = v.get(i).y;
        minIndex = i;
      }
    }
    return minIndex;
  }
  
  public static int maxYIndexByLength(ArrayList<Vector2> v, int length)
  {
    float max = v.get(v.size() - length).y;
    int maxIndex = v.size() - length;
    for (int i = v.size() - length; i < v.size(); i++)
    {
      if (v.get(i).y > max)
      {
        max = v.get(i).y;
        maxIndex = i;
      }
    }
    return maxIndex;
  }
  
  public static int minYIndexByLength(ArrayList<Vector2> v, int length)
  {
    float min = v.get(v.size() - length).y;
    int minIndex = v.size() - length;
    for (int i = v.size() - length; i < v.size(); i++)
    {
      if (v.get(i).y < min)
      {
        min = v.get(i).y;
        minIndex = i;
      }
    }
    return minIndex;
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
