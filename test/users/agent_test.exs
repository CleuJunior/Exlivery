defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User


  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "888899172363"

      {:ok, cpf: cpf}
    end
    test "when the user is found, returns the user", %{cpf: cpf} do

      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response = {:ok,
        %User{
          address: "Rua dos Pardais, 345",
          age: 31, cpf: "888899172363",
          email: "junior@gmail.com",
          name: "Junior"
        }}

      assert response == expected_response
    end

    test "when the user is not found, returns an user" do
      response = UserAgent.get("999999999999999")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
