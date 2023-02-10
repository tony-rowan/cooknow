class SearchesController < ApplicationController
  def show
    search = session[:search] || {}

    render locals: {
      search: search,
      chat_gpt_request: "Please write a recipe for a #{search["type"]} that includes #{search["ingredient"]}, inspired by #{search["cuisine"]} cuisine."
    }
  end

  def new
    search = session[:search] || {}

    answered_question_types = search.keys
    left_to_ask = questions.reject { _1[:category].in?(answered_question_types) }
    question = left_to_ask.first

    if question.nil?
      redirect_to action: :show
    else
      render locals: { search:, question: }
    end
  end

  def create
    search = session[:search] || {}
    session[:search] = search.merge(params[:category] => params[:answer])
    redirect_to action: :new
  end

  def destroy
    session[:search] = {}
    redirect_to action: :new
  end

  private

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
        category: "ingredient",
        question: "What do you have in your fridge?",
        answers: ["Chicken", "Eggs", "Thyme", "Sugar"]
      }
    ]
  end
end
