/*
 Caoimhe Harvey
 C14724965
 
 Computer Science International DT282-2
 
 Object Oriented Programming - Assignment 1
 */
MSstock[] msft = new MSstock[100];
APLstock[] aapl = new APLstock[100];
ORCstock[] orcl = new ORCstock[100];

void setup() 
{
  loadData();

  minVals[0] = min(msft);
  minVals[1] = min(aapl);
  minVals[2] = min(orcl);

  maxVals[0] = max(msft);
  maxVals[1] = max(aapl);
  maxVals[2] = max(orcl);

  border = width * 0.1f;
}

void loadData()
{
  String[] lines = loadStrings("microsoft.csv");
  String[] lines1 = loadStrings("apple.csv");
  String[] lines2 = loadStrings("oracle.csv");

  for (int i = 0; i < lines.length && i < lines1.length && i < lines2.length; i++)
  {
    MSstock msstock = new MSstock(lines[i]);

    APLstock aplstock = new APLstock(lines[i]);

    ORCstock orcstock = new ORCstock(lines[i]);
  }
}

void showGraphs()
{
  switch(keyPressed)
  {
  case 0:
    msftGraph(msft, min(minVals), max(maxVals));
    aaplGraph(aapl, min(minVals), max(maxVals));
    orclGraph(orcl, min(minVals), max(maxVals));
    break;
  case 1:
    msftGraph(msft, min(msft), max(msft));
    break;
  case 2:
    aaplGraph(aapl, min(aapl), max(aapl));
    break;
  case 3:
    orclGraph(orcl, min(orcl), max(orcl));
    break;
  default:
    keyPressed = 0;
  }
}

float[] minVals = new minVals[3];
float[] maxVals = new maxVals[3];
float border;

void draw()
{
  background(0);
  drawAxis();
  showGraphs();
}

void drawAxis()
{
  stroke(255);  
  line(border - 5, height - border, width - border, height - border);
  line(border, border, border, height - border + 5);
}

void msftGraph(MSstock[] data, float mini, float maxi)
{
  for (int i = 1; i < data.size (); i ++)
  {
    stroke(0, 255, 255);
    float x1 = map(i - 1, 0, data.size() - 1, border, width - border);
    float y1 = map(data.get(i - 1).amount, min, max, height - border, border);
    float x2 = map(i, 0, data.size() - 1, border, width - border);
    float y2 = map(data.get(i).amount, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

void aaplGraph(APLstock[] data, float mini, float maxi)
{
  for (int i = 1; i < data.size (); i ++)
  {
    stroke(0, 255, 255);
    float x1 = map(i - 1, 0, data.size() - 1, border, width - border);
    float y1 = map(data.get(i - 1).amount, min, max, height - border, border);
    float x2 = map(i, 0, data.size() - 1, border, width - border);
    float y2 = map(data.get(i).amount, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

void orclGraph(ORCstock[] data, float mini, float maxi)
{
  for (int i = 1; i < data.size (); i ++)
  {
    stroke(0, 255, 255);
    float x1 = map(i - 1, 0, data.size() - 1, border, width - border);
    float y1 = map(data.get(i - 1).amount, min, max, height - border, border);
    float x2 = map(i, 0, data.size() - 1, border, width - border);
    float y2 = map(data.get(i).amount, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

