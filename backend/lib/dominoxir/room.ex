defmodule Dominoxir.Room do
  defstruct [
    id: nil,
    name: nil,
    game_room: nil,
    owner: %Dominoxir.User{},
    players: []
  ]

  @type t :: %{
    id: integer,
    name: String.t(),
    game_room: pid(),
    owner: Dominoxir.User,
    players: list(Dominoxir.User)
  }

  @spec new(integer(), String.t(), list(Dominoxir.User)) :: t()
  def new(id, name, players \\ []) do
    %__MODULE__{
      id: id,
      name: name,
      players: players
    }
  end

  @spec has_game(t()) :: boolean()
  def has_game(room) when is_nil(room.game_room), do: false
  def has_game(_room), do: true
end
