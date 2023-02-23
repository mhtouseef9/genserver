defmodule PersistState.CourtPiece do
  @moduledoc false

  use GenServer

  def start_link(attrs \\ []) do
    IO.inspect(attrs, label: "start link attrs:")
#    we can pass game_name as name in attrs
    GenServer.start_link(__MODULE__, attrs, name: __MODULE__)
#    send(self(), :start_game)
  end

  def start_game(attrs) do
    IO.inspect(attrs, label: "start game attrs:")
    GenServer.call(__MODULE__, {:start_game, attrs})
  end

  def join_player(%{player_id: player_id}) do
    IO.inspect(player_id, label: "join player attrs:")
    GenServer.call(__MODULE__, {:join_player, player_id})
  end

  def leave_player(%{player_id: player_id}) do
    IO.inspect(player_id, label: "leave player attrs:")
    GenServer.call(__MODULE__, {:leave_player, player_id})
  end

  def current_joined_players() do
    GenServer.call(__MODULE__, {:current_joined_players})
  end

  def turn(attrs) do
    IO.inspect(attrs, label: "turn attrs:")
    GenServer.call(__MODULE__, {:turn, attrs})
  end

  def end_game(attrs) do
    IO.inspect(attrs, label: "end game attrs:")
    GenServer.stop(__MODULE__, :normal)
  end
#  ----------------------------------
#      Genserver callbacks
#  ----------------------------------

  @impl true
  def init(attrs) do
    IO.inspect(attrs, label: "init attrs:")
    {:ok, attrs}
  end

  @impl true
  def handle_call({:start_game, attrs}, _from, state) do
    IO.inspect(state, label: "handle_call(start_game) state:")
    IO.inspect(attrs, label: "handle_call(start_game) attrs:")
    {:reply, attrs, state}
  end

  @impl true
  def handle_call({:join_player, player_id}, _from, state) do
    IO.inspect(state, label: "handle_call(join player) state:")
    IO.inspect(player_id, label: "handle_call(join player) attrs:")
    updated_players = [player_id | state]
    {:reply, updated_players, updated_players}
  end

  @impl true
  def handle_call({:leave_player, player_id}, _from, state) do
    IO.inspect(state, label: "handle_call(leave_player) state:")
    IO.inspect(player_id, label: "handle_call(leave_player) attrs:")
    updated_players = state -- [player_id]
    {:reply, updated_players, updated_players}
  end

  @impl true
  def handle_call({:current_joined_players}, _from, state) do
    IO.inspect(state, label: "handle_call(joined players) state:")
    {:reply, state, state}
  end

  @impl true
  def handle_call({:turn, attrs}, _from, state) do
    IO.inspect(state, label: "handle_call(turn) state:")
    IO.inspect(attrs, label: "handle_call(turn) attrs:")
    {:reply, attrs, state}
  end
#
#  @impl true
#  def terminate(reason, state) do
#    IO.inspect(state, label: "terminate state:")
#    :ok
#  end

  @impl true
  def handle_info(:start_game, state) do
    IO.inspect(state, label: "handle_info attrs:")
    {:noreply, state}
  end

#  @impl true
#  def handle_cast(:start_game, state) do
#    IO.inspect(state, label: "handle_info attrs:")
#    {:noreply, state}
#  end
end
