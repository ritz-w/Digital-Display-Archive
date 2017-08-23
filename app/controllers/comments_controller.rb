class CommentsController < ApplicationController

def create
    @project = Project.find_by_id(params[:project_id])
    @comment = @project.comments.new(comment_params)
    @user = current_user
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @project, notice: 'Review was created successfully.' }
        format.js {}
        format.json { render :show, status: :created, location: @project}
      else
        format.html { redirect_to @project, alert: 'Review was not saved successfully.' }
        format.js {}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
  @comment = Comment.find(params[:id])
  project = @comment.project
  @comment.destroy
  redirect_to project
end

end

private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end