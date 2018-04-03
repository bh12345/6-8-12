require 'minitest/autorun'
require_relative 'back'

# Minitest
class Test < Minitest::Test
  def test_delta
    assert_in_delta(minmax(-1.0, 1.0, 0.01) { |x| Math.sin(x / 2 - 1) }[1], -0.997494, 10^3)
    assert_in_delta(minmax(-1.0, 1.0, 0.01) { |x| Math.sin(x / 2 - 1) }[0], -0.48380, 10^3)

    assert_in_delta(minmax(0.0, 2.0, 0.01) { |x| (x - 1.0) / (x + 2.0)}[1], -0.5, 10^3)
    assert_in_delta(minmax(0.0, 2.0, 0.01) { |x| (x - 1.0) / (x + 2.0)}[0], 0.24812, 10^3)



  end
end

