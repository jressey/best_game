defmodule BestGameWeb.NflController do
  use BestGameWeb, :controller



  def index(conn, _params) do
    render conn, "index.html", nfl_data: nfl_standings()
  end

  def nfl_standings() do
    url = "https://api.nfl.com"
    key = "v63vdke86u7r2eh2fdgrz7v8"
    get("https://api.sportradar.us/nfl/official/trial/v5/es/seasons/2018/standings.json?api_key=#{key}")
  end

  def get(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end
end
