defmodule LocationChatApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :bio,                 :text
      add :picture,             :string
      add :visible,             :boolean
      add :gender,              :genders
      add :geolocation,         :geometry
      add :birthdate,           :naive_datetime
      add :last_name,           :string, size: 40
      add :first_name,          :string, size: 40
      add :facebook_id,         :string, size: 126
      add :gender_preferences,  {:array, :genders}

      timestamps()
    end
  end
end
