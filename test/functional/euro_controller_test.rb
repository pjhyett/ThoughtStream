require File.dirname(__FILE__) + '/../test_helper'
require 'euro_controller'

# Re-raise errors caught by the controller.
class EuroController; def rescue_action(e) raise e end; end

class EuroControllerTest < Test::Unit::TestCase
  def setup
    @controller = EuroController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
