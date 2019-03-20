defmodule CaliWeb.Plug.SetCurrentUser do
  import Plug.Conn

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && repo.get(Cali.Accounts.User, user_id) ->
        conn
        |> assign(:current_user, user)
        |> assign(:user_signed_in?, true)
      true ->
        conn
        |> assign(:current_user, nil)
        |> assign(:user_signed_in?, :false)
    end
  end
end
