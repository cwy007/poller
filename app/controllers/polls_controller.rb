class PollsController < ApplicationController
  before_action :set_poll, only: [:edit, :update, :destroy]

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def edit
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'Poll was created!'
      redirect_to polls_path
    else
      render 'new'
    end
  end

  def update
    if @poll.update poll_params
      flash[:success] = 'Poll was updated!'
      redirect_to polls_path
    else
      render 'edit'
    end
  end

  def destroy
    if @poll.destroy
      flash[:success] = 'Poll was destroyed!'
    else
      flash[:warning] = 'Error destroying poll...'
    end
    redirect_to polls_path
  end

  private

    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
    end
end
