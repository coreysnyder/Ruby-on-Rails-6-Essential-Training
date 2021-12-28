class SubjectsController < ApplicationController
  def index
    @subjects = Subject.order('position ASC')
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:visible => true)
  end
  def create
    # Instantiate a new object using form params
    @subject = Subject.new(subject_params)

    if @subject.save
      # if save succeeds, redirect to the index action
      redirect_to(subjects_path)
    else
      # if save fails, redisplay the form so the user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end
  def update
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      # if save succeeds, redirect to the index action
      redirect_to(subject_path(@subject))
    else
      # if save fails, redisplay the form so the user can fix problems
      render('edit')
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end
  def destroy
    @subject = Subject.find(params[:id])

    if @subject.destroy
      # if destroyed succeeds, redirect to the index action
      redirect_to(subjects_path)
    else
      # if destroy fails, redisplay the form so the user can fix problems
      render('delete')
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :visible, :position)
  end
end
