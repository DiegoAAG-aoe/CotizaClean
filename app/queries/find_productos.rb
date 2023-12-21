class FindProductos
  attr_reader :productos

  def initialize(productos = initial_scope)
    @productos = productos
  end

  def call(params = {})
    scoped = productos
    scoped = filter_by_category_id(scoped, params[:category_id])
    scoped = filter_by_min_price(scoped, params[:min_price])
    scoped = filter_by_max_price(scoped, params[:max_price])
    scoped = filter_by_query_text(scoped, params[:query_text])
    scoped = filter_by_user_id(scoped, params[:user_id])
    scoped = filter_by_favoritos(scoped, params[:favoritos])
    sort(scoped, params[:order_by])
  end

  private

  def initial_scope
    Producto.with_attached_photo
  end

  def filter_by_category_id(scoped, category_id)
    return scoped unless category_id.present?

    scoped.where(category_id: category_id)
  end

  def filter_by_min_price(scoped, min_price)
    return scoped unless min_price.present?

    scoped.where("precio >= ?", min_price)
  end

  def filter_by_max_price(scoped, max_price)
    return scoped unless max_price.present?

    scoped.where("precio <= ?", max_price)
  end

  def filter_by_query_text(scoped, query_text)
    return scoped unless query_text.present?

    scoped.search_full_text(query_text)
  end

  def filter_by_user_id(scoped, user_id)
    return scoped unless user_id.present?

    scoped.where(user_id: user_id)
  end

  def filter_by_favoritos(scoped, favoritos)
    return scoped unless favoritos.present?

    scoped.joins(:favoritos).where({ favoritos: { user_id: Current.user }})
  end

  def sort(scoped, order_by)
    order_by_query = Producto::ORDER_BY.fetch(order_by&.to_sym, Producto::ORDER_BY[:newest])
    scoped.order(order_by_query)
  end
end
