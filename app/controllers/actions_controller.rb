class ActionsController < ApplicationController

  def index
    redirect_to categories_url
  end

  def new
    @action = Action.new
  end

  def create
    @action = Action.new(action_params)
    @action.author = current_user

    respond_to do |format|
      if @action.save
        format.html { redirect_to @action.categories.first, notice: 'The transaction was successfully added' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def action_params
    params.fetch(:action, {}).permit(:name, :amount, :category_ids: [])
  end

end