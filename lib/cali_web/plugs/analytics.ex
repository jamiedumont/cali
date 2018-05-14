defmodule CaliWeb.Plug.Analytics do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _options) do
    IO.inspect conn
  end

end
