/*
 Caoimhe Harvey
 C14724965
 
 Computer Science International DT282-2
 
 Object Oriented Programming - Assignment 1
 */
ArrayList<MSstock> msft = new ArrayList<MSstock>();
ArrayList<APLstock> aapl = new ArrayList<APLstock>();
ArrayList<ORCstock> orcl = new ArrayList<ORCstock>();

void setup() 
{
  size(700, 700);
  loadData();

  border = width * 0.1f;

  minVals[0] = findMin(msft);
  minVals[1] = findMin(aapl);
  minVals[2] = findMin(orcl);

  maxVals[0] = findMax(msft);
  maxVals[1] = findMax(aapl);
  maxVals[2] = findMax(orcl);
}

void loadData()
{
  String[] lines = loadStrings("microsoft.csv");
  String[] lines1 = loadStrings("apple.csv");
  String[] lines2 = loadStrings("oracle.csv");

  for (int i = 0; i < lines.length; i++)
  {
    MSstock msstock = new MSstock(lines[i]);
    msft.add(msstock);

    APLstock aplstock = new APLstock(lines1[i]);
    aapl.add(aplstock);

    ORCstock orcstock = new ORCstock(lines2[i]);
    orcl.add(orcstock);
  }
}

float findMin(ArrayList data)
{
  float min = ((Stock) data.get(0)).price;
  for (int i = 1; i < data.size (); i++)
  {
    if (((Stock) data.get(i)).price < min)
    {
      min = ((Stock) data.get(i)).price;
    }
  }
  println("minimum is: " + min);
  return min;
}

float findMax(ArrayList data)
{
  float max = ((Stock) data.get(0)).price;
  for (int i = 1; i < data.size (); i++)
  {
    if (((Stock) data.get(i)).price > max)
    {
      max = ((Stock) data.get(i)).price;
    }
  }
  println("maximum is: " + max);
  return max;
}

float[] minVals = new float[3];
float[] maxVals = new float[3];
float border;

void draw()
{
  background(0);
  drawAxis();
  // showGraphs();
  drawGraph(aapl, minVals[1], maxVals[1]);
  drawGraph(aapl, min(minVals), max(maxVals));
  drawGraph(orcl, min(minVals), max(maxVals));
}

void drawAxis()
{
  stroke(255);  
  line(border - 5, height - border, width - border, height - border);
  line(border, border, border, height - border + 5);
}
/*
void showGraphs()
{
  switch(k)
  {
  case 0:
    drawGraph(msft, min(minVals), max(maxVals));
    drawGraph(aapl, min(minVals), max(maxVals));
    drawGraph(orcl, min(minVals), max(maxVals));
    break;
  case 1:
    drawGraph(msft, minVals[0], maxVals[0]);
    break;
  case 2:
    drawGraph(aapl, minVals[1], maxVals[1]);
    break;
  case 3:
    drawGraph(orcl, minVals[2], maxVals[2]);
    break;
  }
}
*/

void drawGraph(ArrayList data, float min, float max)
{
  for (int i = 1; i < data.size (); i ++)
  {
    stroke(0, 255, 255);
    float x1 = map(i - 1, 0, data.size() - 1, border, width - border);
    float y1 = map(((Stock) data.get(i - 1)).price, min, max, height - border, border);
    float x2 = map(i, 0, data.size() - 1, border, width - border);
    float y2 = map(((Stock) data.get(i)).price, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
}

void keyPressed()
{
}

