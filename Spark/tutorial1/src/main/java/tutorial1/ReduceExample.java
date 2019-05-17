package tutorial1;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

public class ReduceExample {
	
	public static void main(String args[]) {
		
        SparkConf sparkConf  = new SparkConf().setAppName("sparktest");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        JavaRDD<String> lines = sc.textFile("sample.txt",2);

        /* File consists of 
           sunil,deepa
           kavin,suganya */
        
        
            // Java 8 Lambda Style
        String words = lines.reduce( (word1,word2 )-> word1+"<tag>"+word2);
        System.out.println(words);        
        sc.close();
	}

}
