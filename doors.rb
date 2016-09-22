#doors.rb
class Door
  def initialize(inscription = "", locked=true,closed=true)
    if inscription.class != String || !(locked == true || locked == false) || !(closed == true || closed == false)
      raise ArgumentError
    end
    @inscription = inscription
    @locked = locked
    @closed = closed
  end
end
