defmodule PhxMonWeb.TrainersView do
  use PhxMonWeb, :view
  alias PhxMon.Trainer

  def render("create.json", %{
        trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at},
        token: token,
        message: message
      }) do
    %{
      message: message,
      token: token,
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end

  def render("sign_in.json", token: token) do
    %{
      token: token
    }
  end

  def render("show.json", %{
        trainer: %Trainer{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at,
          pokemon: pokemon
        }
      }) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      updated_at: updated_at,
      pokemon: pokemon
    }
  end

  def render("update.json", %{
        trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at},
        message: message
      }) do
    %{
      message: message,
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end
end
