defmodule DominoxirWeb.Schema do
  use Absinthe.Schema

  alias DominoxirWeb.Schema

  import_types Schema.ErrorTypes

  import_types Schema.UserTypes
  import_types Schema.RoomTypes

  query do
    import_fields :user_queries
    import_fields :room_queries
  end

  mutation do
    import_fields :room_mutations
  end
end
