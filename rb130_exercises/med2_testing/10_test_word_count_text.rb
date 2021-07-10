require 'minitest/autorun'
require_relative 'text'

class TestText < Minitest::Test
  def setup
    @file = File.open('sample.txt', 'r')
  end

  def test_word_count
    text = Text.new(@file.read)
    split = text.word_count
    expected = 72

    assert_equal(expected, split)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end