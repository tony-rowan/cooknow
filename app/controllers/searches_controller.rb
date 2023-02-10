class SearchesController < ApplicationController
  before_action :set_search

  def show
    question = search.next_unanswered_question

    if question.nil?
      ai_search_request = AiSearchRequest.new(**search.to_params)
      render locals: { ai_search_request: }
    else
      redirect_to action: :new
    end
  end

  def new
    question = search.next_unanswered_question

    if question.nil?
      redirect_to action: :show
    else
      render locals: { question: }
    end
  end

  def create
    search.add_answer(category: params[:category], answer: params[:answer])
    session[:search] = search.to_params
    redirect_to action: :new
  end

  def destroy
    session[:search] = {}
    redirect_to action: :new
  end

  private

  attr_reader :search
  helper_method :search

  def set_search
    @search = Search.new(**(session[:search] || {}).transform_keys(&:to_sym))
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
