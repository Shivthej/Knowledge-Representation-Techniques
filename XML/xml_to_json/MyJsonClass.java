import org.json.*;
import java.io.*;


/**
  * Name    : Annu Kuriakose <br/>
  * Course  : ISTE 610.01 <br/>
  * Homework: hw7createJSONfromXML<br/>
  * Date    : 04/19/2016<br/>
  *
  * Purpose : <b><i>This program converts the hardcoded xml file to Json Object, 
  *                 then converts the Json Object to a pretty printed string 
  *                 and prints it out to the console </b></i></br>
  *
  *
  * @param  xmlFile  Parameter to store xml file name.
  * @param  jsonObj   Parameter to store Json Object.
  * @param  INDENT      Indendation parameter.
  * @param  pw       PrintWriter object to write to file.
  *
  * date: 04/19/2016.
  *@author: Annu Kuriakose
  *@version:1.0
  *
  */

public class MyJsonClass{
   
   private File xmlFile = null;
   private JSONObject jsonObj;
   private static int INDENT =4;
   PrintWriter pw;
      
   public MyJsonClass(){
      
      int input = 0;
      String xml;
      String jsonPrettyPrintString;
      StringBuilder xmlBuilder = new StringBuilder();
      
      //Hard coding the file name to be read. This has to to in same location as the java/class files
      xmlFile = new File("annu.xml");
      
      //the below code segment read the xml file and writes it to a string Builder object.
      try{
         InputStream is = new FileInputStream(xmlFile);
         
         while((input = is.read()) != -1){
            xmlBuilder.append((char)input);
         }
      }catch(FileNotFoundException fe){
         System.out.println("catch FileNotFound: "+fe);
      }catch(IOException ie){
         System.out.println("catch IO: "+ie);
      }
      
      //converting StringBuilder to String.
      xml = xmlBuilder.toString();
      
      
      try{
         
         //converting the XML String to JSON object and applying indentation.
         jsonObj = XML.toJSONObject(xml);   
         jsonPrettyPrintString = jsonObj.toString(INDENT);
         
         //printing out the JSON prettyPrinted String to console
         System.out.println(jsonPrettyPrintString);
         
         //Writing the json Object to an output file. 
         pw = new PrintWriter("JSONoutput.json");
         pw.println(jsonPrettyPrintString);
         pw.close();
         
      }catch(JSONException je){
         System.out.println("catch JSONException: "+je);
      }catch(FileNotFoundException je){
         System.out.println("catch JSONException: "+je);
      }catch(Exception je){
         System.out.println("catch JSONException: "+je);
      }
      
   }
   
   //main to initialize the class
   public static void main(String[] args){
      
      new MyJsonClass();
   
   }

}