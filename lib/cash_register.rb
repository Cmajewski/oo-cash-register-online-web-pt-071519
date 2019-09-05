require'pry'

class CashRegister
  attr_accessor :total,:items
  attr_reader :discount, :price, :number
  def initialize (discount=0)
    @total=0
    @discount= discount
    @items=[]
  end

  def add_item (name,price,number=1)
    @price=price
    @number=number
    self.total+=price*number
    if number>1
      counter=0
      while counter<number
        @items<<name
        counter+=1
      end
    else
      @items<<name
    end
  end

  def apply_discount
    if @discount!=0
      self.total*=1-@discount/100.0

      "After the discount, the total comes to $#{self.total.to_i}."
    else
    "There is no discount to apply."
    end
  end

  def void_last_transaction
  @total-=@price*@number
  end


end
