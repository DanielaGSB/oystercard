class Oystercard

attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    @balance += money
    fail if @balance >=90
  end

end
