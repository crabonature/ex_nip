# ExNip

**Elixir library for NIP number.**

  * `ExNip.valid?/1` - you can check if NIP number is valid

  More about NIP number:
  * [Wikipedia PL](https://pl.wikipedia.org/wiki/NIP)

## Usage

```elixir
iex> ExNip.valid?("1060000062")
true

iex> ExNip.valid?("106-00-00-062")
true

iex> ExNip.valid?("106-000-00-62")
true

iex> ExNip.valid?("1234567890")
false
```

## Installation

Package can be installed by adding `ex_nip`
to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_nip, "~> 0.1.0"}
  ]
end
```

## Documentation

Docs can be found at [https://hexdocs.pm/ex_nip](https://hexdocs.pm/ex_nip).

## License

Source code of ex_nip is released under the Apache 2.0 license, see the [LICENSE](LICENSE) file.
