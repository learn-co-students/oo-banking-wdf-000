class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end 

  def execute_transaction
    return if self.status == "complete"

    if sender.valid? == false || sender.balance < self.amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif sender.valid? == true
      sender.balance = sender.balance - self.amount
      self.receiver.balance = self.receiver.balance + self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance = self.sender.balance + self.amount
      self.receiver.balance = self.receiver.balance - self.amount
      self.status = "reversed"
    else
      return nil
    end
  end
end

