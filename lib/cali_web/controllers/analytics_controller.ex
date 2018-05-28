defmodule CaliWeb.AnalyticsController do
  use CaliWeb, :controller

  def index(conn, _) do
    pageviews = Cali.Analytics.all
    render conn, "index.html", pageviews: pageviews
  end

end
