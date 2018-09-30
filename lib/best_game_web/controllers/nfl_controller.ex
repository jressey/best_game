defmodule BestGameWeb.NflController do
  use BestGameWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", foo: get("https://api.github.com")
  end

  def get(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end
end
