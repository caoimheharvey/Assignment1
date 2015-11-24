class MSstock
{
  String date;
  Float price;
  
  MSstock(String line)
  {
    String[] parts = line.split(",");
    
    date = parts[0];
    price = Float.parseFloat(parts[4]);
  }
}
