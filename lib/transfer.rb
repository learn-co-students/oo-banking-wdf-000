require 'pry'

class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if (self.valid? && sender.balance > self.amount) && self.status == "pending"
      sender.balance -= self.amount
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.deposit(self.amount)
      self.status = "reversed"
    else
      "Cannot reverse transfer that has not been executed."
    end
  end
end
