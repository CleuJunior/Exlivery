defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)
      item = [
        build(:item),
        build(:item,
        description: "Temaki de Salmao",
        category: :japonesa,
        quantity: 2,
        unity_price: Decimal.new("20.50")
        )
      ]

      response = Order.build(user, item)

      expected_response = {:ok, build(:order)}

      assert response == expected_response

    end

    test "when there is no items in the order, returns an error" do
      user = build(:user)

      item = []

      response = Order.build(user, item)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
