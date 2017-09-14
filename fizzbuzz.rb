class Fizzbuzz
  attr_reader :initialized_num, :current_num

  def initialize(n)
    @initialized_num = n
  end

  def fizzbuzz!
    @current_num = 0
    1.upto(@initialized_num) do |num|
      @current_num = num
      next if check_fizzbuzz
      puts num
    end

    puts <<EOS
----------------
Done.
EOS
  end

  private

    def check_fizzbuzz
      fizzbuzz_hash.keys.any? { |type| check(type) }
    end

    def check(type)
      return false if @current_num % fizzbuzz_hash[type] != 0
      puts type.to_s
      true
    end

    def fizzbuzz_hash
      { fizz: 3, buzz: 5, fizzbuzz: 15 }.sort.reverse.to_h
    end
end

fb = Fizzbuzz.new(45)
fb.fizzbuzz!
