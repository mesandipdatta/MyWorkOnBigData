// Wikipedia page view extractor
// This MapReduce code will read Wikipedia dataset dumps.
// The dump contains - Domain_Code , Page_title , count_views , Total_response_size 
// And then extracts the Top 10 English domain (en) pages which has maximum no. of count_views   
package WikipediaMR;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class WikipediaPageView {

	public static void main(String[] args) throws Exception {
		if (args.length != 2) {
			System.err.println("Usage: WikipediaPageView <input path> <output path>");
			System.exit(-1);
		}
		
		// MapReduce job info
		Job job = new Job();
		job.setJarByClass(WikipediaPageView.class);
		job.setJobName("Wikipedia Page View Count");

		// input and output from the MapReduce
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));

		// Mapper & Reducer class names
		job.setMapperClass(WikipediaPageViewMapper.class);
		job.setReducerClass(WikipediaPageViewReducer.class);
		
		// Output Key and value definition
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(Text.class);

		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}
}