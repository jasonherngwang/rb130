class TextAnalyzer
  def process
    file = File.open('./sandwich_sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

# Count paragraphs
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
# Count lines
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
# Count words
analyzer.process { |text| puts "#{text.split(" ").size} words" }