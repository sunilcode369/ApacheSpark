package tutorial1;

import java.util.Arrays;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FlatMapFunction;

// Map Example
public class FlatMapExample {
	
	public static void main(String args[]) {
		
        SparkConf sparkConf  = new SparkConf().setAppName("sparktest");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        
        /* File consists of 
           sunil,deepa
           kavin,suganya */
        
        JavaRDD<String> lines = sc.textFile("sample.txt",2);
        
            // Normal Way	
            JavaRDD<String> words3 = lines.flatMap( new FlatMapFunction<String,String>() 
					{
				public Iterable<String> call (String s) {
															return Arrays.asList(s.split(","));   
														} 
					});
            
            
            // Java 8 Lambda Style
            JavaRDD<String> words4 = lines.flatMap(line -> Arrays.asList(line.split(",")));
            
        
        System.out.println(words3.collect());
        System.out.println(words4.collect());

        sc.close();
	}

}
