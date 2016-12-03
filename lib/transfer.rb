class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status


  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end

  def valid?
  	sender.valid? && sender.balance > amount && receiver.valid? 
  end

  def execute_transaction
  	if status == "pending" && self.valid?
	  	receiver.deposit(amount)
	  	sender.deposit(-amount)
	  	self.status = "complete"
	  else
	  	self.status = "rejected"
	  	"Transaction rejected. Please check your account balance."
	  end
  end

  def reverse_transfer
  	if status == "complete"
  		sender.deposit(amount)
	  	receiver.deposit(-amount)
	  	self.status = "reversed"
	  end
  end

end
