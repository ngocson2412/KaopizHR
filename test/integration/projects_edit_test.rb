require 'test_helper'

class ProjectsEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @project = projects(:project)
  end

  test "unsuccessful edit" do
    get edit_project_path(@project)
    assert_template 'projects/edit'
    patch project_path(@project), project: { project_name:  "",
                                    plan_time: 120,
                                    real_time: 120}
    assert_template 'projects/edit'
  end
end
