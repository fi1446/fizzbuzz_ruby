require 'fizzbuzz'

class FizzbuzzTest < Test::Unit::TestCase
  def test_initialize
    assert Fizzbuzz.new(1)
    assert_raises do
      Fizzbuzz.new('Fizzbuzz!')
      Fizzbuzz.new(1.1)
      Fizzbuzz.new(0)
    end
  end

  def test_output
    fb1 = Fizzbuzz.new(1)
    fb1.fizzbuzz!
    assert_equal [1], fb1.result

    fb2 = Fizzbuzz.new(15)
    fb2.fizzbuzz!
    arr = [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz']
    assert_equal arr, fb2.result
  end

  def test_check_fizzbuzz
    fb = Fizzbuzz.new(1)

    fb.current_num = 1
    fb.set_fizzbuzz
    assert_match 'it was not a fizzbuzz kind', fb.last_fizzbuzz

    fb.current_num = 3
    fb.set_fizzbuzz
    assert_match 'fizz', fb.last_fizzbuzz

    fb.current_num = 5
    fb.set_fizzbuzz
    assert_match 'buzz', fb.last_fizzbuzz

    fb.current_num = 15
    fb.set_fizzbuzz
    assert_match 'fizzbuzz', fb.last_fizzbuzz
  end

  def test_set_fizzbuzz_when_cn_is_nil
    fb = Fizzbuzz.new(1)
    refute fb.set_fizzbuzz
  end
end
