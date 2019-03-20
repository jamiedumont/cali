defmodule CaliWeb.Plug.AuthenticateUser do
  import Plug.Conn
  import Phoenix.Controller

  alias CaliWeb.Router.Helpers, as: Routes

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access this page")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end

end
