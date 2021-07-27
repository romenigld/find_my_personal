defmodule FindMyPersonal.Repo.Migrations.CreateTeachers do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :avatar_url, :string
      add :name, :string
      add :birth_date, :date
      add :education_level, :string
      add :class_type, :string

      timestamps()
    end
  end
end
