#doors.rb
class Door
  def initialize(inscription = "", locked = true, closed = true)
    @inscription = inscription
    @locked = locked
    @closed = closed
  end
end
