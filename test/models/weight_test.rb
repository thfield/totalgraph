require 'test_helper'

class WeightTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @weight = @user.weights.build(total:100, pfat:10, fat:10, lean:90)
  end

  test "weight should be valid" do
    assert @weight.valid?
  end

  test "user id should be present" do
    @weight.user_id = nil
    assert_not @weight.valid?
  end

  test "order should be most recent last" do
    assert_equal Weight.last, weights(:most_recent)
  end

  test "total should be present " do
    @weight.total = " "
    assert_not @weight.valid?
  end

  test "pfat should be present " do
    @weight.pfat = " "
    assert_not @weight.valid?
  end
end
