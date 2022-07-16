defmodule WabanexWeb.Queries.User do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver

  object :user_queries do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
      # resolve fn params, context -> UserResolver.get(params, context) end
    end

    field :get_users, list_of(:user) do
      resolve &UserResolver.list/2
    end
  end
end
