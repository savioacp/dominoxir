defmodule DominoxirWeb.Schema do
  use Absinthe.Schema

  alias DominoxirWeb.Resolvers.{UsersResolver, RoomsResolver}
  alias Dominoxir.{User, Error}

  object :user do
    field :id, :string
    field :nickname, :string
    field :email, :string
    field :wins, :integer
  end

  object :error do
    field :error, :string
  end

  union :user_response do
    description "User query response"

    types [:user, :error]
    resolve_type fn
      %User{}, _ -> :user
      %Error{}, _ -> :error
    end
  end

  query do
    field :all_users, list_of(non_null(:user)) do
      resolve &UsersResolver.get_all/3
    end

    field :user, :user_response do
      arg :id, non_null(:string)

      resolve &UsersResolver.get_one/3
    end


    field :all_rooms, list_of(non_null(:room)) do
      resolve &RoomsResolver.get_all/3
    end

    field :room, :room_response do
      resolve &RoomsResolver.get_one/3
    end
  end


  object :room do
    field :id, :integer
    field :name, :string
    field :players, list_of(:user)
  end

  union :room_response do
    description "Room query response."

    types [:room, :error]
  end
end
