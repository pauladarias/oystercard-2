class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1


    attr_reader :balance, :entry_station, :journeys

    def initialize
        @balance = 0
        @entry_station = nil 
        @journeys = []
    end 

    def top_up(amount)
        fail "Maximum balance (#{MAXIMUM_BALANCE}) exceeded" if balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end


    def touch_in(station)
        fail "Insuficient balance" if balance < MINIMUM_FARE
        @entry_station = station
    end 

    def touch_out(station)
        deduct(MINIMUM_FARE)
        @journeys << {entry: entry_station, exit: station}
        @entry_station = nil
    end 

    def in_journey?
        !!@entry_station
    end 

    private 
        
    def deduct(fare)
        @balance -= fare   
    end
end 