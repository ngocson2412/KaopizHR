class UsersController < ApplicationController
	include UsersHelper
  def new
  end
  
  def report
  if logged_in?
    @user = current_user
  else
    token = auth(params[:code])
    if !User.exists?(token: token)
    new_user = get_user(token)
    @user = add_user(new_user["user"],new_user["admin"],token)
    else
      @user = User.find_by(token: token)
    end
    log_in @user
  end
    @project = Project.first
  end
  def report2
  	@project = Project.find(params[:project][:id])
  	project_name = @project.project_name
  	text = "[Project_name:]\n#{project_name}\n[Done:]\n#{params[:project][:hours]} hours\n[Problem:]\n#{params[:project][:problem]}\n[Next_plan:]\n#{params[:project][:next_plan]}"
  	@project.real_time += params[:project][:hours].to_i
  	@res = post_report(text, current_user.token)
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
