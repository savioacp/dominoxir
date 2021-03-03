defmodule Dominoxir.Repo do
  use Ecto.Repo,
    otp_app: :dominoxir,
    adapter: Ecto.Adapters.Postgres
end
