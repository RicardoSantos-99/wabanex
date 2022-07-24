defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Custom.UUID4

  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
  end

  input_object :create_user_input do
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :password, non_null(:string)
  end
end
