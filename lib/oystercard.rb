require_relative 'station'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "exceeded max balance of #{MAX_BALANCE}" if exceed_limit?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail 'insufficient funds' if insufficient_balance?
    @entry_station = station
    # deduct(MIN_FARE)
  end

  def touch_out(station)
    @exit_station = station
    @journeys << { entry_station: entry_station, exit_station: exit_station }
    if journeys.length != 2 then deduct 6; else deduct(MIN_FARE) end
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def exceed_limit?(amount)
    balance + amount > MAX_BALANCE
  end

  def insufficient_balance?
    balance < MIN_FARE
  end
end
