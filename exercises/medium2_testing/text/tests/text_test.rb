require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('../sample_text.txt', 'r')
    sample_text = @file.read
    @text = Text.new(sample_text)
  end
  
  def test_swap
    expected = <<~TEXT.chomp
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.
    TEXT
    assert_equal(expected.gsub('a', 'e'), @text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    puts "Files has been closed: #{@file.closed?}"
  end
end