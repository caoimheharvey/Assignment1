/*
Caoimhe Harvey
 C14724965
 Computer Science International - DT282/2
 Object Oriented Programming
 Assignment 1(version 2)
 
 Program is designed to allow the user to view the stock for 3 different companies. Program gives user the option to view graph for each company individually or compare them in the same graph. 
 Allows user to jump between the graphs dynamically.
 */

ArrayList<MSstock> msft = new ArrayList<MSstock>();
ArrayList<APLstock> aapl = new ArrayList<APLstock>();
ArrayList<ORCstock> orcl = new ArrayList<ORCstock>();

void setup()
{
  loadData();
}

/*
  method to load the data for all files
 */
void loadData()
{
  //microsoft
  String[] lines = loadStrings("microsoft.csv");
  for (int i = 0; i < lines.length; i++)
  {
    MSstock msstock = new MSstock(lines[i]);
    msft.add(msstock);
  }

  //apple
  lines = loadStrings("apple.csv");
  for (int i = 0; i < lines.length; i++)
  {
    APLstock aplstock = new APLstock(lines[i]);
    aapl.add(aplstock);
  }

  //oracle
  lines = loadStrings("oracle.csv");
  for (int i = 0; i < lines.length; i++)
  {
    ORCstock orcstock = new ORCstock(lines[i]);
    orcl.add(orcstock);
  }
}//end load data

float border; 
float gap; 
int lowestMsft, lowestAapl, lowestOrcl;
float dataRange; 
float graphHeight; 

/*
finds lowest value 
 */
int lowest(ArrayList<class> arr)
{
  float lowest = msft.get(0).price;
  int lowIndex = 0;

  for (int i = 1; i < msft.size (); i++)
  {
    if (msstock.price < lowest)
    {
      lowest = msstock.price;
      lowIndex = i;
    }//end if
  }//end for
}

