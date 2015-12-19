defmodule StickemuEx.Client.Supervisor do
  use Supervisor
 
  ## Client API

  @doc """
  Starts the supervisor for the client subsystem
  """
  def start_link() do
    Supervisor.start_link(__MODULE__, [])
  end


  ## Callbacks

  def init([]) do
    children = [
      supervisor(StickemuEx.Client.InstanceSupervisor, [], restart: :permanent),
      worker(StickemuEx.Client.Registry, [], restart: :permanent)
      worker(StickemuEx.Client.Listener, [], restart: :permanent),
    ]

    opts = [strategy: :one_for_one, name: StickemuEx.Client.Supervisor] 
    supervise(children, opts)
  end

end
