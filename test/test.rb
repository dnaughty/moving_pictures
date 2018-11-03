require './main'
require 'minitest/autorun'
require 'rack/test'
ENV['RACK_ENV'] = 'test'

class MyTest <MiniTest::Unit::TestCase

	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def test_for_echo
		get  erb :home
		assert last_response.ok?
		assert_equal "slideshow_pictures/test.jpg", last_response.body
	end

	def test_for_pictures
		pictures = load_pictures
		assert pictures.length > 0, "There are no pictures"
	end
end