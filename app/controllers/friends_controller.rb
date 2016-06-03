class FriendsController < ApplicationController
  def index
    @today = Date.today

    @coming_up = Friend.where(:month => @today.month).where("day >= ?", @today.day).order("day ASC")
    @just_past = Friend.where(:month => @today.month).where("day < ?", @today.day).order("day ASC")
    @the_rest_year = Friend.where.not(:month => @today.month).where("month > ?", @today.month).order("month ASC").order("day ASC")
    @the_past_year = Friend.where.not(:month => @today.month).where("month < ?", @today.month).order("month ASC").order("day ASC")

  end

  def show
    @friend = Friend.find(params[:id])

  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
    @friend.address = params[:address]
    @friend.year = params[:year]
    @friend.day = params[:day]
    @friend.name = params[:name]
    @friend.month = params[:month]

    if @friend.save
      redirect_to "/friends", :notice => "Friend created successfully."
    else
      render 'new'
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])

    @friend.address = params[:address]
    @friend.year = params[:year]
    @friend.day = params[:day]
    @friend.name = params[:name]
    @friend.month = params[:month]

    if @friend.save
      redirect_to "/friends", :notice => "Friend updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy

    redirect_to "/friends", :notice => "Friend deleted."
  end
end
