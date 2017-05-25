require 'test_helper'

# @deprecated
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  test "create db" do 
    puts "..............start test"
    User.create
    puts User.count
    puts "..............end test"

  end
end