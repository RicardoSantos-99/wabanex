defmodule Wabanex.Users.Get do
  import Ecto.Query
  alias Wabanex.{User, Repo, Training}
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
      user -> {:ok, load_trainings(user)}
    end
  end

  defp load_trainings(user) do
    today = Date.utc_today()

    query =
      from t in Training,
        where: ^today >= t.start_date and ^today <= t.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
