require 'minitest/autorun'
require_relative '../lib/discourse_cli.rb'

class DiscourseCLITest < Minitest::Test
  def test_init
    # Test that it inits without throwing
    app = DiscourseCLI::App.new()
    assert app.instance_of?(DiscourseCLI::App) == true
  end
end

