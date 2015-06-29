#ifndef _LUKANSAI_H
# define _LUKANSAI_H

#include <iostream>
#include <sstream>
#include <string>

/**
 * @namespace LookAndSay
 * A bunch of Look-and-say sequence algorithms
 * AKA Conway sequence or Morris number sequence.
 */
namespace LookAndSay {

	std::string intToString (const int n) {
		std::stringstream ss;
		ss << n;
		return ss.str();
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
	 *  @param output 		the stream wherein the sequence is sent.
	 *  @param displayall 	the number of line to reach.
	 */
	void Classic (const std::string start = "3", const int lastline = 13, std::ostream& output = std::cout, bool displayall = true) {
		std::string res = start;
		for (int i = 1; i < lastline; i++) {
			if (displayall) output << res << std::endl;
			std::string rep;
			char prev = 0;
			int count = 1;
			char cur;
			for (int d = 0; d < res.length() ; d++) {
				cur = res[d];
				if (cur == prev) {
					count++;
				} else {
					if (prev != 0) rep+= intToString(count) + prev;
					count = 1;
				}
				prev = cur;
			}
			rep+= intToString(count) + cur;
			res = rep;
		}
		output << res << std::endl;
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
	 *  @param output 		the stream wherein the sequence is sent.
	 *  @param displayall 	the number of line to reach.
	 */
	void Spaced (const std::string start = "5", const int lastline = 10, std::ostream& output = std::cout, bool displayall = true) {
		std::string res = start;
		for (int i = 1; i < lastline; i++) {
			if (displayall) output << res << std::endl;
			std::string rep;
			std::istringstream line(res);
			int prev = 0;
			int count = 0;
			int cur;
			while ( !line.eof() ) {
				line >> cur;
				if (cur == prev) {
					count++;
				} else {
					if (prev != 0) rep+= intToString(count) + " " + intToString(prev) + " ";
					count = 1;
				}
				prev = cur;
			}
			rep+= intToString(count) + " " + intToString(cur);
			res = rep;
		}
		output << res << std::endl;
	}
	
	/*void PeaPattern (const std::string start = "5", const int lastline = 10, std::ostream& output = std::cout, bool displayall = true) {
		
	}
	
	void AscendingPeaPattern (const std::string start = "5", const int lastline = 10, std::ostream& output = std::cout, bool displayall = true) {
		
	}*/

}

#endif