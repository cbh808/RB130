require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  attr_accessor :wheels, :name

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    car = Car.new
    assert_equal(3, car.wheels)
  end

  ### `assert`

  def test_car_exists
    car = Car.new
    assert(car)
  end


  ### `assert_equal`

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end


  ### `assert_nil`

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end


  ### `assert_raises`

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")      # raises ArgumentError, so this assertion passes
    end
  end


  ### `assert_instance_of`


  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end



  # This test is more useful when dealing with inheritance. This example is a little contrived.

  ### `assert_includes`

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end

  # assert_includes calls assert_equal in its implementation, & Minitest counts that call
  # as a separate assertion.
  # For each assert_includes call, you will get 2 assertions, not 1.

end
