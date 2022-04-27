defmodule PhxMonWeb.WelcomeController do
  use PhxMonWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to the PhxMon API!")
  end
end
