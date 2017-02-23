package WCMulOut;
// Learning MapReduce by Nitesh Jain
import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
//import org.apache.hadoop.mapred.lib.MultipleOutputs;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.output.MultipleOutputs;

public class WordCountReducer extends
		Reducer<Text, IntWritable, Text, IntWritable> {
	
	// private object of type MultipleOutputs
	private MultipleOutputs<Text, IntWritable> multipleOutputs;
	
	// setup --> reducer method ---> cleanup method runs in this order
	@Override
	public void setup(Context context)
			throws IOException, InterruptedException {
		multipleOutputs = new MultipleOutputs<Text, IntWritable>(context);
	}
	
	@Override
	public void reduce(Text key, Iterable<IntWritable> values, Context context)
			throws IOException, InterruptedException {

		int sum = 0;
		for (IntWritable value : values) {
			sum += value.get();
		}
		// Take key value (word) , count and write ONLY to the file as defined by the 3rd arg 
		multipleOutputs.write(key, new IntWritable(sum), key.toString().substring(0,1));
		
	}

	@Override
	public void cleanup(Context context)
			throws IOException, InterruptedException {
		multipleOutputs.close();
	}
	
}