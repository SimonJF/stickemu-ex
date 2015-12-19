defmodule StickemuEx.Client.InstanceSupervisor do
  use Supervisor

  ## Client API

  @doc """
  Starts a new client instance supervisor, using the simple_one_for_one strategy
  """
  def start_link() do
    Supervisor.start_link(__MODULE__, [])
  end

  @doc """
  Starts a new StickEMU child process with the given `username` and `socket`.
  """
  def start_client_instance(username, socket) do
    Supervisor.start_child(StickemuEx.Client.InstanceSupervisor,
      [username, socket])
  end

  ## Callbacks

  def init([]) do
    children = [
      worker(StickemuEx.Client.Instance, [], restart: :temporary)
    ]

    opts = [strategy: :one_for_one, name: StickemuEx.Client.InstanceSupervisor]
  end

end
