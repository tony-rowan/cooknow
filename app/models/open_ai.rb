module OpenAi
  def self.enabled?
    ENV["OPEN_AI_ENABLED"] == "true"
  end
end
