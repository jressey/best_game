defmodule Nfl do

  def standings() do
    NflApi.getStandings()
  end

  def schedule() do
    NflApi.getSchedule()
  end
end
