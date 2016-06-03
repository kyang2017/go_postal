class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new
    @status.friend_id = params[:friend_id]
    @status.sentskip = params[:sentskip]

    if @status.save
      redirect_to "/statuses", :notice => "Status created successfully."
    else
      render 'new'
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])

    @status.friend_id = params[:friend_id]
    @status.sentskip = params[:sentskip]

    if @status.save
      redirect_to "/statuses", :notice => "Status updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @status = Status.find(params[:id])

    @status.destroy

    redirect_to "/statuses", :notice => "Status deleted."
  end

  def deliver
    @status = Status.new
    @status.friend_id = params[:friend_id]
    @status.sentskip = "Sent"

    if @status.save
      redirect_to "/friends", :notice => "Status created successfully."
    else
      render 'new'
    end
  end

  def skip
    @status = Status.new
    @status.friend_id = params[:friend_id]
    @status.sentskip = "Skipped"

    if @status.save
      redirect_to "/friends", :notice => "You have successfully skipped."
    else
      render 'new'
    end
  end


end
