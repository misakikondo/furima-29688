class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :item_location
  belongs_to_active_hash :days_to_ship

  validates :image, presence: true
  validates :items_name, presence: true, length: { maximum: 40 }
  validates :explains, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' },
                    format: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  with_options presence: true do
    validates :category, :condition, :shipping_method,
              :item_location, :days_to_ship
  end

  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :condition_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_method_id, numericality: { other_than: 1, message: 'Select' }
  validates :item_location_id, numericality: { other_than: 1, message: 'Select' }
  validates :days_to_ship_id, numericality: { other_than: 1, message: 'Select' }
end
