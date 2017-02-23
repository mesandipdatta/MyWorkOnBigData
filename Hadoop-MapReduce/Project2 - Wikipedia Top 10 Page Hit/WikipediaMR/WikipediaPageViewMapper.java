package WikipediaMR;
// 
// Wikipedia Page View Mapper
import java.io.IOException;
import java.util.StringTokenizer;
import java.util.TreeMap;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class WikipediaPageViewMapper extends
		Mapper<Object, Text, Text, Text> {

	// Size of Output max. 
	private static int N = 10 ;
	private static String english = "en";
	private TreeMap<Integer, Text> TopKMap = new TreeMap<Integer, Text>();
	
	@Override
	public void map(Object key, Text value, Context context)
			throws IOException, InterruptedException {
		
		String line[] = value.toString().split("\\s");			
		
		if (line[0].equals(english)){ 
			// TopKMap(page view count , page name)
			String domainandpage = line[0] + "." + line[1];
			Text pageName     = new Text(domainandpage);
			//Text pageName     = new Text(line[1]);
			Integer viewCount = Integer.parseInt(line[2]);
			TopKMap.put(viewCount,pageName);				
			if (TopKMap.size() > N) {
				TopKMap.remove(TopKMap.firstKey());
			}
		 }
	}		

	
	//cleanup method
	protected void cleanup(Context context) throws IOException, InterruptedException {
	       for (Integer k : TopKMap.keySet()) {
	    	   context.write(new Text(k.toString()), TopKMap.get(k));
	       } 
	     } //~cleanup
	
}

//output - 123,google.com


