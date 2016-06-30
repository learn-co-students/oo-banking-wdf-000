class Transfer

attr_reader :sender, :receiver, :amount
attr_accessor :status

  def initialize(sender, receiver, money)
    @sender = sender
    @receiver = receiver
    @amount = money
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && (@sender.balance - @amount > 0)
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      reverse = Transfer.new(@receiver, @sender, @amount)
      reverse.execute_transaction
    end
    @status = "reversed"
  end

end
