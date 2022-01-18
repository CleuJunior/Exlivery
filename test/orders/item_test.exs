defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory


  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Pizza de banana", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response

    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Pizza de banana", :churrasco, "35.5", 1)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response

    end

    test "when there is a invalid price, returns an error" do
      response = Item.build("Pizza de banana", :pizza, "String_passada_no_valor", 1)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response

    end

    test "when there is a invalid quantity, returns an error" do
      response = Item.build("Pizza de banana", :pizza, "35.5", 0)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response

    end
  end

end
