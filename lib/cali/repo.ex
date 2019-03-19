defmodule Cali.Repo do
  use Ecto.Repo,
    otp_app: :cali,
    adapter: Ecto.Adapters.Postgres

  @doc """
  Dynamically loads the repo URL from the DATABASE_URL
  environment varaible.
  """
  def init(_, opts) do
    {:ok, opts}
  end

end
