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
  println(minVals[0]);
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
  int minIndex = 0;
  for(int i = 1; i < data.size(); i++)
  {
    if(((Stock) data.get(i)).price < min)
    {
      min = ((Stock) data.get(i)).price;
      minIndex = i;
    }
  }
  println("minimum is: " + min);
  return min;
}

float[] minVals = new float[3];
float[] maxVals;
float border;

void draw()
{
  background(0);
  drawAxis();
  //showGraphs();
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
  }
}
*/

