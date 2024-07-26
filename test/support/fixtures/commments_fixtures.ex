defmodule ElixirGist.CommmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirGist.Commments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        markup_text: "some markup_text"
      })
      |> ElixirGist.Commments.create_comment()

    comment
  end
end
