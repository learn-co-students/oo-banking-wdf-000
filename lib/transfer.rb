class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender,receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction

    if sender.valid? == false || sender.balance <= amount
      self.status.clear
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif sender.valid? == true && self.status == "pending"
        receiver.deposit(self.amount) && sender.withdraw(self.amount)
        self.status.clear
        self.status = "complete"
    end
 end

 def reverse_transfer
   while (self.status == "complete")
   receiver.deposit(-self.amount) && sender.withdraw(-self.amount)
   self.status.clear
   self.status = "reversed"
  end
 end

end
