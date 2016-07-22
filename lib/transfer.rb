require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? & self.receiver.valid?

  end

  def execute_transaction
    # we can use && instead of & for validity
    if ((self.status == "pending") & (self.sender.valid?) & (self.sender.balance > self.amount))
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if(self.status == "complete")
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

  #   def reverse_transfer
  #   if both_valid? && receiver.balance > amount && self.status == "complete"
  #     receiver.balance -= amount
  #     sender.balance += amount
  #     self.status = "reversed"
  #   else
  #     reject_transfer
  #   end
  # end

  # def reject_transfer
  #   self.status = "rejected"
  #   "Transaction rejected. Please check your account balance."
  # end

end
