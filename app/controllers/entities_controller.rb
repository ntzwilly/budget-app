class EntitiesController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to categories_url
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author = current_user

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity.categories.first, notice: 'The transaction was successfully added' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def entity_params
    params.fetch(:entity, {}).permit(:name, :amount, category_ids: [])
  end
end
