class Cart
  attr_reader :contents, :saved_discounts, :subtotal_discount

  def initialize(contents)
    @contents = contents || {}
    @contents.default = 0
  end

  def find_item(item_id)
     item = Item.find(item_id)
  end

  def add_item(item_id)
    @contents[item_id] += 1
  end

  def less_item(item_id)
    @contents[item_id] -= 1
  end

  def count
    @contents.values.sum
  end

  def items
    @contents.map do |item_id, _|
      find_item(item_id)
    end
  end

  def grand_total
    grand_total = 0.0
    @saved_discounts = 0.0

    @contents.each do |item_id, quantity|
      item = Item.find(item_id)
      grand_total += discounted_price(item) * quantity
      if discounted_price(item) < item.price
        @saved_discounts = @subtotal_discount * quantity
      end
    end
    grand_total
  end

  def discounted_price(item)
    @subtotal_discount = 0.0
    if applied_discount(item)
      new_price = item.price * (100 - applied_discount(item)) * 0.01
      @subtotal_discount = item.price - new_price
      return new_price
    else
      item.price
    end
  end

  def applied_discount(item)
    item.merchant.discounts
    .where('? >= quantity', count_of(item.id))
    .order(percent: :desc)
    .limit(1)
    .pluck(:percent)
    .first
  end

  def count_of(item_id)
    @contents[item_id.to_s]
  end

  def subtotal_of(item_id)
    @contents[item_id.to_s] * find_item(item_id).price
  end

  def limit_reached?(item_id)
    count_of(item_id) == find_item(item_id).inventory
  end
end
