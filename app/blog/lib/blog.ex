defmodule Blog do
  @moduledoc """
  Blog keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @app Mix.Project.config()[:app]
  def config_dir() do
    Path.join([Desktop.OS.home(), ".config", "blog"])
  end

  def start(:normal, []) do
    {:ok, sup} = Supervisor.start_link([Blog.Repo], name: __MODULE__, strategy: :one_for_one)
    {:ok, _} = Supervisor.start_child(sup, BlogWeb.Sup)

    {:ok, _} =
      Supervisor.start_child(sup, {
        Desktop.Window,
        [
          app: @app,
          id: BlogWindow,
          title: "BlogApp",
          size: {600, 500},
          url: &BlogWeb.Endpoint.url/0
        ]
      })
  end
end
