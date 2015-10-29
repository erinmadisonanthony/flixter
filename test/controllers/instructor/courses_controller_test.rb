require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
    
    attr_reader :course
    test "create new course" do
        user = FactoryGirl.create(:user)
        sign_in user

        assert_difference 'Course.count' do
            @course = FactoryGirl.create(:course)
            post :new, :id => course.id
        end

        assert_redirected_to instructor_course_path(course.id)

        assert_equal 1, user.courses.count 
    end

end
