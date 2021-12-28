class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    # Instantiate a new Page with a default visibility of true
    @page = Page.new(:visible => true)
  end
  def create
    @page = Page.new(page_params)

    if @page.save
      # If we successfully create the new page
      redirect_to(pages_path(@page))
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end
  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      # If we successfully edit the new page
      redirect_to(pages_path(@page))
    else
      render('new')
    end
  end

  def delete
  end
  def destroy
  end
end
