defmodule StickemuEx.Client.Handler.PacketHandlerDispatcher do

  @doc """
  Retrieves the packet header from the packet.
  Packets beginning with a "0" have headers of length 2, otherwise
  the header is the first character.
  """
  @spec split_header(String.t) :: {:ok, String.t, String.t} | :invalid_format
  def split_header(packet) do
    if String.length(packet) > 2 do
      starts_with_zero = packet.starts_with?(packet, "0")
      split_offset = if starts_with_zero do 2 else 1 end
      {x, y} = String.split_at(packet, split_offset)
      {:ok, x, y}
    else
      :invalid_format
    end
  end


  @doc """
  Handles a packet, dispatching to the relevant packet handler.
  """
  # Ping packets are a no op
  def handle_packet(packet, state) when packet == "0" do
    state
  end

  # Otherwise, grab the header and dispatch to the corresponding
  # packet handler.
  def handle_packet(packet, state) do
    split_result = split_header(packet)
    case split_result do
      # Generic send packet_data
      {:ok, "00", packet_data} -> state
      # Room list request
      {:ok, "01", packet_data} -> state
      # Create room
      {:ok, "02", packet_data} -> state
      # New player
      {:ok, "03", packet_data} -> state
      # Room detail request
      {:ok, "04", packet_data} -> state
      # Set cycle list
      {:ok, "05", packet_data} -> state
      # Round detail request
      {:ok, "06", packet_data} -> state
      # Check capacity
      {:ok, "08", packet_data} -> state
      # Login
      {:ok, "09", packet_data} -> state
      # Buy item
      {:ok, "0b", packet_data} -> state
      # Inventory request
      {:ok, "0c", packet_data} -> state
      # Set active item
      {:ok, "0d", packet_data} -> state
      # Kill player
      {:ok, "7", packet_data} -> state
      # General chat
      {:ok, "9", packet_data} -> state
      # Generic packet_data broadcast
      {:ok, "1", packet_data} -> state
      {:ok, "2", packet_data} -> state
      {:ok, "3", packet_data} -> state
      {:ok, "4", packet_data} -> state
      {:ok, "5", packet_data} -> state
      {:ok, "6", packet_data} -> state
      {:ok, "8", packet_data} -> state
      other ->
        Logger.warn("Unhandled packet #{packet}")
        state
    end
    
  end

end
