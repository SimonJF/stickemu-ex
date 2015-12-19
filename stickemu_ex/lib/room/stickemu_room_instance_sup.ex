defmodule StickemuEx.Room.InstanceSupervisor do
  use Supervisor

  ## Client API
  @doc """
  Starts the room instance supervisor using the simple one-for-one strategy.
  """
  def start_link([]) do
    Supervisor.start_link(__MODULE__, [])
  end

  @doc """
  Starts a new room instance, with the given `name`.
  """
  def start_room_instance(name) do
    Supervisor.start_child(StickemuEx.Room.InstanceSupervisor,
      [name])
  end

  ## Callbacks
  def init([]) do
    children = [StickemuEx.Room.Instance, [], restart: :temporary]
    opts = [strategy: :simple_one_for_one,
            name: StickemuEx.Room.InstanceSupervisor]

    supervise(children, opts)
  end

end
