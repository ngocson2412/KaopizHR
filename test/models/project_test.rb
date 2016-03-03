require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(project_name: "Example project", plan_time: 100,real_time: 90)
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "name should be present" do
    @project.project_name = "     "
    assert_not @project.valid?
  end

  test "plan time should be present" do
    @project.plan_time = "     "
    assert_not @project.valid?
  end


end
