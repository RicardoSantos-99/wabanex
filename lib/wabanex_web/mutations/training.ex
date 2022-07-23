defmodule WabanexWeb.Mutations.Training do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.Training, as: TrainingResolver

  alias Crudry.Middlewares.TranslateErrors

  object :training_mutation do
    field :create_training, type: :training do
      arg :input, non_null(:create_training_input)

      resolve &TrainingResolver.create/2
      middleware TranslateErrors
    end
  end
end
