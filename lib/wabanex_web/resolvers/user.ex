defmodule WabanexWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Wabanex.getUser(user_id)
end
