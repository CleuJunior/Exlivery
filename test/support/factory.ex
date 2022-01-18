defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Junior",
      email: "junior@gmail.com",
      cpf: "13456789",
      age: 31,
      address: "Rua dos Pardais, 345"
    }
  end

end
