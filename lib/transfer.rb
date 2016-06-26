class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver
  attr_reader  :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    return "each transfer can only happen once" if self.status == "complete"
    if self.amount > self.sender.balance
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    self.sender.withdraw(self.amount)
    self.receiver.deposit(self.amount)
    puts "sender: #{self.sender.name}, balance: #{self.sender.balance}"
    self.status = "complete"
  end

  def reverse_transfer

    return false if self.status != "complete" || !self.valid?

    self.sender.deposit(self.amount)
    self.receiver.withdraw(self.amount)
    self.status = "reversed"
  end


end
