defmodule WabanexWeb.ImcControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, return the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert %{
               "result" => %{
                 "Fausto" => 44.92262078569664,
                 "JohnDoe" => 31.91930798940279,
                 "Ricardo" => 30.778701138811947,
                 "alie" => 17.959183673469386,
                 "babe" => 28.61700131356728,
                 "brian" => 31.22130394857668,
                 "conor" => 26.89232313815483,
                 "trikas" => 16.305062458908615
               }
             } == response
    end

    test "when there are invalid params, return an error", %{conn: conn} do
      params = %{"filename" => "student.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      assert %{"result" => "Error while reading file"} == response
    end
  end
end
