defmodule WabanexWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Wabanex.getUser(user_id)
  def create(%{input: params}, _context), do: Wabanex.createUser(params)
end
