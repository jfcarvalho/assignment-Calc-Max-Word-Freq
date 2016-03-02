#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
 attr_reader :highest_wf_count
 attr_reader :highest_wf_words
 attr_reader :content
 attr_reader :line_number
 
 def initialize(content, line_number)
	@content = content
	@line_number = line_number
	@highest_wf_words = Array.new
	@highest_wf_count = 0 
	calculate_word_frequency()
	end
	
 def calculate_word_frequency()
	words = Hash.new(0)
	@content.split.each do |word|
		words[word.downcase] += 1
		if 	words[word.downcase] > @highest_wf_count
			@highest_wf_count = words[word.downcase]
		end
	end	
	
	
     words.each {|value, key| 
     if key == @highest_wf_count 
		highest_wf_words.push(value) 
		end 
		}  
     #puts words
     #puts @highest_wf_count
     #puts @highest_wf_words
 end
 
end

  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.



#  Implement a class called Solution. 
class Solution
  attr_reader :analyzers
  attr_reader :highest_count_across_lines
  attr_reader :highest_count_words_across_lines
  
  def initialize()
	@analyzers = Array.new
	@highest_count_across_lines = 0
	@highest_count_words_across_lines = Array.new
  end
  
  def analyze_file()
	line_number = 0
	File.foreach('test.txt') do |line|
		line_number += 1 
		@analyzers.push(LineAnalyzer.new(line,line_number))
	end
	#puts @analyzers[1].content
	#puts @analyzers[1].highest_wf_count
  end
  
  def calculate_line_with_highest_frequency()
 
	@analyzers.each{|content|
		if content.highest_wf_count > @highest_count_across_lines
			@highest_count_across_lines = content.highest_wf_count 
		end	
	}
	@analyzers.each {|element|
		if element.highest_wf_count == @highest_count_across_lines
			puts element.highest_wf_count
			@highest_count_words_across_lines.push(element.highest_wf_words)
		end
	}
  end
  
  def print_highest_word_frequency_across_lines()
	puts @highest_count_words_across_lines
  end
  
  
  
  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end

s1 = Solution.new
s1.analyze_file
s1.calculate_line_with_highest_frequency
s1.print_highest_word_frequency_across_lines


