defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do

      response = User.build(
        "Rua dos Pardais, 345",
        "Junior",
        "junior@gmail.com",
        "13456789",
        31
      )

      expect_response = {:ok, build(:user)}

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
