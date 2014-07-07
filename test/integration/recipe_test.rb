require 'test_helper'

class RecipeFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  fixtures :recipes
	test "create recipes" do
		https!
		curry = recipes(:curry)
		get "/recipes/new"
		assert_response :success
		post_via_redirect "/recipes/new", title: recipes(:curry).title
		assert_equal '/recipes', path
		assert_equal 'Create Recipe', flash[:notice]
		https!(false)
		get "/recipes"
		assert_response :success
		assert assigns(:recipes)
	end
end


