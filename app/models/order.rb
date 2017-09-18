class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def add(item_hash)
    item_hash.each do |item, quantity|
      items << item
      order_item = OrderItem.find_by(item_id: item.id)
      order_item.quantity = quantity
    end
  end

end
