defmodule ExNip do
  @moduledoc """
  Library for NIP number.

  * `ExNip.valid?/1` - you can check if NIP number is valid

  More about NIP number:
  * [Wikipedia PL](https://pl.wikipedia.org/wiki/NIP)
  """

  alias ExNip.Nip

  @doc """
  Is NIP number valid?

  NIP is valid when:
    * length of it is 10 digits
    * or length of it is 13 with mask "000-000-00-00" or "000-00-00-000"
    * last digit is proper checksum for first nine digits

  For example:
      iex> ExNip.valid?("1060000062")
      true

      iex> ExNip.valid?("106-00-00-062")
      true

      iex> ExNip.valid?("106-000-00-62")
      true

      iex> ExNip.valid?("1234567890")
      false

      iex> ExNip.valid?("1060000061")
      false

      iex> ExNip.valid?("10-600-00-062")
      false

      iex> ExNip.valid?("123")
      false

      iex> ExNip.valid?("12321212121212121212")
      false

      iex> ExNip.valid?("some really bad data")
      false
  """
  @spec valid?(String.t()) :: boolean()
  defdelegate valid?(nip), to: Nip
end
