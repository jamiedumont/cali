defmodule CaliWeb.Plug.Analytics do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _options) do
    referer = case get_req_header(conn, "referer") do
      [referer | tail ] -> referer
      _ -> nil
    end
    page = conn.request_path
    Cali.Analytics.log_page(%{ referer: referer, page: page })
    conn
  end

end
