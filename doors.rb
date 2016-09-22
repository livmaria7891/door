#doors.rb
class Door

  attr_accessor :locked, :closed
  attr_reader :inscription

  def initialize(inscription = "", locked=true,closed=true)
    if inscription.class != String || !(locked == true || locked == false) || !(closed == true || closed == false)
      raise ArgumentError
    end

    @locked = locked
    @closed = closed
    @inscription = inscription
  end

  def write_inscription(an_inscription)
    unless inscription == ""
      raise ArgumentError

    else
     if an_inscription.class == String
        @inscription = an_inscription
      else
        raise ArgumentError
     end
    end
  end

end
