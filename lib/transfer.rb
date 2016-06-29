class Transfer
  
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? & self.receiver.valid? ? true : false
  end

  def execute_transaction
    # binding.pry
    if self.valid? && self.status == 'pending' && self.sender.balance > self.amount
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    # binding.pry
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = 'reversed'
    else
      "There is no transaction to be reversed"
    end
  end

end
