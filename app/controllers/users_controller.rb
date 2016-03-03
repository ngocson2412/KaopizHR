class UsersController < ApplicationController
	include UsersHelper
  def new
  end
  
  def report
    @@token = auth(params[:code])
    if !User.exists?(token: @@token)
    user = get_user(@@token)
    add_user(user["user"],user["admin"],@@token)
    end
    @user_name = User.find_by(token: @@token).name
    @project = Project.first
  end
  def report2
  	@project = Project.find(params[:project][:id])
  	project_name = @project.project_name
  	text = "[Project_name:]\n#{project_name}\n[Done:]\n#{params[:project][:hours]} hours\n[Problem:]\n#{params[:project][:problem]}\n[Next_plan:]\n#{params[:project][:next_plan]}"
  	@project.real_time += params[:project][:hours].to_i
  	@res = post_report(text, @@token)
     if @res.is_a?(Net::HTTPSuccess)
     flash.now[:success] = "#Successfully reported!"
     end
    if @project.update_attributes(user_project_params)
     render 'thank'
    else
      render 'report'
    end
end

  private
    def user_project_params
      params.require(:project).permit(:real_time)
    end

    def message_params
      params.require(:project).permit(:project_name, :done, :hours, :problem, :next_plan)
    end

end
