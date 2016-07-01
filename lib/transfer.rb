class Transfer
	attr_accessor :sender, :receiver, :amount, :status
  # your code here
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end

  def status
  	@status
  end

  def valid?
  	# binding.pry
  	sender.valid? && receiver.valid? && sender.balance >= amount
  end

  def execute_transaction
  		# binding.pry
  	if self.valid? == false
  		self.status = "rejected"
	  	"Transaction rejected. Please check your account balance."
	  elsif status == "pending" && self.valid? == true
	  	sender.deposit(-amount)
	  	receiver.deposit(amount)
	  	self.status = "complete"
	  end
  end

  def reverse_transfer
  	if self.status == "complete"
  		sender.deposit(amount)
	  	receiver.deposit(-amount)
	  	self.status = "reversed"
	  end
  end
end
