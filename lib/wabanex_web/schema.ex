defmodule WabanexWeb.Schema do
  use Absinthe.Schema

  import_types WabanexWeb.Mutations.User
  import_types WabanexWeb.Queries.User
  import_types WabanexWeb.Schema.Types.User

  import_types WabanexWeb.Schema.Types.Training
  import_types WabanexWeb.Mutations.Training

  query do
    import_fields :user_queries
  end

  mutation do
    import_fields :user_mutation
    import_fields :training_mutation
  end
end
