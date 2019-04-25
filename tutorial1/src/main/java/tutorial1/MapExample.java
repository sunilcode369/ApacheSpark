package tutorial1;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;

// Map Example
public class MapExample {
	
	public static void main(String args[]) {
		
        SparkConf sparkConf  = new SparkConf().setAppName("sparktest");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        
        /* File consists of 
           sunil,deepa
           kavin,suganya */
        
        JavaRDD<String> lines = sc.textFile("sample.txt",2);
        
        // Regular implementation - Capitalize each of the words
        
        // All the elements of the RDD is taken and the function is applied
            JavaRDD<String> words = lines.map( new Function<String,String>() 
        									{
        										public String call (String s){
        										return s.toUpperCase();}   } );
        
        
           // 1.8 way
            
            JavaRDD<String> words2 = lines.map( line -> line.toLowerCase());
        
        System.out.println(words.collect());
        System.out.println(words2.collect());
        sc.close();
	}

}
