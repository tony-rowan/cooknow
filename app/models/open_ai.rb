module OpenAi
  def self.enabled?
    return false if Rails.env.test?

    ENV["OPEN_AI_ENABLED"] == "true"
  end
end
