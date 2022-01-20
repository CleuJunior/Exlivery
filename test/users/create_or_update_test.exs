defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Cleonildo Junior",
        address: "Rua dos Coqueiros, 345",
        email: "cleonildo@hotmail.com",
        cpf: "888899172363",
        age: 31
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Cleonildo Junior",
        address: "Rua dos Coqueiros, 345",
        email: "cleonildo@hotmail.com",
        cpf: "888899172363",
        age: 16
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid Param"}

      assert response == expected_response
    end
  end
end
