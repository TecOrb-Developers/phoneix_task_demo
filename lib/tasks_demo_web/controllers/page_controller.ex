defmodule TasksDemoWeb.PageController do
  use TasksDemoWeb, :controller

  def home(conn, %{"name" => name}) do

    message = "Hello, #{String.capitalize(name)}!"

    result = case String.length(name) do
    len when len > 10 -> {:long, "That's a long name!"}
      _ -> {:short, "Nice name!"}
    end
    render(conn, :home, message: message, result: result)
  end
end
