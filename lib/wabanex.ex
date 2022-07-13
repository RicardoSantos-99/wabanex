defmodule Wabanex do
  alias Wabanex.Users.Create, as: CreateUser
  alias Wabanex.Users.Get, as: GetUser

  defdelegate createUser(params), to: CreateUser, as: :call
  defdelegate getUser(id), to: GetUser, as: :call
end
