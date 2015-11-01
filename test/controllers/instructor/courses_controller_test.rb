require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
    
    test "create new course" do
        user = FactoryGirl.create(:user)
        sign_in user

        assert_difference 'Course.count' do
            course_attributes = FactoryGirl.attributes_for(:course)
            post :create, course: course_attributes 
        end

        course = Course.last
        assert_redirected_to instructor_course_path(course.id)

        assert_equal 1, user.courses.count 
    end

    test "course show page found" do
        user = FactoryGirl.create(:user)
        sign_in user

        course = FactoryGirl.create(:course, :user => user)

        get :show, :id => course.id
        assert_response :success
    end

end
