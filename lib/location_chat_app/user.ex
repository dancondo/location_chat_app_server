defmodule LocationChatApp.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do

    field :bio,                 :string
    field :picture,             :string
    field :visible,             :boolean
    field :birthdate,           :naive_datetime
    field :last_name,           :string, size: 40
    field :first_name,          :string, size: 40
    field :facebook_id,         :string, size: 126
    field :geolocation,         Geo.PostGIS.Geometry
    field :gender,              Ecto.Enum, values: [:genders]
    field :gender_preferences,  {:array, Ecto.Enum}, values: [:genders]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
