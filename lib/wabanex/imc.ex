defmodule Wabanex.Imc do
  def calculate_imc(filename) do
    File.read(filename)
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    content
  end

  defp handle_file({:error, reason}) do
    reason
  end
end
