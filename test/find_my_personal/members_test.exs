defmodule FindMyPersonal.MembersTest do
  use FindMyPersonal.DataCase

  alias FindMyPersonal.Members
  import FindMyPersonal.MemberFixture

  describe "members" do
    alias FindMyPersonal.Members.Member

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Members.list_members() == [member]
    end

    test "list_members/1 using filters" do
      member = member_fixture()
      assert Members.list_members("romenig") == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Members.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Members.create_member(valid_attrs())
      assert member.birth_date == ~D[1984-04-24]
      assert member.blood == "O"
      assert member.email == "romenigld@gmail.com"
      assert member.height == "1.77"
      assert member.name == "romenigld"
      assert member.weight == "76"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_member(invalid_attrs())
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Members.update_member(member, update_attrs())
      assert member.birth_date == ~D[1984-04-24]
      assert member.blood == "O"
      assert member.email == "update@test.com"
      assert member.height == "1.77"
      assert member.name == "update romenigld"
      assert member.weight == "75"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_member(member, invalid_attrs())
      assert member == Members.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Members.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Members.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Members.change_member(member)
    end
  end
end
