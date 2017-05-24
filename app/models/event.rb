class Event < ApplicationRecord
  has_and_belongs_to_many :themes
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :location, presence: true
  validates :price, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true#, date: { greater_than: :starts_at }

  def bargain?
    price < 30
  end

  def self.order_by_price
   order(:price)
  end

end
