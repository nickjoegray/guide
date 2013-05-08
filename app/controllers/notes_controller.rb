class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new 
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])
      if @note.update_attributes(:title => params[:title], :content => params[:notes][:content], :searchable => (params[:notes][:content]).gsub(%r{</?[^>]+?>}, ''))
        @note.save
        render :show, flash[:notice] => "Saved!"
      else
        render :new
      end
  end

  def update 
    @note = Note.find(params[:id])
    if @note.update_attributes(:title => params[:title], :content => params[:notes][:content], :searchable => (params[:notes][:content]).gsub(%r{</?[^>]+?>}, ''))
      debugger
      @note.save
      redirect_to note_path(@note.id)
    else
      render :show
    end
  end

  def destroy
    @note = Note.find(params[:id]).destroy
    redirect_to root_url
  end

  def search
    @search = Note.search(:include => [:subjects]) do 
      keywords(params[:q])
    end
  end

end
