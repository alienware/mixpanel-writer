defmodule MixpanelWriter.Person do
  use Ecto.Schema

  schema "people" do
    field :account_id, :integer
    field :email, :string
    field :phone, :integer
  end
end
