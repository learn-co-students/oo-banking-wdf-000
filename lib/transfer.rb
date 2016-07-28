require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver 
		@amount = amount
		@status = "pending"
	end

	def valid?
		# binding.pry
		self.sender.valid?
		self.receiver.valid?
	end

	def execute_transaction
		# binding.pry
		if ((self.sender.valid?) && (self.status == "pending" ) && (self.sender.balance > self.amount))
			self.sender.balance -= amount
			receiver.deposit(amount)
			self.status = "complete"
			# self.sender.balance
			# self.receiver.balance
		else 
			self.status = "rejected"
			bad_transfer
		end
	end

	def bad_transfer 
		 "Transaction rejected. Please check your account balance."
	end

	def reverse_transfer
		if self.status == "complete" 
			self.receiver.balance -= amount
			sender.deposit(amount)
			self.status = "reversed"
		end
	end

end
