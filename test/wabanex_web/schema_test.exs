defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{
        email: "test@example.com",
        name: "Test User",
        password: "password"
      }

      {:ok, %Wabanex.User{id: user_id}} = Wabanex.Users.Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
            id
            email
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "getUser" => %{
                   "email" => "test@example.com",
                   "id" => user_id,
                   "name" => "Test User"
                 }
               }
             } == response
    end
  end

  describe "users mutations" do
    test "when all params are valid, create the user", %{conn: conn} do
      mutations = """
        mutation {
          createUser(input: {
            email: "test@example.com",
            password: "password",
            name: "Test User"
          }) {
            email
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutations})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{"email" => "test@example.com", "name" => "Test User"}
               }
             } == response
    end
  end
end
