defmodule PhxMonWeb.TrainerPokemonsController do
  use PhxMonWeb, :controller

  action_fallback PhxMonWeb.FallbackController

  def create(conn, params) do
    params
    |> PhxMon.create_trainer_pokemon()
    |> handle_response(conn, "new/edit.json", :created, "Pokemon created!")
  end

  def delete(conn, %{"id" => id}) do
    id
    |> PhxMon.delete_trainer_pokemon()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> PhxMon.fetch_trainer_pokemon()
    |> handle_response(conn, "show.json", :ok, "")
  end

  def update(conn, params) do
    params
    |> PhxMon.update_trainer_pokemon()
    |> handle_response(conn, "new/edit.json", :ok, "Pokemon updated!")
  end

  defp handle_delete({:ok, _pokemon}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, pokemon}, conn, view, status, message) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon, message: message)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status, _message), do: error
end
