defmodule PhxMonWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :phx_mon

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
