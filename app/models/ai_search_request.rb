class AiSearchRequest
  attr_reader :type, :cuisine, :ingredients

  def initialize(type:, cuisine:, ingredients:)
    @type = type
    @cuisine = cuisine
    @ingredients = ingredients
  end

  def request
    "Please write a recipe for a #{type} that includes #{ingredients.join(",")}, inspired by #{cuisine} cuisine."
  end
end
