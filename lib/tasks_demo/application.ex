defmodule TasksDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TasksDemoWeb.Telemetry,
      TasksDemo.Repo,
      {DNSCluster, query: Application.get_env(:tasks_demo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TasksDemo.PubSub},
      # Start a worker by calling: TasksDemo.Worker.start_link(arg)
      # {TasksDemo.Worker, arg},
      # Start to serve requests, typically the last entry
      TasksDemoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TasksDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TasksDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
