defmodule LocationChatAppWeb.AuthController do
  use LocationChatAppWeb, :controller

  alias LocationChatAppWeb.AuthService

  action_fallback LocationChatAppWeb.FallbackController

  def facebook(conn, %{ "token" => token }) do
    user = AuthService.authWithFacebook(token)
    render(conn, "index.json", user: user)
  end
end
