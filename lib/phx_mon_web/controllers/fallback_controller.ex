defmodule PhxMonWeb.FallbackController do
  use PhxMonWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(PhxMonWeb.ErrorView)
    |> render("401.json", message: "Trainer unauthorized")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PhxMonWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
