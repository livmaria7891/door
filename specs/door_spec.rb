require_relative 'spec_helper.rb'

require_relative '../doors.rb'


describe "Testing Doors" do

  it "Checks that a new door is created if arguments are passed" do
    tst = Door.new("Kitchen", false, false )
    expect(tst.class).must_equal(Door)
  end

  it "Checks that a new door is created if NO arguments are passed" do
    tst=Door.new()
    expect(tst.class).must_equal(Door)
  end

  it "Checks that Argument Error is raised if anything other than a string is passed in the first parameter" do
      #skip
      assert_raises(ArgumentError) { Door.new(5,false,false) }
      assert_raises(ArgumentError) { Door.new(true,false,false) }
      assert_raises(ArgumentError) { Door.new(:symbol,false,false) }
  end

  it "Raises ArgumentError if something besides a boolean is passed as second argument" do
    #skip
    assert_raises(ArgumentError) { Door.new("Kitchen","a") }
    assert_raises(ArgumentError) { Door.new("Kitchen",13) }
    assert_raises(ArgumentError) { Door.new("Kitchen",:symbol) }
  end

  it "Raises ArgumentError if something besides a boolean is passed as third argument" do
    # skip
    assert_raises(ArgumentError) { Door.new("Kitchen",false,"Bedroom") }
    assert_raises(ArgumentError) { Door.new("Kitchen",false,13) }
    assert_raises(ArgumentError) { Door.new("Kitchen",false,:symbol) }
  end

  it "Checks that if only one argument is given, the default values are set" do
    #skip
    tst = Door.new()
    expect(tst.locked).must_equal(true)
    expect(tst.closed).must_equal(true)
    expect(tst.inscription).must_equal("")
  end

  it "Checks that an inscription can be written if one is not already set" do
    tst=Door.new()
    tst.write_inscription("An Inscription")
    tst.inscription.must_equal("An Inscription")
  end

  it "Checks that inscription cannot be changed once set" do
    #skip
    tst=Door.new("Keep this Inscription",false,false)
    assert_raises(ArgumentError) {tst.write_inscription("Can't write this.") }
  end

  it "Checks that .write_inscription() will only take a string as a parameter" do
    #skip
    tst=Door.new()
    assert_raises(ArgumentError) { tst.write_inscription(4) }

    tst=Door.new()
    assert_raises(ArgumentError) { tst.write_inscription(true) }

    tst=Door.new()
    assert_raises(ArgumentError) { tst.write_inscription(:symbol) }

  end

  it "Checks that a door can only be opened if it is unlocked and closed" do
    #skip
    unlocked_and_closed = Door.new("Room",false,true)
    unlocked_and_closed.open_door
    expect(unlocked_and_closed.closed.must_equal(false))

    locked_and_closed = Door.new("Room",true,true)
    assert_raises(ArgumentError) { locked_and_closed.open_door }
    expect(locked_and_closed.closed.must_equal(true))

    unlocked_and_open = Door.new("Room",false,false)
    assert_raises(ArgumentError) { unlocked_and_open.open_door }
    expect(unlocked_and_open.closed.must_equal(false))

    locked_and_open = Door.new("Room",true,false)
    assert_raises(ArgumentError) { locked_and_open.open_door }
    expect(locked_and_open.closed.must_equal(false))

  end

  it "Checks that a door can only be closed if it is not closed" do
    #skip
    unlocked_and_open = Door.new("Room",false,false)
    unlocked_and_open.close_door
    expect(unlocked_and_open.closed.must_equal(true))

    unlocked_and_closed = Door.new("Room",false,true)
    assert_raises(ArgumentError) { unlocked_and_closed.close_door }
    expect(unlocked_and_closed.closed.must_equal(true))

    locked_and_closed = Door.new("Room",true,true)
    assert_raises(ArgumentError) { locked_and_closed.close_door }
    expect(locked_and_closed.closed.must_equal(true))

    locked_and_open = Door.new("Room",true,false)
    locked_and_open.close_door
    expect(locked_and_open.closed.must_equal(true))

  end

  it "Checks that a door can only be locked if it is unlocked" do
    #skip
    unlocked_and_open = Door.new("Room",false,false)
    unlocked_and_open.lock
    expect(unlocked_and_open.locked.must_equal(true))

    unlocked_and_closed = Door.new("Room",false,true)
    unlocked_and_closed.lock
    expect(unlocked_and_closed.locked.must_equal(true))

    locked_and_closed = Door.new("Room",true,true)
    assert_raises(ArgumentError) { locked_and_closed.lock }
    expect(locked_and_closed.locked.must_equal(true))

    locked_and_open = Door.new("Room",true,false)
    assert_raises(ArgumentError) { locked_and_open.lock }
    expect(locked_and_open.locked.must_equal(true))
  end

  it "Checks that a door can only be unlocked if it is locked" do
    #skip
    locked_and_closed = Door.new("Room",true,true)
    locked_and_closed.unlock
    expect(locked_and_closed.locked.must_equal(false))

    locked_and_open = Door.new("Room",true,false)
    locked_and_open.unlock
    expect(locked_and_open.locked.must_equal(false))

    unlocked_and_open = Door.new("Room",false,false)
    assert_raises(ArgumentError) { unlocked_and_open.unlock}
    expect(unlocked_and_open.locked.must_equal(false))

    unlocked_and_closed = Door.new("Room",false,true)
    assert_raises(ArgumentError) { unlocked_and_closed.unlock }
    expect(locked_and_open.locked.must_equal(false))

  end

  it "Checks whether or not a door is closed" do
    skip
    locked_and_closed = Door.new("Room",true,true)
    expect(locked_and_closed.closed?.must_equal("This door is closed"))

    unlocked_and_closed = Door.new("Room",false,true)
    expect(unlocked_and_closed.closed?.must_equal("This door is closed"))

    locked_and_open = Door.new("Room",true,false)
    expect(locked_and_open.closed?.must_equal("This door is open"))

    unlocked_and_open = Door.new("Room",false,false)
    expect(unlocked_and_open.closed?.must_equal("This door is open"))

  end

  it "Checks whether or not a door is locked" do
    skip
    locked_and_closed = Door.new("Room",true,true)
    expect(locked_and_closed.locked?.must_equal("This door is locked"))

    unlocked_and_closed = Door.new("Room",false,true)
    expect(unlocked_and_closed.locked?.must_equal("This door is unlocked"))

    locked_and_open = Door.new("Room",true,false)
    expect(locked_and_open.locked?.must_equal("This door is locked"))

    unlocked_and_open = Door.new("Room",false,false)
    expect(unlocked_and_open.locked?.must_equal("This door is unlocked"))

  end

  it "Shows the inscription" do
    skip
    unlocked_and_open = Door.new("An Inscription",false,false)
    expect(unlocked_and_open.show_inscription.must_equal("An Inscription"))

    locked_and_open = Door.new("",true,false)
    expect(locked_and_open.read_inscription.must_equal("There is no inscription on this door"))
  end

end
