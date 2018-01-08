defmodule ExNip.Nip do
  @moduledoc false

  # wages for calculating NIP checksum
  @w [6, 5, 7, 2, 3, 4, 5, 6, 7]

  # NIP is valid
  # when checksum for 9 first digits is equal to 10 digit
  @spec valid?(String.t()) :: boolean()
  def valid?(nip) when is_binary(nip), do: checksum?(to_list(nip), @w, 0)

  defp checksum?([crc], [], acc),         do: crc == rem(acc, 11)
  defp checksum?([x | r], [w | rw], acc), do: checksum?(r, rw, x * w + acc)
  defp checksum?(_, _, _),                do: false

  # Transposing NIP to list of digits
  defp to_list(nip) do
    nip
    |> filter_dashes()
    |> scan()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp filter_dashes(nip), do: filter(String.graphemes(nip))

  defp filter([s1, s2, s3, "-", s5, s6, s7, "-", s9, s10, "-", s12, s13]) do
    s1 <> s2 <> s3 <> s5 <> s6 <> s7 <> s9 <> s10 <> s12 <> s13
  end
  defp filter([s1, s2, s3, "-", s5, s6, "-", s8, s9, "-", s11, s12, s13]) do
    s1 <> s2 <> s3 <> s5 <> s6 <> s8 <> s9 <> s11 <> s12 <> s13
  end
  defp filter(nip), do: Enum.join(nip)

  defp scan(nip), do: resolve(Regex.scan(~r/^\d{10}$/, nip))
  defp resolve([]),      do: ""
  defp resolve([[nip]]), do: nip
end
