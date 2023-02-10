class SearchesController < ApplicationController
  def show
    ai_search_request = AiSearchRequest.new(**search)

    render locals: { search:, ai_search_request: }
  end

  def new
    answered_question_types = search.keys
    left_to_ask = questions.reject { _1[:category].to_sym.in?(answered_question_types) }
    question = left_to_ask.first

    if question.nil?
      redirect_to action: :show
    else
      render locals: { search:, question: }
    end
  end

  def create
    session[:search] = search.merge(answer)
    redirect_to action: :new
  end

  def destroy
    session[:search] = {}
    redirect_to action: :new
  end

  private

  def search
    (session[:search] || {}).transform_keys(&:to_sym)
  end

  def answer
    if params[:category] == "ingredients"
      { params[:category] => [params[:answer]] }
    else
      { params[:category] => params[:answer] }
    end
  end

  def questions
    [
      {
        category: "type",
        question: "What do you want to make?",
        answers: ["Main Meal", "Light Snack", "Dessert"]
      },
      {
        category: "cuisine",
        question: "What cuisine would you like to try?",
        answers: ["Indian", "Chinese", "Italian", "Spanish"]
      },
      {
        category: "ingredients",
        question: "What do you have in your fridge?",
        answers: ["Chicken", "Eggs", "Thyme", "Sugar"]
      }
    ]
  end
end
