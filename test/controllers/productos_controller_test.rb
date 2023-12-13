requiere 'test_helper'

class ProductosControllerTest < ActionDispatch::IntegrationTest
  test 'render a list if productos' do
    get productos_path

    assert_response :success
    asser_select '.producto', 2
  end

  test 'render a detailed producto page' do
    get producto_path(productos(:Antigrasa))

    assert_response :success
    asser_select '.Nombre', 'Omo Antigrasa'
    asser_select '.Descripcion', 'Omo antigrasa 1l'
    asser_select '.Precio', '$2000'


  end
end
