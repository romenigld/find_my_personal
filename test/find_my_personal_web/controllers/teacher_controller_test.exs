defmodule FindMyPersonalWeb.TeacherControllerTest do
  use FindMyPersonalWeb.ConnCase

  alias FindMyPersonal.{Teachers, Teachers.Teacher}

  @create_attrs %{
    avatar_url: "some avatar_url",
    birth_date: ~D[2010-04-17],
    class_type: "some class_type",
    education_level: "some education_level",
    name: "some name"
  }
  @update_attrs %{
    avatar_url: "some updated avatar_url",
    birth_date: ~D[2011-05-18],
    class_type: "some updated class_type",
    education_level: "some updated education_level",
    name: "some updated name"
  }
  @invalid_attrs %{
    avatar_url: nil,
    birth_date: nil,
    class_type: nil,
    education_level: nil,
    name: nil
  }

  def fixture(:teacher) do
    {:ok, teacher} = Teachers.create_teacher(@create_attrs)
    teacher
  end

  describe "index" do
    test "lists all teachers", %{conn: conn} do
      conn = get(conn, Routes.teacher_path(conn, :index))
      assert html_response(conn, 200) =~ "Instrutores"
    end

    test "lists all teachers using filter search", %{conn: conn} do
      conn = get(conn, Routes.teacher_path(conn, :search, %{"filter" => ""}))
      assert html_response(conn, 200) =~ "Instrutores"
    end
  end

  describe "create teacher" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.teacher_path(conn, :new))
      assert html_response(conn, 200) =~ "New Teacher"
    end

    test "create_teacher/1 with valid data creates a teacher", %{conn: _conn} do
      assert {:ok, %Teacher{} = teacher} = Teachers.create_teacher(@create_attrs)
      assert teacher.avatar_url == "some avatar_url"
      assert teacher.birth_date == ~D[2010-04-17]
      assert teacher.class_type == "some class_type"
      assert teacher.education_level == "some education_level"
      assert teacher.name == "some name"
    end

    test "create_teacher/1 with invalid data returns error changeset", %{conn: _conn} do
      assert {:error, %Ecto.Changeset{} = _changeset} = Teachers.create_teacher(@invalid_attrs)
      # assert "can't be blank" = errors_on(changeset).name
      # assert %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "renders to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.teacher_path(conn, :create), teacher: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.teacher_path(conn, :show, id)

      conn = get(conn, Routes.teacher_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Saiba Mais"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.teacher_path(conn, :create), teacher: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Teacher"
    end
  end

  describe "edit teacher" do
    setup [:create_teacher]

    test "renders form_for editing chosen teacher", %{conn: conn, teacher: teacher} do
      conn = get(conn, Routes.teacher_path(conn, :edit, teacher))
      assert html_response(conn, 200) =~ "Edit Teacher"
    end
  end

  describe "update teacher" do
    setup [:create_teacher]

    test "redirects when data is valid", %{conn: conn, teacher: teacher} do
      conn = put(conn, Routes.teacher_path(conn, :update, teacher), teacher: @update_attrs)
      assert redirected_to(conn) == Routes.teacher_path(conn, :show, teacher)

      conn = get(conn, Routes.teacher_path(conn, :show, teacher))

      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, teacher: teacher} do
      conn = put(conn, Routes.teacher_path(conn, :update, teacher), teacher: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Teacher"
    end
  end

  describe "delete teacher" do
    setup [:create_teacher]

    test "deletes chosen teacher", %{conn: conn, teacher: teacher} do
      conn = delete(conn, Routes.teacher_path(conn, :delete, teacher))
      assert redirected_to(conn) == Routes.teacher_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.teacher_path(conn, :show, teacher))
      end
    end
  end

  defp create_teacher(_) do
    teacher = fixture(:teacher)
    %{teacher: teacher}
  end
end
