class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    line_items.each do |li|
      total += (li.quantity * li.item.price)
    end
    total
  end

  def add_item(itemid)
    line_item = self.line_items.find_by(item_id: itemid)

    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: itemid)
    end
    line_item
  end

  def checkout
    self.status = "Submitted"
    self.line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    self.save
  end

end
