class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category


  with_options presence: true do
    validates :category
  end

  with_options presence: true do
    validates :category_id, numerically: { other_than:1 }
  end

end
