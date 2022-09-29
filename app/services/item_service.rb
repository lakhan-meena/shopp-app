class ItemService

  def initialize(params, current_user)
    @current_user = current_user
    @params = params
  end

  def add_to_cart(product)
    cart = check_user_cart
    if cart.products.include?(product)
      item = cart.items.find_by(product_id: product.id)
      quantity = item.quantity += 1
      subtotal = item.subtotal += product.price
      item.update(quantity: quantity, subtotal: subtotal, cart: cart)
    else
      item = Item.new(quantity: 1, product: product, cart: cart, subtotal: product.price)
      item.save!
    end
  end

  def check_user_cart
    if @current_user.cart.present?
      cart = @current_user.cart
    else
      cart = Cart.create(user_id: @current_user.id)
    end
    return cart
  end
end
