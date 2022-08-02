defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = %{name: "John Doe", email: "john@example.com", password: "password"}

      response = Wabanex.User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "john@example.com", name: "John Doe", password: "password"},
               errors: []
             } = response
    end

    test "when there are invalid, return an invalid changeset" do
      params = %{name: "D", email: "john@example.com"}

      response = Wabanex.User.changeset(params)

      assert errors_on(response) == %{password: ["can't be blank"]}
    end
  end
end
