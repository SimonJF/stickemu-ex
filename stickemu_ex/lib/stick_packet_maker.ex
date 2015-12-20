defmodule StickemuEx.StickPacketMaker do
  
  def relay_packet(uid, header, packet_data) do
    "M#{uid}#{header}#{packet_data}"
  end

end
