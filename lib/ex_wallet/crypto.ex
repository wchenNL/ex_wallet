defmodule ExWallet.Crypto do
  @bitcoin_key "Bitcoin seed"

  def hash_160(public_key) do
    public_key
    |> sha256()
    |> ripemd160()
  end

  def sha256(data),
    do: hash(data, :sha256)

  def ripemd160(data),
    do: hash(data, :ripemd160)

  def hmac_sha512(key \\ @bitcoin_key, data),
    do: :crypto.macN(:hmac, :sha512, key, data, 8)

  defp hash(data, algorithm),
    do: :crypto.hash(algorithm, data)
end
