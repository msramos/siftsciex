defmodule Siftsciex.Event.Transport do
  @moduledoc false

  @type result :: {:ok, HTTPoison.Response.t}
                  | {:error, HTTPoison.Error.t}

  @doc false
  @spec post(map) :: result
  def post(payload) do
    {:ok, json} = Poison.encode(payload)

    transporter().post(url(), json)
  end

  defp transporter do
    Application.get_env(:siftsciex, :http_transport) || HTTPoison
  end

  defp url, do: Application.get_env(:siftsciex, :events_url)
end
