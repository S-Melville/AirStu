require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @room = Room.new(home_type: "Private", accommodate: '1', bed_room: '1', bath_room:'1', listing_name:"Beautiful flat", address:'1B Froghall, UK', active: 'true')
  end


  test "hometype should be there" do
  	@room.home_type = "  "
  	assert_not @room.valid?
  end

  test "accommodate should be there" do
  	@room.accommodate = "  "
  	assert_not @room.valid?
  end 

  test "bed room should be there" do
  	@room.bed_room = "  "
  	assert_not @room.valid?
  end

  test "bath room should be there" do
  	@room.bath_room = "  "
  	assert_not @room.valid?
  end

  test "listing name should be there" do
  	@room.listing_name = "  "
  	assert_not @room.valid?
  end

  test "address should be there" do
  	@room.address = "  "
  	assert_not @room.valid?
  end

  test "active should be there" do
  	@room.active = "  "
  	assert_not @room.valid?
  end

end
