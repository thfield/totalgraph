require 'test_helper'

class WeightsControllerTest < ActionController::TestCase
  def setup
    @weight = weights(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Weight.count' do
      post :create, weight: { total:100, pfat:20 }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Weight.count' do
      delete :destroy, id: @weight
    end
    assert_redirected_to login_url
  end
end
