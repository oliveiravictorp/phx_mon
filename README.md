# PhxMon

API to create trainers and their pokémons. Consuming [PokéAPI](https://pokeapi.co).

## Dependencies

  * Erlang and Elixir
  * PostgreSQL
  * Software for testing endpoints (Postman, HTTPie, Curl)

## Start

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

## Examples

Trainers:

  * Create a trainer with POST http://localhost:4000/api/trainers?name=Victor&password=123456
  * Sign in with POST http://localhost:4000/api/trainers/signin?id=9730d92c-f1ef-428e-bdbe-fcfef1b36274&password=123456

  The requests below require the Header: Authorization:Bearer token (Trainer login token)
  * Show trainer with GET http://localhost:4000/api/trainers/9730d92c-f1ef-428e-bdbe-fcfef1b36274
  * Delete trainer with DELETE http://localhost:4000/api/trainers/9730d92c-f1ef-428e-bdbe-fcfef1b36274
  * Update trainer with PUT http://localhost:4000/api/trainers/9730d92c-f1ef-428e-bdbe-fcfef1b36274?name=Rafael&password=123456

Pokémons:

  * Show pokémon from PokéAPI with GET http://localhost:4000/api/pokemons/pikachu

  The requests below require the Header: Authorization:Bearer token (Trainer login token)
  * Create a pokémon with POST http://localhost:4000/api/trainer_pokemons?name=charmander&nickname=roberto&trainer_id=9730d92c-f1ef-428e-bdbe-fcfef1b36274
  * Show pokémon with GET http://localhost:4000/api/trainer_pokemons/79fc1288-859c-4b8a-9431-bc56485e6f0f
  * Delete pokémon with DELETE http://localhost:4000/api/trainer_pokemons/79fc1288-859c-4b8a-9431-bc56485e6f0f
  * Update pokémon with PUT http://localhost:4000/api/trainer_pokemons/79fc1288-859c-4b8a-9431-bc56485e6f0f?nickname=josimar

## Tests

  * Run the tests with `mix test`

## References

  * Project taken from the course: https://www.udemy.com/course/elixir-e-phoenix-do-zero
  * Official language website: https://elixir-lang.org
  * Official framework website: https://www.phoenixframework.org/
  * Database website: https://www.postgresql.org
