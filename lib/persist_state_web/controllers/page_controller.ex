defmodule PersistStateWeb.GameController do
  use PersistStateWeb, :controller
  alias PersistState.CourtPiece

  # currently all game controller function are called through terminal. APIs need to build for those functions
  def start_game(_conn, attrs) do
    start_game(attrs)
  end

  def start_game(attrs \\ []) do
    {:ok, pid} = case CourtPiece.start_link(attrs) do
      {:ok, pid} -> {:ok, pid}
      {:error, {:already_started, pid}} -> {:ok, pid}
    end
    IO.inspect(pid, label: "start response")
    Process.alive?(pid) |> IO.inspect(label: "pid after start---")
    CourtPiece.start_game(attrs)
  end

  def join_player(attrs) do
    CourtPiece.join_player(attrs)
  end

  def leave_player(attrs) do
    CourtPiece.leave_player(attrs)
  end

  def current_joined_players() do
    CourtPiece.current_joined_players()
  end

  def turn(_attrs) do

  end

  def end_game(attrs \\ []) do
    CourtPiece.end_game(attrs)
  end
end
