class DemoController < ApplicationController
  layout false

  def index
  end

  def hello
    # render('index') # change what view is rendered
    # redirect_to(:controller => 'demo', :action => 'index' )


    @array = [1,2,3,4,5]
    @id = params['id']
    @page = params['page']


  end

  def about
    render('about_us')
  end

  def contact
    @country = params['country']
    render('contact_us')
  end
end
