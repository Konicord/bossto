defmodule Hocto.Repo do
  use Ecto.Repo,
    otp_app: :hocto,
    adapter: Ecto.Adapters.Postgres
end
