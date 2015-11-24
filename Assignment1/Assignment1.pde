/*
 Caoimhe Harvey
 C14724965
 
 Computer Science International DT282-2
 
 Object Oriented Programming - Assignment 1
 */
ArrayList<MSstock> microStock = new ArrayList<MSstock>();

void setup()
{
  size(700, 700);

  loadMSdata();
  //loadORCdata;
  //loadAPLdata; 
  //loadIBMdata;
}

float border;
float lineWidth;
float lowest_gdp;
float dataRange;
float graphHeight;
float x_axis_height;

void loadMSdata()
{
  String[] lines = loadStrings("microsoft.csv");

  for (int i = 0; i < lines.length; i++)
  {
    MSstock msstock = new MSstock(lines[i]);
    microStock.add(msstock);
  }
}


void drawLineGraph()
{
  // Find highest and lowest GDPs. Used for mapping line grpah
  float highest = microStock.get(0).price;
  int highestIndex = 0;
  float lowest = microStock.get(0).price;
  int lowestIndex = 0;

  for (int i = 1; i < microStock.size (); i++)
  {
    MSstock msstock = microStock.get(i);

    if (msstock.price > highest)
    {
      highest = msstock.price;
      highestIndex = i;
    }

    if (msstock.price < lowest)
    {
      lowest = msstock.price;
      lowestIndex = i;
    }
  }

  lowest_gdp = microStock.get(lowestIndex).price;
  dataRange = microStock.get(highestIndex).price;

  // Set border width to be 10% of window size
  border = width * 0.1f;
  // Determine area of window to draph graph - horizontal
  float windowRange = (width - (border * 2.0f));
  // Determine width between each point on graph
  lineWidth = windowRange / (float) (microStock.size() - 1);
  // Determine area of window to draph graph - vertical
  graphHeight = (height - (border * 2.0f));
  x_axis_height = height - border;

  // Draw axis'
  stroke(255);
  line(border - 15, x_axis_height, width - border, x_axis_height);
  line(border, border, border, height - (border - 15));

  strokeWeight(3);
  stroke(70, 100, 150);

  // Draw line graph
  for (int i = microStock.size() - 1; i >= 1; i -- )
  { 
    float x1 = border + ((i + 1) * lineWidth);
    float x2 = border + (i * lineWidth);

    // Use map function to ensure lines fit exactly in size of graph 
    float y1 = map(microStock.get(i).price, lowest_gdp, dataRange, x_axis_height, (x_axis_height) - graphHeight);
    float y2 = map(microStock.get(i - 1).price, lowest_gdp, dataRange, x_axis_height, (x_axis_height) - graphHeight);

    line(x1, y1, x2, y2);
  }
}

void draw()
{
  background(0);

  drawLineGraph();

  stroke(255, 0, 0);
  strokeWeight(2);

  // If mouse is within graph area, show red line
  if (mouseX > border && mouseX < (width - border))
  {
    line(mouseX, border, mouseX, x_axis_height);
  }
  /*
  // Determine which year the mouse is in
  int x = (int) ((mouseX - border) / lineWidth);

  if (x >= 0 && x < msStock.size())
  {
    int year = gdps.get(x).year;
    float gdp = gdps.get(x).GDP_amount;

    // Determine y coordinate of ellipse in relation to line graph
    float y = map(gdps.get(x).GDP_amount, lowest_gdp, dataRange, x_axis_height, (x_axis_height) - graphHeight);

    fill(255, 0, 0);
    ellipse(mouseX, y, 10, 10);
  }
  */
}


