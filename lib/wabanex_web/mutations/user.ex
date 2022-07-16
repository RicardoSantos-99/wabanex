defmodule WabanexWeb.Mutations.User do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver

  alias Crudry.Middlewares.TranslateErrors

  object :user_mutation do
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
