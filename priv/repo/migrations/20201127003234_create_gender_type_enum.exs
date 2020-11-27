defmodule LocationChatApp.Repo.Migrations.CreateGenderTypeEnum do
  use Ecto.Migration

  def change do
    GenderEnum.create_type
    create table(:enums_pg) do
      add :genders, GenderEnum.type()
    end
  end
end
