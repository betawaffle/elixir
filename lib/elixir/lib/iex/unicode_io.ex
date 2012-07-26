defmodule IEx.UnicodeIO do
  @moduledoc """
  This module implements the API used by IEX to
  interact with the console. This API may change
  in the future without warnings.
  """

  @doc """
  Implements the get IO API used by IEx. It receives the
  code cache, the instructions counter and needs to
  return a list with the new characters inserted.
  """
  def get(config) do
    prompt = case config.cache do
      [] -> "iex(#{config.counter})> "
      _  -> "...(#{config.counter})> "
    end
    :unicode.characters_to_list(IO.gets(prompt))
  end

  @doc """
  Implements the put IO API used by IEx. It receives the
  result and prints it.
  """
  def put(result) do
    IO.inspect result
  end

  @doc """
  Implements the error IO API used by IEx. It prints error
  messages.
  """
  def error(result) do
    IO.puts :standard_error, result
  end
end