defmodule Hocto.Person do
  use Ecto.Schema

  schema "people" do
    field :first_name, :string
    field :last_name, :string
    field :pin, :integer
  end
end
