defmodule BestGameWeb.NflController do
  use BestGameWeb, :controller



  def index(conn, _params) do
    standings = nfl_standings()
    # :timer.sleep(1001)
    # schedule = nfl_schedule()
    schedule = {}
    render conn, "index.html", nfl_standings: standings, nfl_schedule: schedule
  end

  def nfl_standings() do
    url = "#{root_url()}seasons/2018/standings.json?api_key=#{key()}"
    list = Tuple.to_list(get(url))
    is_map(List.last(list))
  end

  def nfl_schedule() do
    url = "#{root_url()}games/2018/REG/4/schedule.json?api_key=#{key()}"
    is_tuple(get(url))
  end

  def root_url() do
    "https://api.sportradar.us/nfl/official/trial/v5/es/"
  end

  def key() do
    "v63vdke86u7r2eh2fdgrz7v8"
  end

  def get(url, headers \\ []) do
    url
  |> HTTPoison.get(headers)
  |> case do
      {:ok, %{body: raw, status_code: code}} -> {code, raw}
      {:error, %{reason: reason}} -> {:error, reason}
     end
  |> (fn {ok, body} ->
        body
        |> Poison.decode(keys: :atoms)
        |> case do
             {:ok, parsed} -> {ok, parsed}
             _ -> {:error, body}
           end
      end).()
  end
end
