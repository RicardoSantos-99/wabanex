defmodule Wabanex do
  alias Wabanex.Users.Create, as: CreateUser
  alias Wabanex.Users.Get, as: GetUser
  alias Wabanex.Users.Delete, as: DeleteUser

  defdelegate createUser(params), to: CreateUser, as: :call
  defdelegate getUser(id), to: GetUser, as: :call
  defdelegate deleteUser(id), to: DeleteUser, as: :call
end
