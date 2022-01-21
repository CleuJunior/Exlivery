defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrdersAgent
  alias Exlivery.Orders.Report

  describe "creat/1" do
    test "creates the report file" do
      OrdersAgent.start_link(%{})

      :order
      |> build()
      |> OrdersAgent.save()

      :order
      |> build()
      |> OrdersAgent.save()

      expected_response =
        "13456789, pizza, 1,35.5japonesa, 2,20.50, 76.50\n" <>
        "13456789, pizza, 1,35.5japonesa, 2,20.50, 76.50\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
