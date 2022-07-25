defmodule Wabanex.ImcTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, return the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expect_response =
        {:ok,
         %{
           "Fausto" => 44.92262078569664,
           "JohnDoe" => 31.91930798940279,
           "Ricardo" => 30.778701138811947,
           "alie" => 17.959183673469386,
           "babe" => 28.61700131356728,
           "brian" => 31.22130394857668,
           "conor" => 26.89232313815483,
           "trikas" => 16.305062458908615
         }}

      assert expect_response == response
    end
  end
end
