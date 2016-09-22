#doors.rb
class Door

  attr_accessor :closed, :locked
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

  ###Why won't closed chaged without the @
  def open_door
    if locked == false && closed == true
      @closed=false
    else
      raise ArgumentError.new("A door can only be opened if it's closed and unlocked")
    end
  end

  def close_door
    if closed == false
      @closed=true
    else
      raise ArgumentError.new("A door can only be closed if it's open")
    end
  end

  def lock
    if locked == false
      @locked=true
    else
      raise ArgumentError.new("This door is already locked")
    end
  end

  def unlock
    if locked == true
      @locked=false
    else
      raise ArgumentError.new("This door is already unlocked")
    end
  end

  def closed?
    if closed == true
      return "This door is closed"
    else
      return "This door is open"
    end
  end

  def locked?
    if locked == true
      return "This door is locked"
    else
      return "This door is unlocked"
    end
  end

  def show_inscription
    if inscription == ""
      return "There is no inscription on this door"
    else
      return inscription
    end
  end

end
