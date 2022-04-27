defmodule PhxMon.Trainer.Pokemon.Create do
  alias PhxMon.Pokemon
  alias PhxMon.Trainer.Pokemon, as: TrainerPokemon
  alias PhxMon.PokeApi.Client
  alias PhxMon.Repo

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Pokemon.build()
    |> create_pokemon(params)
  end

  defp handle_response({:error, _msg} = error, _params), do: error

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{
         "nickname" => nichname,
         "trainer_id" => trainer_id
       }) do
    params = %{
      name: name,
      nickname: nichname,
      weight: weight,
      types: types,
      trainer_id: trainer_id
    }

    params
    |> TrainerPokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
