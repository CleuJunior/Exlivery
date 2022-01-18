defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item


  def user_factory do
    %User{
      name: "Junior",
      email: "junior@gmail.com",
      cpf: "13456789",
      age: 31,
      address: "Rua dos Pardais, 345"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de banana",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")

    }

  end

end
