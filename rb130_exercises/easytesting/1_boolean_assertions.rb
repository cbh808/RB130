# Write a minitest assertion that will fail if the value.odd? is not true.

# assert(test)	Fails unless test is truthy.
# can add a failure meesage after test

assert(value.odd?, "value is not odd")

# require 'minitest/autorun'


# # class Oddity_Test 
# #   # def setup
# #   #   @value1 = Oddity.new(2)
# #   #   @value2 = Oddity.new(3)
# #   # end

# #   def test_odd?
# #     assert(value.odd?, "value is not odd")
# #   end
# # end

# class Oddity #< Oddity_Test
#   attr_reader :value

#   def initialize(n)
#     @value = n
#   end

#   def test_odd?
    
#   end
# end

# value1 = Oddity.new(2)
# value2 = Oddity.new(3)

# # p value1.test_odd?
# # p value2.test_odd?