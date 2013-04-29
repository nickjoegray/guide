class SubjectsController < ApplicationController

  def index
    @search = Note.search do
      fulltext params[:q]
    end
    
    @results = @search.results
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

  def search 
    page_size = 10

    @search = Note.search do 
      keywords params[:q]

      with :include_search, true
      paginate page: params[:page], per_page: page_size
    end

    @results = @search.results

    @total = @search.total
    @paging = @total > page_size
    @start = (@search.current_page - 1)* page_size + 1
    @end = [@start + page_size - 1, @total].min 

    render (if @results.empty? then :no_results else :results end)
  end

end
