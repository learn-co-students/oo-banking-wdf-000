require 'pry'

class Transfer
  # your code here

  attr_accessor :amount, :status

  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    # bruh = BankAccount.new(@sender)
    # ayo = BankAccount.new(@receiver)
    # # binding.pry
    # if bruh.valid? && ayo.valid?
    #   return true
    # end
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @receiver.valid? && @sender.balance > @amount && self.status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      self.status = "complete"
      # self.status = "complete"
      # binding.pry
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @sender.valid? && @receiver.valid? && @receiver.balance > @amount && self.status == "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      self.status = "reversed"
    end
  end





end
