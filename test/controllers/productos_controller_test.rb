require 'test_helper'

class ProductosControllerTest < ActionDispatch::IntegrationTest
  test 'render a list if productos' do
    get productos_path

    assert_response :success
    asser_select '.producto', 3
  end

  test 'render a detailed producto page' do
    get producto_path(productos(:Antigrasa))

    assert_response :success
    asser_select '.Nombre', 'Omo antigrasa'
    asser_select '.Descripcion', 'Omo antigrasa 1l'
    asser_select '.Precio', '$2000'


  end

  test 'render a new producto form' do
        get new_producto_path

        asser_response :success
        asser_select 'form'
  end

  test 'allow to create a new producto' do
        post productos_path, params: {
          producto: {
            Nombre: 'Antigrasa Gold',
            Descripcion: 'El mejor antigrasa de 2023',
            Precio: 2500
          }
        }

        assert_redirected_to productos_path
  end
end
