defmodule FindMyPersonal.MemberFixture do
  alias FindMyPersonal.Members
  alias FindMyPersonal.Teachers

  def valid_attrs,
    do: %{
      "teacher_id" => get_teacher(),
      "avatar_url" =>
        "https://images.unsplash.com/photo-1540206276207-3af25c08abc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2468&q=80",
      "birth_date" => "1984-04-24",
      "blood" => "O",
      "email" => "romenigld@gmail.com",
      "height" => "1.77",
      "name" => "romenigld",
      "weight" => "76"
    }

  def update_attrs,
    do: %{
      "teacher_id" => get_teacher(),
      "avatar_url" =>
        "https://images.unsplash.com/photo-1540206276207-3af25c08abc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2468&q=80",
      "birth_date" => "1984-04-24",
      "blood" => "O",
      "email" => "update@test.com",
      "height" => "1.77",
      "name" => "update romenigld",
      "weight" => "75"
    }

  def invalid_attrs,
    do: %{
      "teacher_id" => get_teacher(),
      "avatar_url" => "",
      "birth_date" => "",
      "blood" => "",
      "email" => "",
      "height" => "",
      "name" => "",
      "weight" => ""
    }

  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(valid_attrs())
      |> Members.create_member()

    member
  end

  def get_teacher() do
    {:ok, teacher} =
      %{
        avatar_url: "some avatar_url",
        birth_date: ~D[2010-04-17],
        class_type: "some class_type",
        education_level: "some education_level",
        name: "some name"
      }
      |> Teachers.create_teacher()

    teacher.id
  end
end
