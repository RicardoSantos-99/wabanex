defmodule WabanexWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Wabanex.getUser(user_id)
  def create(%{input: params}, _context), do: Wabanex.createUser(params)
  def delete(%{id: user_id}, _context), do: Wabanex.deleteUser(user_id)
  def list(__params, _context), do: Wabanex.listUsers()
end
