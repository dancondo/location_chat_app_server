defmodule LocationChatAppWeb.AuthView do
  use LocationChatAppWeb, :view
  alias LocationChatAppWeb.AuthView

  def render("index.json", %{auth: auth}) do
    %{data: render_many(auth, AuthView, "auth.json")}
  end

  def render("show.json", %{auth: auth}) do
    %{data: render_one(auth, AuthView, "auth.json")}
  end

  def render("auth.json", %{auth: auth}) do
    %{id: auth.id}
  end
end
