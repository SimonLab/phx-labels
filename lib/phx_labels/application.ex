defmodule PhxLabels.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxLabelsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxLabels.PubSub},
      # Start the Endpoint (http/https)
      PhxLabelsWeb.Endpoint
      # Start a worker by calling: PhxLabels.Worker.start_link(arg)
      # {PhxLabels.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxLabels.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxLabelsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
