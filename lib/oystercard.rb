class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1


    attr_reader :balance 
    attr_accessor :in_journey

    def initialize
        @balance = 0
        @in_journey = false
     end 
    def top_up(amount)
        fail "Maximum balance (#{MAXIMUM_BALANCE}) exceeded" if balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def deduct(fare)
        @balance -= fare   
    end
    

    def touch_in
        fail "Insuficient balance" if balance < MINIMUM_FARE
        @in_journey = true
    end 

    def touch_out
        deduct(MINIMUM_FARE)
        @in_journey = false
    end 
end 