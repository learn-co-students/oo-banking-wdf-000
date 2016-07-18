require 'pry'
class Transfer
  attr_reader :amount
  attr_accessor :sender, :receiver, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end
  def transaction_valid?
    @sender.balance > @amount
  end

  def execute_transaction
    #binding.pry
    if !valid? || !transaction_valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending" && valid?
      sender.withdrawal(@amount)
      receiver.deposit(@amount)
      @status = "complete"
    end
  end
  def reverse_transfer
    if @status == "complete"
      receiver.withdrawal(@amount)
      sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
