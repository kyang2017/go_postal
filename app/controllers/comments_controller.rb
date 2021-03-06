class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.note = params[:note]
    @comment.friend_id = params[:friend_id]

    if @comment.save
      redirect_to "/friends", :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.note = params[:note]
    @comment.friend_id = params[:friend_id]

    if @comment.save
      redirect_to "/friends", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/friends", :notice => "Comment deleted."
  end
end
