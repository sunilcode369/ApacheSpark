package hiveudf.dateConversion;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.hadoop.hive.ql.exec.UDF;


/**
 * Hello world!
 *
 */
public class App extends UDF
{
    public static String evaluate ( String input ) throws ParseException  {
    	
    	// Date Formats
    	//1904287	Christopher Rodriquez	Jan 11, 2003
    	//96391595	Thomas Stewart	6/17/1969
    	//2236067	John Nelson	08/22/54
    	
    	//String input = "08/22/54" ;
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat inputFormat;
		Date dt;	
    	
    	int assign = -1;
    	String[] splits = input.trim().split("/");

    	if (splits.length == 3) {
    		
    		if (splits[2].length() == 4)
    			assign = 2;
    		else
    			assign = 1;
    	} else { // string format
    		assign = 0;
    	}
    	
    	String changedDate = null;
    	switch (assign) {
    	
    	case 0:
    		inputFormat = new SimpleDateFormat("MMMM d, yyyy");
    		break;
    		
    	case 1:
    		inputFormat = new SimpleDateFormat("MM/dd/yy");
    		break;    		
    	case 2:
    	default:	
    		inputFormat = new SimpleDateFormat("MM/dd/yyyy");
    		break;
    	}
    	
		dt = inputFormat.parse(input.trim());
		changedDate = outputFormat.format(dt);
        	
    	return changedDate;
    }
}
    	 
    	
  
