class Oystercard
  attr_reader :balance


  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def add_money(money)
    check_if_max_balance_exceeded(money)
    @balance += money
  end
  
  def in_journey?
    @in_journey
  end
  
  def touch_in
    check_min_balance
    @in_journey = true
  end
  
  def touch_out
    deduct_money(MIN_FARE)
    @in_journey = false
  end
  
  private
  
  def check_min_balance
    fail 'Insufficient balance' unless @balance >= MIN_FARE
  end

  def deduct_money(money)
    @balance -= money
  end
  
  def check_if_max_balance_exceeded(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if @balance + money > MAX_BALANCE
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
