defmodule BestGameWeb.NflController do
  use BestGameWeb, :controller

  def index(conn, _params) do
    standings = nfl_standings()
    :timer.sleep(1001)
    schedule = nfl_schedule()
    # schedule = {}
    render conn, "index.html", nfl_standings: standings, nfl_schedule: schedule
  end

  def nfl_standings() do
    Nfl.standings()
  end

  def nfl_schedule() do
    Nfl.schedule()
  end

end
