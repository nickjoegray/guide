class SubjectsController < ApplicationController

  def index
    @subject = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new 
    @subject = Subject.new
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(params[:Subject])
      if @subject.save
        render :index, :notice => "Saved!"
      else
        render :new
      end
  end

  def update 
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id]).destroy
    redirect_to :subject
  end



end
