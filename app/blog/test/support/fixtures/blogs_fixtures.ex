defmodule Blog.BlogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Blogs` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Blog.Blogs.create_post()

    post
  end
end
