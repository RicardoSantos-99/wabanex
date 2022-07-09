defmodule Wabanex.Imc do
  def calculate_imc(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:error, _reason}), do: {:error, "Error while reading file"}

  defp handle_file({:ok, content}) do
    content
    |> String.split("\n")
    |> Enum.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.split(",")
  end
end
