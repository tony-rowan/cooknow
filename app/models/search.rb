class Search
  CATEGORIES = %i(type cuisine ingredients)

  attr_reader :type, :cuisine, :ingredients

  def self.for(params)
    if params.key?(:search)
      new(**params.require(:search).permit(*CATEGORIES).slice(*CATEGORIES).to_h.symbolize_keys)
    else
      new
    end
  end

  def initialize(type: nil, cuisine: nil, ingredients: nil)
    @type = type
    @cuisine = cuisine
    @ingredients = ingredients
  end

  def next_unanswered_question
    category = (CATEGORIES - to_params.keys).first

    SearchQuestion.for(category:)
  end

  def to_params
    { type:, cuisine:, ingredients: }.compact
  end
end
