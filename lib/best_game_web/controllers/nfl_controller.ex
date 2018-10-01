defmodule BestGameWeb.NflController do
  use BestGameWeb, :controller

  def index(conn, _params) do
    # standings = nfl_standings()
    # :timer.sleep(1001)
    schedule = nfl_schedule()
    standings = {}
    render conn, :index, nfl_standings: standings, nfl_schedule: schedule
  end

  def nfl_standings() do
    Nfl.standings()
  end

  def nfl_schedule() do
    games = get_in(Nfl.schedule(), [:week, :games])
    team_pairs = Enum.map(games, fn (x) -> %{away: x[:away], home: x[:home]} end)
    team_pairs
  end
end
