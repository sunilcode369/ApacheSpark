package tutorial1;

import java.util.Arrays;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;


// Map Example
public class FilterExample {
	
	public static void main(String args[]) {
		
        SparkConf sparkConf  = new SparkConf().setAppName("sparktest");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        JavaRDD<String> lines = sc.textFile("sample.txt",2);

        /* File consists of 
           sunil,deepa
           kavin,suganya */
        
        
            // Java 8 Lambda Style
        JavaRDD<String> words = lines.filter(line -> line.contains("kavin"));
        System.out.println(words.collect());        
        
        
        sc.close();
	}

}
