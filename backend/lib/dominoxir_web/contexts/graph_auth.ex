defmodule DominoxirWeb.GraphQLAuthContext do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    case build_context(conn) do
      {:ok, context} ->
        put_private(conn, :absinthe, %{context: context})

      _ -> conn
    end
  end

  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, user, _} <- DominoxirWeb.Guardian.resource_from_token(token) do
      {:ok, %{user: user}}
    end
  end
end
