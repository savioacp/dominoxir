defmodule DominoxirWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  alias Dominoxir.{User, Error}
  alias DominoxirWeb.Resolvers.Users

  object :user do
    field :id, :string
    field :nickname, :string
    field :email, :string
    field :wins, :integer
  end

  union :user_response do
    description "User query response"

    types [:user, :error]
    resolve_type fn
      %User{}, _ -> :user
      %Error{}, _ -> :error
    end
  end

  object :user_queries do
    field :all_users, list_of(non_null(:user)) do
      resolve &Users.get_all/3
    end

    field :user, :user_response do
      arg :id, non_null(:string)

      resolve &Users.get_one/3
    end
  end
end
