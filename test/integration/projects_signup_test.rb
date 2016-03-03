require 'test_helper'

class ProjectsSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get management_path
    assert_no_difference 'Project.count' do
      post projects_path, project: { project_name:  "",
                               plan_time: "10", }
    end
    assert_template 'projects/new'
  end
end
