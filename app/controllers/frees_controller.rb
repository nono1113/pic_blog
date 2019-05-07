class FreesController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @frees = Free.all.order("id DESC").page(params[:page]).per(4)
  end

  def new
    @free = Free.new
  end

  def create
    @free = Free.new(free_params)
    if @free.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @free = Free.find(params[:id])
  end

  def update
    @free = Free.find(params[:id])
    if @free.update(free_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @free = Free.find(params[:id])
    @free.destroy
    redirect_to root_path
  end

  private
    def free_params
      params[:free].permit(:text, :image, :title)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
