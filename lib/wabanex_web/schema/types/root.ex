defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver
  alias Crudry.Middlewares.TranslateErrors

  import_types WabanexWeb.Schema.Types.User

  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
      # resolve fn params, context -> UserResolver.get(params, context) end
    end

    field :get_users, list_of(:user) do
      resolve &UserResolver.list/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
      middleware TranslateErrors
    end

    field :delete_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.delete/2
      middleware TranslateErrors
    end
  end
end
