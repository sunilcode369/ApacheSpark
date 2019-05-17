package tutorial1;

import java.util.Arrays;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

import scala.Tuple2;

// Map Example
public class WordCount {
	
	public static void main(String args[]) {
		
        SparkConf sparkConf  = new SparkConf().setAppName("sparktest");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        JavaRDD<String> lines = sc.textFile("sample.txt",2);

        /* File consists of 
           sunil,deepa
           kavin,suganya */
        
        
            // Java 8 Lambda Style
        JavaRDD<String> words = lines.flatMap(line -> Arrays.asList(line.split(",")));
        JavaPairRDD<String,Integer> wordsSplitCount = words.mapToPair(line-> new Tuple2(line,1));
        JavaPairRDD splitWords = wordsSplitCount.reduceByKey((word,num)-> word + num);
        
        
        System.out.println(splitWords.collect());        
        
        
        sc.close();
	}

}
