defmodule PhxMon.Trainer.CreateTest do
  use PhxMon.DataCase

  alias PhxMon.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "when all params are valid, create a trainer" do
      params = %{name: "Victor", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Victor"}} = response
      assert count_after > count_before
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "Victor"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
