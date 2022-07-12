defmodule Wabanex.Users.Get do
  alias Wabanex.{User, Repo}
  alias Ecto.UUID
  # 7ec8517b-0c76-4b9e-b7c1-c24b5841d924
  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error), do: {:error, "Invalid UUID"}

  defp handle_response({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
