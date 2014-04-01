class BankAccount
  attr_accessor :balance
  
  def initialize
    @money = 100
  end
  
  def withdraw_all
    if @money > 0
      p "Here's your $#{@money}"
      @money = 0
    end
  end
end

b = BankAccount.new

5.times.map do
  Thread.new do
    b.withdraw_all
  end
end.each(&:join)