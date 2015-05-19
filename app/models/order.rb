class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  
  before_create :set_status

  enum status: [:cart, :sended, :completed]

  def send!(send_params)
    update(send_params.merge(status: :sended))
  end

  def complete!
    update(status: :completed)
  end

  private

    def set_status
      self.status = :cart
    end



end
