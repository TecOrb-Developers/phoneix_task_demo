defmodule TasksDemoWeb.UserController do
  use TasksDemoWeb, :controller
  alias TasksDemo.RailsClient

  def index(conn, _params) do
    case RailsClient.get_users() do
      {:ok, users} ->
        render(conn, :index, users: users)
      
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Could not load users from Rails API")
        |> render(:index, users: [])
    end
  end
end