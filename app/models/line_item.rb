class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def total_price
   100
  end

end
