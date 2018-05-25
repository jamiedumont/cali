defmodule CaliWeb.Plug.Analytics do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _options) do
    r = extract_referer(conn)

    attrs = %{
      referer: r,
      page: conn.request_path,
      internal_referer: is_internal(r),
    }

    Cali.Analytics.log_page(attrs)

    conn

  end

  defp extract_referer(conn) do
    case get_req_header(conn, "referer") do
      [referer | _tail ] -> referer
      _ -> nil
    end
  end

  defp host() do
    CaliWeb.Endpoint.config(:url)[:host]
  end

  defp is_internal(referer) do
    !Regex.match?(~r/(\Awww\.)?#{referer}.*\z/i, host())
  end

end
