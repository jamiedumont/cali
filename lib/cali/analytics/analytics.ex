defmodule Cali.Analytics do
  alias Cali.Analytics.PageView

  def log_page(attrs) do
    attrs = Map.put(attrs, :datetime, DateTime.utc_now)
    IO.inspect attrs
    Cali.Repo.insert(PageView.changeset(%PageView{}, attrs))
  end

  def all() do
    Cali.Repo.all(PageView)
  end
end
