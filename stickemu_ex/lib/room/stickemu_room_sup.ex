defmodule StickemuEx.Room.Supervisor do
  use Supervisor

  ## Client API
  def start_link([]) do
    Supervisor.start_link(__MODULE__, [])
  end

  ## Callbacks
  def init([]) do
    children = [
      supervisor(StickemuEx.Room.InstanceSupervisor, [], restart: :permanent),
      worker(StickemuEx.Room.Registry, [], restart: :permanent)
    ]

    opts = [strategy: :one_for_one, name: StickemuEx.Room.Supervisor]
    supervise(children, opts)
  end

end
