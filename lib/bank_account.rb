require 'pry'

class BankAccount

  attr_accessor :balance, :status


  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    self.balance += money  #we are changeing the property value of the self
  end                       #here. if we just add your not equaling the new
                            #amount to self and if you equal it is not
                            #adding but rather setting it to equal

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end








end
