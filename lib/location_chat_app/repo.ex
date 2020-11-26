defmodule LocationChatApp.Repo do
  use Ecto.Repo,
    otp_app: :location_chat_app,
    adapter: Ecto.Adapters.Postgres
end
