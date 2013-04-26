class NotesController < ApplicationController

  def show
    @note = Note.find(params[:id])
    @note_file = @note.File
  end

  def new 
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])
      if @note.save
        render :show, :notice => "Saved!"
      else
        render :new
      end
  end

  def update 
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id]).destroy
    redirect_to :subject
  end