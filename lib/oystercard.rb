class Oystercard
  attr_reader :balance


  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def add_money(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if max_balance_exceeded
    @balance += money
  end
  
  def deduct_money(money)
    @balance -= money
  end

  def max_balance_exceeded
    @balance >= MAX_BALANCE
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Insufficient balance' unless @balance >= MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end




# def touch_in
#   raise 'You cannot touch in twice' if @on_journey.empty? != true
#   @on_journey.push "On Journey" if @on_journey.empty? == true
# end

# def touch_out
#   raise 'You cannot touch out without touching in' if @on_journey.empty? == true
#   @on_journey.pop if @on_journey.empty? != true
# end
