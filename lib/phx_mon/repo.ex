defmodule PhxMon.Repo do
  use Ecto.Repo,
    otp_app: :phx_mon,
    adapter: Ecto.Adapters.Postgres
end
