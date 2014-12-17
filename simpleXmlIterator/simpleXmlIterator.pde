//load the whole xml file
XML xml = loadXML("shrek.xml");
//get only the child we want
XML movieXML =xml.getChild("movie");
//get array of the attibutes for this child
String[] attributes = movieXML.listAttributes();
//iterate through these atributes and print to screen
for(int i = 0; i < movieXML.getAttributeCount(); i ++){
  println(attributes[i] + ": "+ movieXML.getString(attributes[i]));
  
}
