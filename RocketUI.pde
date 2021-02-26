void setup()
{
  surface.setResizable(true);
  size(800, 600);
  frameRate(Env.fps);
  
  textFont(createFont("venus rising rg.ttf", 32));
  
  
  DRectUI ui = new DRectUI(new Vector2(10, 10), new Vector2Int(300, 250), "Status Panel");
  TextUI boxLable = new TextUI(new Vector2(10, 10), new Vector2(0, 60), "Feed", 12, 5);
  RectUI box = new RectUI(new Vector2(10, 10), new Vector2Int(280, 100), new Vector2(10, 80), 1, 2);
  TextUI text1 = new TextUI(new Vector2(10, 10), new Vector2(10, 90), "12 : 89 : 32", 10, 2);
  TextUI text12 = new TextUI(new Vector2(10, 10), new Vector2(10, 110), "13 : 39 : 22", 10, 3);
  TextUI text13 = new TextUI(new Vector2(10, 10), new Vector2(10, 130), "32 : 45 : 12", 10, 3);
  TextUI text14 = new TextUI(new Vector2(10, 10), new Vector2(10, 150), "18 : 09 : 62", 10, 2);
  
  TextUI text2 = new TextUI(new Vector2(10, 10), new Vector2(100, 90), "12 : 89 : 32", 10, 5);
  TextUI text22 = new TextUI(new Vector2(10, 10), new Vector2(100, 110), "13 : 39 : 22", 10, 1);
  TextUI text23 = new TextUI(new Vector2(10, 10), new Vector2(100, 130), "32 : 45 : 12", 10, 1);
  TextUI text24 = new TextUI(new Vector2(10, 10), new Vector2(100, 150), "18 : 09 : 62", 10, 1);
  
  TextUI text3 = new TextUI(new Vector2(10, 10), new Vector2(190, 90), "12 : 89 : 32", 10, 4);
  TextUI text32 = new TextUI(new Vector2(10, 10), new Vector2(190, 110), "13 : 39 : 22", 10, 4);
  TextUI text33 = new TextUI(new Vector2(10, 10), new Vector2(190, 130), "32 : 45 : 12", 10, 4);
  TextUI text34 = new TextUI(new Vector2(10, 10), new Vector2(190, 150), "18 : 09 : 62", 10, 6);
  
  IndicatorUI isArmed = new IndicatorUI(new Vector2(10, 10), new Vector2(15, 210));
  IndicatorUI isConnected = new IndicatorUI(new Vector2(10, 10), new Vector2(15, 240));
  
  TextUI armedText = new TextUI(new Vector2(10, 10), new Vector2(30, 215), "ARMED", 15, 1);
  TextUI connectedText = new TextUI(new Vector2(10, 10), new Vector2(30, 245), "CONNECTED", 15, 1);
  
  ui.addChild(boxLable);
  ui.addChild(box);
  
  ui.addChild(text1);
  ui.addChild(text12);
  ui.addChild(text13);
  ui.addChild(text14);
  
  ui.addChild(text2);
  ui.addChild(text22);
  ui.addChild(text23);
  ui.addChild(text24);
  
  ui.addChild(text3);
  ui.addChild(text32);
  ui.addChild(text33);
  ui.addChild(text34);
  
  ui.addChild(isArmed);
  ui.addChild(isConnected);
  
  ui.addChild(armedText);
  ui.addChild(connectedText);
  
  isConnected.setFillColor(6);
}

int ticks = 0;

void draw()
{
  background(theme.pallet[0]);
  UILoop();
}
