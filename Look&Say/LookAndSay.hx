package fr.tekvila.inseq ;
import haxe.io.Output;

/**
 * @class LookAndSay
 * A bunch of Look-and-say sequence algorithms
 * AKA Conway sequence or Morris number sequence.
 * @author TekVila
 */
class LookAndSay
{
	private var output : Output;
	
	/**
	 * 	@brief Constructor
	 *  @param output 		the stream wherein the sequence is sent.
	 */
	public function new(output:Output) 
	{
		this.output = output;
	}
	
	/** 
	 *  @brief Classic Look-and-say sequence
	 *  1
	 *  11
	 *  21
	 *  1211
	 *  ...
	 *  @param start 		the string to begin with.
	 *  @param lastline 	the number of line to reach.
	 *  @param displayall 	the number of line to reach.
	 */
	public function Classic ( start : String = "3", lastline : Int = 13, displayall : Bool = true) {
		var res : String = start;
		for (i in 1...lastline) {
			if (displayall) output.writeString(res+"\n");
			var rep : String = "";
			var prev : String = "";
			var count : Int = 1;
			var cur : String;
			for (d in 0...res.length) {
				cur = res.charAt(d);
				if (cur == prev) {
					count++;
				} else {
					if (prev != "") rep+= "" + count + prev;
					count = 1;
				}
				prev = cur;
			}
			rep+= "" + count + cur;
			res = rep;
		}
		output.writeString(res+"\n");
	}
	
	/** 
	 *  @brief Space separated Look-and-say sequence
	 *  1
	 *  1 1
	 *  2 1
	 *  1 2 1 1
	 *  ...
	 *  @param start 		the string to begin with.
	 *  @param lastline 	the number of line to reach.
	 *  @param displayall 	the number of line to reach.
	 */
	public function Spaced ( start : String = "3", lastline : Int = 13, displayall : Bool = true) {
		var res : String = start;
		var r = ~/[ ]+/g;
		for (i in 1...lastline) {
			if (displayall) output.writeString(res+"\n");
			var rep : String = "";
			var line = r.split(res);
			var prev : String = "";
			var count : Int = 0;
			var cur : String = "";
			for ( cur in line) {
				if (cur == prev) {
					count++;
				} else {
					if (prev != "") rep+= "" + count + " " + prev + " ";
					count = 1;
				}
				prev = cur;
			}
			rep+= "" + count + " " + prev;
			res = rep;
		}
		output.writeString(res+"\n");
	}
	
}