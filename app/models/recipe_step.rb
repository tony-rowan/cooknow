class RecipeStep
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def image
    OpenAi::StepImageSuggestion.new(self)
  end
end
