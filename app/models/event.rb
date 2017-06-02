class Event < ApplicationRecord
  has_and_belongs_to_many :themes
  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user
  has_many :photos

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :location, presence: true
  validates :price, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  def bargain?
    price < 30
  end

  def self.order_by_price
   order(:price)
  end

  def self.order_by_name
    order(name: :asc)
  end

  scope :published, ->{ where(active: true) }

  scope :starts_before_ends_after, ->(date_search) {
  where('starts_at < ? AND ends_at > ?', date_search, date_search)
  }

  def self.starts_on(start_date)
    where('starts_at = ?', start_date)
  end

  def self.ends_on(end_date)
    where('ends_at = ?', end_date)
  end
end
