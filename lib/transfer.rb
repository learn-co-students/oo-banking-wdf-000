class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @times = 0
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    @times += 1
    if @times <= 1 && self.valid? && @sender.balance >= @amount
      # binding.pry
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

    # if ! self.valid?
    #   @status = "rejected"
    # elsif  @times <= 1
    #   @receiver.balance += @amount
    #   @sender.balance -= @amount
    #   @status = "complete"
    # end
    def reverse_transfer
      if self.status == "complete"
        @receiver.balance -= @amount
        @sender.balance += @amount
        self.status = "reversed"
      end
    end

end
