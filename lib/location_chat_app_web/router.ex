defmodule LocationChatAppWeb.Router do
  use LocationChatAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LocationChatAppWeb do
    pipe_through :api
  end
end
