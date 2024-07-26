defmodule ElixirGist.CommmentsTest do
  use ElixirGist.DataCase

  alias ElixirGist.Commments

  describe "comments" do
    alias ElixirGist.Commments.Comment

    import ElixirGist.CommmentsFixtures

    @invalid_attrs %{markup_text: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Commments.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Commments.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{markup_text: "some markup_text"}

      assert {:ok, %Comment{} = comment} = Commments.create_comment(valid_attrs)
      assert comment.markup_text == "some markup_text"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Commments.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{markup_text: "some updated markup_text"}

      assert {:ok, %Comment{} = comment} = Commments.update_comment(comment, update_attrs)
      assert comment.markup_text == "some updated markup_text"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Commments.update_comment(comment, @invalid_attrs)
      assert comment == Commments.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Commments.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Commments.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Commments.change_comment(comment)
    end
  end
end
