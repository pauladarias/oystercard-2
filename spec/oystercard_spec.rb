require 'oystercard'

describe Oystercard do 
    let(:station) {double :station}

    it 'has a balance of zero' do
        expect(subject.balance).to eq(0)
    end

    describe "#top_up" do
        it 'adds money to the balance' do
            expect(subject.top_up(5)).to eq(5)
        end

        it "should raise an error if balance is more than 90" do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect{ subject.top_up(95) }.to raise_error "Maximum balance (#{maximum_balance}) exceeded"
        end 
    end

    # describe "#deduct" do
    #    it'should take money off of the fare' do
    #       expect(subject.deduct(3)).to eq(-3)
    #    end
    # end

    describe "#in_journey" do
    it "should tell us if we are on a journey" do
        expect(subject.in_journey?).to eq false
       end
    end 

    describe "#touch_in" do
    it "should tell in_journey is true if there is enough balance" do
        minimum_balance = Oystercard::MINIMUM_FARE
        subject.top_up(minimum_balance)
        expect(subject.touch_in(station)).to eq station

    end 

    it "should raise an error when balance is less that minimum balance" do 
    expect{ subject.touch_in(station) }.to raise_error "Insuficient balance"
    end 
    end  

    describe "#touch_out" do
    it "should tell us if we have touched out" do
        expect(subject.touch_out).to eq nil
    end

    it "should deduct a minimum fare" do
        minimum_balance = Oystercard::MINIMUM_FARE
        expect { subject.touch_out}.to change { subject.balance }.by(-minimum_balance)
    end 
    end 

    describe "#entry_station" do 
        it "should track entry_station once touch_in" do
        expect(subject.entry_station).to eq (nil)
    end 
    end




end 

