defmodule TasksDemo.RailsClient do
  @rails_api_url "http://localhost:3000/api/v1"

  def get_users do
    url = "#{@rails_api_url}/users"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        # Success: JSON ko Elixir map mein convert karte hain
        {:ok, Jason.decode!(body)}
      
      {:error, reason} ->
      {:error, reason}
    end
  end

  def get_user(id) do
    url = "#{@rails_api_url}/users/#{id}"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}
      
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}
      
      {:error, reason} ->
        {:error, reason}
    end
  end

  def create_user(username,email) do
    url = "#{@rails_api_url}/users"
    body = Jason.encode!(%{user: %{username: username, email: email}})
    headers = [{"Content-Type", "application/json"}]

    case HTTPoison.post(url, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
       {:ok, Jason.decode!(body)}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
