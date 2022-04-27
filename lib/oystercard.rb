class Oystercard
  attr_reader :balance, :entry_station, :exit_station

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0

    # @entry_station = nil
    # @exit_station = nil
    @journey = []
  end

  def add_money(money)
    check_if_max_balance_exceeded(money)
    @balance += money
  end
  
  def in_journey?
    entry_station == nil ? false : true
   # Alternativly use Double Bang!
   # !!entry_station
  end
  
  def touch_in(station)
    check_min_balance
    @entry_station = station
  end
  
  def touch_out(station)
    deduct_money(MIN_FARE)
    @journey << {entry_station: entry_station, exit_station: station} 
    @entry_station = nil
    # @exit_station = station
  end
  
  def journey_log
    @journey
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
