defmodule Hocto.Person do
  use Ecto.Schema

  # validate changes before they go into the database.
  # Casting tells the changeset what parameters are allowed to be passed through in this changeset,
  # and anything not in the list will be ignored.
  def changeset(person, params \\ %{}) do
    person
    |> Ecto.Changeset.cast(params, [:first_name, :last_name, :pin])
    |> Ecto.Changeset.validate_required([:first_name, :last_name, :pin])
  end

  schema "people" do
    field :first_name, :string
    field :last_name, :string
    field :pin, :integer
  end
end
