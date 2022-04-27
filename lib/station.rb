class Station

  def initialize (name, zone)

    @info = {name: name, zone: zone}

  end

  def name

    @info[:name]

  end

  def zone

    @info[:zone]

  end

end