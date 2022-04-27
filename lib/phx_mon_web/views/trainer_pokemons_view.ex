defmodule PhxMonWeb.TrainerPokemonsView do
  use PhxMonWeb, :view
  alias PhxMon.Trainer.Pokemon

  def render("new/edit.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        },
        message: message
      }) do
    %{
      message: message,
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at,
          nickname: nickname,
          types: types,
          trainer: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at,
        nickname: nickname,
        types: types,
        trainer: %{trainer_id: trainer_id, name: trainer_name},
        weight: weight
      }
    }
  end
end
