require 'pry'
class BankAccount
	attr_reader :name
	attr_accessor :status, :balance

	def initialize(name)
		@name =name
		@balance = 1000
		@status = "open"
	end

	def deposit(amount)	 
			@balance += amount
	end

	# def enough_deposit(amount)
	# 		if amount.abs <= balance 
	# 			return true
	# 		else
	# 			false
	# 		end
	# end

	def display_balance
		"Your balance is $#{@balance}."
	end


	def status
		@status
	end

	def closed
		status = "closed"
	end


	def valid?
		status == "open" && balance > 0 ? true : false
	end


	def close_account
		self.status = "closed"
	end


end
