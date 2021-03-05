defmodule DominoxirWeb.Schema.ErrorTypes do
  use Absinthe.Schema.Notation

  @desc "Error caused by an operation."
  object :error do
    field :error, :string
  end
end
