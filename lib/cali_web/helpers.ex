defmodule CaliWeb.Helpers do

  def render_canonical(path_info) do
    path_info
    |> List.insert_at(0, "https://www.jamiedumont.co.uk")
    |> Enum.join("/")
  end

end
