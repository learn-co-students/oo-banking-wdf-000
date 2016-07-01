class Transfer
	
	attr_reader :sender, :receiver, :amount, :status
	def initialize(ac1,ac2,amt)
		@sender = ac1
		@receiver = ac2	
		@amount = amt
		@status = "pending"
	end

	def valid?
		(@sender.valid?  && @sender.balance >= @amount && @receiver.valid? )
	end
	
	def execute_transaction
		if (self.valid?  && @status == "pending")
			@sender.deposit(-1*amount)
			@receiver.deposit(amount)
			@status = "complete"
		else
			@status = "rejected"
			return  "Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if (@sender.valid?  && @receiver.balance >= @amount && @receiver.valid? && @status == "complete")  
			@sender.deposit(amount)
			@receiver.deposit(-1*amount)
			@status = "reversed"
		end
	end


end
