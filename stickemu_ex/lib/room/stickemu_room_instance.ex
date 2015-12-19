defmodule StickemuEx.Room.RoomInstance do
  @moduledoc """
  An instance of a Stick room.
  """
  use GenServer

  defmodule RoomState do
    @moduledoc """
    Struct recording the current state of the room
    """
    defstruct do
      room_name: "",            # Room name
      map_id: "",               # Map ID
      creator_name: "",         # Name of the character which created the room
      is_lobby: false,          # True if the room is a lobby; false otherwise
      cycle_mode: -1,           # Cycle mode
      cycle_list: "",           # Cycle list
      is_private: false,        # Privacy
      players: HashDict.new,    # Map: UID |-> Client PID
      timer: :not_implemented   # Timer (however I'm going to do it...)
    end
  end

  # Client API
  @doc """
  Add a player with identifier `uid` and client pid `pid` to the `room`
  """
  def join_room(room, uid, pid) do
    GenServer.call(room, {:join, uid, pid})
  end

  @doc """
  Deregister the player with identifier `uid` from the `room`.
  """
  def leave_room(room, uid) do
    GenServer.call(room, {:leave, uid})
  end

  @doc """
  Broadcasts the `packet` to the `room`.
  """
  def broadcast(room, packet) do
    GenServer.cast(room, {:broadcast, room, uid})
  end

  @doc """
  Broadcasts the `packet` to the `room`, except for `sender_uid`.
  """
  def broadcast(room, packet, sender_uid) do
    GenServer.cast(room, {:broadcast, room, paqcket, sender_uid})
  end


  # Internal Functions

  # Callbacks

  def init([room_name, map_id, creator_name,
    is_lobby, cycle_mode, cycle_list, is_private]) do
    
    {:ok,
      %RoomState{
        room_name: room_name,
        map_id: map_id,
        creator_name: creator_name,
        is_lobby: is_lobby,
        cycle_mode: cycle_mode,
        cycle_list: cycle_list,
        is_private: is_private}
    }
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
