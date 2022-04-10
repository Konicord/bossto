# Hocto
Easily query your PostgreSQL data with Ecto && Elixir.

## 👻 Setting up database

Rename `example.config . exs` (config folder) to `config.exs` and fill out the strings with your db informations.

```elixir
import Config # <- don't delete this :: required.

# feel free to rename it to your own project name
config :hocto, ecto_repos: [Hocto.Repo]
config :hocto, Hocto.Repo,
  database: "", # localhost
  username: "", # postgres
  password: "", # either empty or <your password>
  hostname: ""  # localhost (if dev mode)
```

> 😝 Commands

Database basics
```elixir
$ mix ecto.create
```
- [CLI]: The database for <> has been created.

Migration
```elixir
$ mix ecto.gen.migration <some name>
```


`priv/repo/migrations` should be created (empty by default)

After writing schemas/migrations:
```elixir
$ mix ecto.migrate
```

> ###> Queries
After our data is saved, lets run some queries within the CLI.

```elixir
$ iex -S mix
iex> person = %Hocto.Person{}
__meta__: #Ecto.Schema.Metadata<:built, "people">,
  first_name: nil,
  id: nil,
  last_name: nil,
  pin: nil
}
```
Our values are set to `nil` currently. We can set values on these fields by generating a new struct.

```elixir
person = %Hocto.Person{pin: 445}
%Hocto.Person{
  __meta__: #Ecto.Schema.Metadata<:built, "people">,
  first_name: nil,
  id: nil,
  last_name: nil,
  pin: 445
}
```

This would work too (same thing but different syntax): 


`person = %{person | pin: 445}`.

We can now retrive values with the following syntax


`person.pin` => *445*.

> ### New data (insert)
```elixir
iex> person = %Hocto.Person{}
iex> Hocto.Repo.insert(person)

[debug] QUERY OK db=1.5ms decode=0.8ms queue=0.8ms idle=10.7ms
INSERT INTO "people" VALUES (DEFAULT) RETURNING "id" []
{:ok,
 %Hocto.Person{
   __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
   first_name: nil,
   id: 1,
   last_name: nil,
   pin: nil
 }}
```
Awesome! 🎉

Let's go one step deeper and use pattern matching.

```elixir
iex> {:ok, person} = Hocto.Repo.insert person
```

Nice, it's a cool && powerful syntax feature that elixir offers. 