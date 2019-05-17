package tutorial1;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;


import scala.Function;
import scala.Tuple2;

public class CombineByKey {
	
public static void main(String args[]) {
		
        SparkConf sparkConf  = new SparkConf().setAppName("sparktest");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        JavaRDD<String> lines = sc.textFile("sample3.txt",3);         // Note : the RDD data is split into 3 partitions 

    
        /* File consists of marks and name
1,sunil
1,sunil
1,sunil
1,sunil
2,deepa
2,deepa
2,deepa
3,kavin
4,naresh
		*/
        
        JavaPairRDD<String,String> pairs = lines.mapToPair(line-> {
        							String values[] = line.split(",");
        							return new Tuple2(values[0],values[1]);
        				});  // ==> Results in (1,sunil) , (1,sunil) .... 
        
        pairs.combineByKey( v -> new Tuple2(v,1), // ((1,sunil),1)
        					(key,value) -> new Tuple2(key,value+1),  //  (1,sunil),2) <-- From partition 1
        															 //  (1,sunil),3) <-- From partition 2
        					(t1,t2) -> new Tuple2( t1._2 + t2._2) );	
;

            // Java 8 Lambda Style
        System.out.println(pairs.groupByKey().collect());        
        sc.close();
	}

}
