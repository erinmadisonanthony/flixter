require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "enrolled_in?" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    enrollment = FactoryGirl.create(:enrollment, :user => user, :course => course)

    assert_equal 1, user.enrollments.count

    enrolled_courses = user.enrollments.collect(&:course)

    assert_equal 1, enrolled_courses.count
  end

end
