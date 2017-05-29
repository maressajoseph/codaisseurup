class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  before_save :set_total_price, :set_status

  def set_total_price
    price = event.price
    self.total = price * guests_count
  end

  def set_status
    if @registration = Registration.new
      puts status = "Booked"
    else
      puts status = "Not booked"
    end
  end
end
