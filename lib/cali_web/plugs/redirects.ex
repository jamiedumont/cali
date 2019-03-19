defmodule CaliWeb.Plug.Redirect do
  import Plug.Conn

  @moduledoc """
  Redirects old URLs to current ones. Used in CaliWeb.Endpoint
  """

  def init(options) do
    options
  end

  def call(conn, _options) do
    case check_path(conn.path_info) do
      {:redirect, path} -> redirect(conn, path)
      _ -> conn
    end
  end

  defp check_path(["blog", "build-a-membership-site-with-statamic"]) do
    {:redirect, "/blog/statamic-membership-site"}
  end

  defp check_path(["blog", "private-content-with-statamic"]) do
    {:redirect, "/blog/statamic-membership-site-continued"}
  end

  defp check_path(["blog", "thoughts-on-things-pricing"]) do
    {:redirect, "/blog/thoughts-on-things"}
  end

  defp check_path(["blog", "why-i-axed-my-serverless-app"]) do
    {:redirect, "/blog/serverless"}
  end

  defp check_path(["blog", "discovering-tachyons"]) do
    {:redirect, "/blog/tachyons"}
  end

  defp check_path(["blog", "wordpress-to-statamic-migration"]) do
    {:redirect, "/blog/custom-wordpress-to-statamic-migration"}
  end

  defp check_path(["blog", "book-review--deep-work"]) do
    {:redirect, "/blog/deep-work-review"}
  end

  defp check_path(["blog", "analytics-vs.-user-surveys"]) do
    {:redirect, "/blog/analytics-vs-surveys"}
  end

  defp check_path(["blog", "team-size-as-an-indicator-of-success"]) do
    {:redirect, "/blog/team-size"}
  end

  defp check_path(["blog", "does-using-google-analytics-make-sense-for-your-site"]) do
    {:redirect, "/blog/google-analytics"}
  end

  defp check_path(_path) do
    nil
  end

  defp redirect(conn, path) do
    conn
    |> put_status(:moved_permanently)
    |> Phoenix.Controller.redirect(to: path)
    |> halt
  end

end
