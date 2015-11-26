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
  size(700, 700, P3D);
  loadData();

  border = width * 0.1f;

  minVals[0] = findMin(msft);
  minVals[1] = findMin(aapl);
  minVals[2] = findMin(orcl);

  maxVals[0] = findMax(msft);
  maxVals[1] = findMax(aapl);
  maxVals[2] = findMax(orcl);

  for (int i = 0; i < colors.length; i++)
  {
    colors[i] = color(0, random(100, 255), random(100, 255));
  }
}

void draw()
{
  background(100);
  showGraphs();
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
  return max;
}

float[] minVals = new float[3];
float[] maxVals = new float[3];
float[] averages = new float[3];
float border;
boolean[] keys = new boolean[512];


void drawAxis()
{
  stroke(255);  
  line(border - 5, height - border, width - border, height - border);
  line(border, border, border, height - border + 5);
}


void drawGraph(ArrayList data, float min, float max)
{
  float x1, y1, x2, y2;
  for (int i = 1; i < data.size (); i ++)
  { 
    x1 = map(i - 1, 0, data.size() - 1, border, width - border);
    y1 = map(((Stock) data.get(i - 1)).price, min, max, height - border, border);
    x2 = map(i, 0, data.size() - 1, border, width - border);
    y2 = map(((Stock) data.get(i)).price, min, max, height - border, border);
    fill(255, 0, 0);
    line(x1, y1, x2, y2);


    if (mouseX >= x1 && mouseX <= x2)
    {      
      stroke(0); 
      fill(0);
      line(x1, border, x1, height - border);
      ellipse(x1, y1, 7, 7);  
      stroke(255);

      fill(255);
      text("Date: " + ((Stock) data.get(i - 1)).date, x1 + 10, y1);
      text("Closing($): " + ((Stock) data.get(i - 1)).price, x1 + 10, y1 + 10);
    }
  }
}

void showGraphs()
{
  keys[keyCode] = true;
  if (keys['0'])
  {
    drawAxis();
    stroke(255, 255, 0);
    drawGraph(msft, min(minVals), max(maxVals));
    stroke(255, 142, 101);
    drawGraph(aapl, min(minVals), max(maxVals));
    stroke(0, 225, 230);
    drawGraph(orcl, min(minVals), max(maxVals));

    fill(255);
    text("Microsoft, Oracle, Apple", width * 0.4f, border * 0.5f);
  }
  if (keys['1'])
  {
    drawAxis();
    stroke(255, 255, 0);
    drawGraph(msft, minVals[0], maxVals[0]);

    fill(255);
    text("Microsoft", width * 0.5f - 20, border * 0.5f);
  }
  if (keys['2'])
  {    
    drawAxis();
    stroke(255, 142, 101);
    drawGraph(aapl, minVals[1], maxVals[1]);

    fill(255);
    text("Apple", width * 0.5f - 20, border * 0.5f);
  }
  if (keys['3'])
  {
    drawAxis();
    stroke(0, 225, 230);
    drawGraph(orcl, minVals[2], maxVals[2]);

    fill(255);
    text("Oracle", width * 0.5f - 20, border * 0.5f);
  }
  if (keys['4'])
  {
    averages[0] = average(msft);
    averages[1] = average(aapl);
    averages[2] = average(orcl);
    drawBars(averages);
  }
  keys[keyCode] = false;
}

float average(ArrayList data)
{
  float sum = 0;
  float avg; 
  for (int i = 0; i < data.size (); i++)
  {
    sum = sum + ((Stock) data.get(i)).price;
  }

  avg = sum / (float) data.size();
  return avg;
}

color[] colors = new color[averages.length];

void drawBars(float[] arr)
{
  float barWidth = (width / (float) arr.length) - border;
  for (int i = 0; i < arr.length; i ++)
  {
    //stroke(colors[i]);
    fill(colors[i]);
    float x = (i * barWidth) + border;
    rect(x, height, barWidth, -arr[i] * 4);
  }//end for
}

