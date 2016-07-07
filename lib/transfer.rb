class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    @executed = false
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if @sender.balance > @amount && !@executed
      @sender.balance -= @amount
      @receiver.balance += @amount 
      @executed = true
      return @status = "complete"
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end 
  end
  def reverse_transfer
    if @executed
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end
