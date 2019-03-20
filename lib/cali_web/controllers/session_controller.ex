defmodule CaliWeb.SessionController do
  use CaliWeb, :controller

  alias Cali.Accounts


  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_by_email_password(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Hello again #{user.name}!")
        |> put_session(:user_id, user.id)
        |> put_session(:current_user, user)
        |> configure_session(renew: true)
        |> redirect(to: "/")

      {:error, _} ->
        conn
        |> put_flash(:error, "Sorry but those details didn't work")
        |> redirect(to: Routes.session_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end
end
