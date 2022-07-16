defmodule Wabanex.Users.List do
  alias Wabanex.{User, Repo}

  def call() do
    Repo.all(User)
    |> handle_response()
  end

  def handle_response(users), do: {:ok, users}
end
