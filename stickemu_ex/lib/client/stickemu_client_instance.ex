defmodule StickemuEx.Client.ClientInstance do
  @moduledoc """
  A client instance, keeping track of client state, and handling
  incoming packets.
  """
  use GenServer

  defmodule CharacterState do
    defstruct do
      name: "",             # Username
      uid: "",              # Unique ID assigned on login
      wins: 0,              # Total user wins
      losses: 0,            # Total user losses
      draws: 0,             # Total user draws
      room_name: "",        # Name of the current room
      room_pid: :undefined  # PID of the current room

      # TODO: Consider moving these to a record in room instance,
      # propagating to persistent storage at the end of the round?
      gamekills: 0,         # Kills in the current game
      gamedeaths: 0,        # Deaths in the current game
      gamedraws: 0,         # Draws in the current game
    end
  end

  defmodule ClientState do
    @moduledoc """
    Internal state for a client.
    """
    socket: :undefined,    # Socket
    character: :undefined
  end


  # Client API
  def start_link(socket) do
    GenServer.start_link(__MODULE__, [socket])
  end
  

  # Internal Functions


  # GenServer Callbacks
  def init([socket]) do
    {:ok, %ClientState{socket: socket}}
  end

  def handle_call(_, _, state) do
    {:reply, :not_implemented, state}
  end

  def handle_cast(_, state) do
    {:noreply, state}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end

end
