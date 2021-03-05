defmodule DominoxirWeb.Resolvers.RoomsResolver do
  alias Dominoxir.RoomsAgent, as: Rooms

  alias Dominoxir.Room

  def get_all(_root, _params, _info) do
    {:ok, Rooms.get()}
  end

  def get_one(_root, %{id: id}, _info) do
    {:ok, Rooms.get(id)}
  end

  def create(_root, %{id: id, room: %Room{} = room}, _info) do
    {:ok, Rooms.set(id, room)}
  end
end
