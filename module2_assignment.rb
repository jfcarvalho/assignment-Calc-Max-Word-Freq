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
	
	calculate_word_frequency()
	end
	
 def calculate_word_frequency()
    @highest_wf_count = 0 
	words = Hash.new(0)
	@content.split.each do |word|
		words[word.downcase] += 1
		if 	words[word.downcase] > @highest_wf_count
			@highest_wf_count = words[word.downcase]
		end
	end	
	
	@highest_wf_words = Array.new
     words.each {|value, key| 
     if key == @highest_wf_count 
		highest_wf_words.push(value) 
		end 
		}  
 
 end
 
end

class Solution
  attr_reader :analyzers
  attr_reader :highest_count_across_lines
  attr_reader :highest_count_words_across_lines
  
  def initialize()
	@analyzers = Array.new
  end
  
  def analyze_file()
	line_number = 0
	File.foreach('test.txt') do |line|
		line_number += 1 
		@analyzers.push(LineAnalyzer.new(line,line_number))
	end

  end
  
  def calculate_line_with_highest_frequency()
	@highest_count_across_lines = 0 
	@highest_count_words_across_lines = Array.new
	@analyzers.each{|content|
		if content.highest_wf_count > @highest_count_across_lines
			@highest_count_across_lines = content.highest_wf_count 
		end	
	}
	@analyzers.each {|element|
		if element.highest_wf_count == @highest_count_across_lines
			#puts element.highest_wf_count
			@highest_count_words_across_lines.push(element)
		end
	}
  end
  
  def print_highest_word_frequency_across_lines()
	puts "The following words have the highest word frequency per line:"
	@analyzers.each {|element|
	puts "#{element.highest_wf_words} appers in line #{element.line_number}"
	
	}
	end
end


