defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build(
        "Rua das bananeiras",
        "Junior",
        "email.exemplo@gmail.com",
        "13456789",
        31
      )

      expect_response = {:ok,
        %User{
          address: "Rua das bananeiras",
          age: 31,
          cpf: "13456789",
          email: "email.exemplo@gmail.com",
          name: "Junior"
        }}

      assert response == expect_response

    end

    test "when there are invalid params, returns an error" do

      response = User.build(
        "Rua das bananeiras",
        "Menor de Idade",
        "email.exemplo@gmail.com",
        "13456789",
        17
      )

      expect_response = {:error, "Invalid Param"}

      assert response == expect_response

    end
  end
end
