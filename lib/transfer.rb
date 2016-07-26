require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here
  def initialize(sender,receiver,amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? && sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif status == "pending" && sender.valid?
      receiver.deposit(amount)
      sender.deposit(-amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    # binding.pry
    if status == "complete"
      receiver.deposit(-amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
  end
end
