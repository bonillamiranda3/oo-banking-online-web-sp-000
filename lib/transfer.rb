class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :receiver, :sender

  @@transaction_hist = []

  def intialize(sender, amount, reciever)
      @sender = sender
      @amount = amount
      @receiver = receiver
      @status = "pending"
  end

  def valid?
    sender.valid? && reciever.valid?
  end

  def execute_transaction
    sender.balance -= @amount
  end

  if valid?
    @@transaction_hist << amount
    reciever.deposit(@amount)
    @amount = 0
    @status = "complete"
  else
    sender.balance += @amount
    @status = "rejected"
    "Transaction rejected. Please check your account balance"
  end
end

    def reverse_transfer
      if status == "complete"
      @sender.deposit(@@transaction_hist.last)
      @@transaction_hist.delete(@@transaction_hist.last)
      @receiver.balance -= @@transaction_hist.last
      @status = "reversed"
    end
  end
