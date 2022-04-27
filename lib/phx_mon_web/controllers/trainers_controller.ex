defmodule PhxMonWeb.TrainersController do
  use PhxMonWeb, :controller

  alias PhxMonWeb.Auth.Guardian

  action_fallback PhxMonWeb.FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- PhxMon.create_trainer(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(trainer) do
      conn
      |> put_status(:created)
      |> render("create.json", %{trainer: trainer, token: token, message: "Trainer created!"})
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  def delete(conn, %{"id" => id}) do
    id
    |> PhxMon.delete_trainer()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> PhxMon.fetch_trainer()
    |> handle_response(conn, "show.json", :ok, "")
  end

  def update(conn, params) do
    params
    |> PhxMon.update_trainer()
    |> handle_response(conn, "update.json", :ok, "Trainer updated!")
  end

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, trainer}, conn, view, status, message) do
    conn
    |> put_status(status)
    |> render(view, trainer: trainer, message: message)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status, _message), do: error
end
