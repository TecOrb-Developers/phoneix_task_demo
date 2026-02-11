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

  def show(conn, %{"id" => id}) do
    case RailsClient.get_user(id) do
     {:ok, user} ->
        render(conn, :show, user: user)
      {:error, :not_found} ->
        conn
        |> put_flash(:error, "User not found")
        |> redirect(to: ~p"/users")
      
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Could not load user")
        |> redirect(to: ~p"/users")
    end
  end

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"user" => user_params}) do
    username = Map.get(user_params, "username", "")
    email = Map.get(user_params, "email", "")
    case RailsClient.create_user(username, email) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User '#{user["username"]}' created successfully!")
        |> redirect(to: ~p"/users/#{user["id"]}")
      
      {:error, {:validation, errors}} ->
        conn
        |> put_flash(:error, "Validation failed: #{inspect(errors)}")
        |> render(:new, username: username, email: email)
      
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Could not create user. Please try again.")
        |> render(:new, username: username, email: email)
    end
  end
end