defmodule DominoxirWeb.Schema do
  use Absinthe.Schema
  import Ecto.Query, only: [from: 2]

  alias DominoxirWeb.Resolvers.{UsersResolver}

  object :user do
    field :id, :string
    field :nickname, :string
    field :email, :string
    field :wins, :integer
  end

  object :error do
    field :message, :string
    field :code, :string
  end

  union :user_response do
    description "User query response"

    types [:user, :error]
  end

  query do
    field :all_users, list_of(non_null(:user)) do
      resolve &UsersResolver.get_all/3
    end

    field :user, :user_response do
      arg :id, non_null(:string)

      resolve &UsersResolver.get_one/3
    end
  end
end
