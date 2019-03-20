defmodule CaliWeb.Admin.PostController do
  use CaliWeb, :controller

  alias Cali.CMS

  def index(conn, _) do
    posts = CMS.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def edit(conn, %{"id" => id}) do
    post = CMS.get_post!(id)
    changeset = CMS.change_post(post)

    render(conn, "edit.html", changeset: changeset, post: post)
  end

end
