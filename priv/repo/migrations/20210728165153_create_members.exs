defmodule FindMyPersonal.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :name, :string
      add :email, :string
      add :birth_date, :date
      add :blood, :string
      add :height, :string
      add :weight, :string

      timestamps()
    end
  end
end
