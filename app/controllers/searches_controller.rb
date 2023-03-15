class SearchesController < ApplicationController
  def show
    question = search.next_unanswered_question

    if question.nil?
      recipe = Recipe.for(search)
      render locals: {recipe:, search:}
    else
      redirect_to action: :new, params: {search: search.to_params}
    end
  end

  def new
    question = search.next_unanswered_question

    if question.nil?
      redirect_to action: :show, params: {search: search.to_params}
    else
      render locals: {search:, question:}
    end
  end

  def create
    redirect_to action: :new, params: {search: search.to_params}
  end

  def destroy
    redirect_to action: :new
  end

  private

  def search
    @_search ||= Search.new(search_params)
  end

  def search_params
    if params.key?(:search)
      params.require(:search).permit([:type, :cuisine, {ingredients: []}])
    else
      {}
    end
  end
end
