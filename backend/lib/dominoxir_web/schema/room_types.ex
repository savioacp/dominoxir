defmodule DominoxirWeb.Schema.RoomTypes do
  use Absinthe.Schema.Notation

  alias DominoxirWeb.Resolvers.Rooms
  object :room do
    field :id, :integer
    field :name, :string
    field :owner, :user
    field :players, list_of(:user)
  end

  union :room_response do
    description "Room query response."

    types [:room, :error]
  end

  object :room_queries do
    field :all_rooms, list_of(non_null(:room)) do
      resolve &Rooms.get_all/3
    end

    field :room, :room_response do
      resolve &Rooms.get_one/3
    end
  end

  object :room_mutations do
    field :create_room, :room do
      arg :name, non_null(:string)

      resolve &Rooms.create/3
    end
  end
end
