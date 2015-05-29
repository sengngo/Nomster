require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
   test "comment added" do
     user = FactoryGirl.create(:user)
     sign_in user

     place = FactoryGirl.create(:place)

     assert_difference 'Comment.count' do
     	post :create, :place_id => place.id, :comment =>{
     		:message => 'hello',
     		:rating => '2_stars'
     	}
     end

   end
   assert_redirected_to place_path(place)
   assert_equal 1, place.comment.count
end
