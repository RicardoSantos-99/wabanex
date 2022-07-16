defmodule WabanexWeb.Schema do
  use Absinthe.Schema

  import_types WabanexWeb.Mutations.User
  import_types WabanexWeb.Queries.User
  import_types WabanexWeb.Schema.Types.User

  query do
    import_fields :user_queries
  end

  mutation do
    import_fields :user_mutation
  end
end
