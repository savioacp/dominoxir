defmodule Dominoxir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Dominoxir.Repo,
      # Start the Telemetry supervisor
      DominoxirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Dominoxir.PubSub},
      # Start the Endpoint (http/https)
      DominoxirWeb.Endpoint,
      # Start a worker by calling: Dominoxir.Worker.start_link(arg)
      # {Dominoxir.Worker, arg}
      {Dominoxir.RoomsAgent, initial_value: %{}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dominoxir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DominoxirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
