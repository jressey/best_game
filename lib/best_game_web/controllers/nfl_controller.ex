defmodule BestGameWeb.NflController do
  use BestGameWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end