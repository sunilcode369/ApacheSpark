package tutorial1;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

import scala.Tuple2;

public class GroupByKey {
	
	public static void main(String args[]) {
		
        SparkConf sparkConf  = new SparkConf().setAppName("sparktest");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        JavaRDD<String> lines = sc.textFile("sample3.txt",2);
    
        /* File consists of 
			1,100
			2,50
			3,25
			1,100 
		*/
        
        JavaPairRDD<String,String> pairs = lines.mapToPair(line-> {
        							String values[] = line.split(",");
        							return new Tuple2(values[0],values[1]);
        				});
        
         
        
            // Java 8 Lambda Style
        System.out.println(pairs.groupByKey().collect());        
        sc.close();
	}

}
