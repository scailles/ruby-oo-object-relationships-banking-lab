class Transfer
  

  attr_accessor  :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end


  def valid?
    sender.valid? && receiver.valid?
  end

  
  def execute_transaction
    if valid? && @sender.balance > amount && status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    else
      @status = "rejected"
     "Transaction rejected. Please check your account balance."
     
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status  = "reversed"
    else
    end
  end




end
