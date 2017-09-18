class Fizzbuzz
  attr_reader :max_num, :last_fizzbuzz, :result
  attr_accessor :current_num

  def initialize(n)
    fail ArgumentError unless n.integer?
    fail ArgumentError if n == 0
    @max_num = n
  end

  def fizzbuzz!
    puts "fizzbuzzing..."
    @current_num = 0
    @result = []
    1.upto(@max_num) do |num|
      @current_num = num
      set_fizzbuzz
      if @last_fizzbuzz
        @result << @last_fizzbuzz.to_s
        next
      end
      @result << num
    end

    puts finish_message
  end

  def print_result
    @result.each { |n| puts n }
  end

  def set_fizzbuzz
    @last_fizzbuzz = fizzbuzz_hash.keys.detect { |type| check(type) }
  end

  def last_fizzbuzz
    @last_fizzbuzz || 'it was not a fizzbuzz kind'
  end

  private

    def check(type)
      @current_num % fizzbuzz_hash[type] == 0 rescue false
    end

    def fizzbuzz_hash
      { fizz: 3, buzz: 5, fizzbuzz: 15 }.sort.reverse.to_h
    end

    def finish_message
      <<EOS
----------------
Fizzbuzz is done.
Check the results by Fizzbuzz#result
EOS
    end
end
