defmodule CaliWeb.Admin.PostController do
  use CaliWeb, :controller

  alias Cali.CMS
  alias CMS.Post

  def index(conn, _) do
    posts = CMS.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _) do
    changeset = CMS.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case CMS.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post saved")
        |> redirect(to: Routes.admin_post_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end


  def edit(conn, %{"id" => id}) do
    post = CMS.get_post!(id)
    changeset = CMS.change_post(post)

    render(conn, "edit.html", changeset: changeset, post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = CMS.get_post!(id)

    case CMS.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post saved")
        |> redirect(to: Routes.admin_post_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "edit.html", changeset: changeset, post: post)
    end
  end


end