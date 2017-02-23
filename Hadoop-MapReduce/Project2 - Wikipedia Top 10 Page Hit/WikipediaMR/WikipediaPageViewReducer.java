package WikipediaMR;
// Wikipedia Reducer 
import java.io.IOException;
import java.util.Iterator;
import java.util.TreeMap;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class WikipediaPageViewReducer extends
		Reducer<Text,Text, Text,Text> {
		
	private static int N = 10 ;
	private static final TreeMap<Text, Text> TopKMap = new TreeMap <Text, Text>(); 

    @Override
    public void reduce (Text key, Iterable<Text> values, Context context)
                throws IOException, InterruptedException {

           for (Text value : values) {
               TopKMap.put(new Text(key), new Text(value));
               if (TopKMap.size() > N) {
                  TopKMap.remove(TopKMap.firstKey()) ;
               }
           }


    } //~reduce

    @Override
    protected void cleanup(Context context) throws IOException, InterruptedException {
           for (Text k : TopKMap.keySet()) {
                context.write(k, TopKMap.get(k));
           } 
    } //~cleanup

 } // ReduceClass
	


