class TeaSerializer
  def self.new(tea)
    { data:
      {
      id: tea.id,
      type: "tea",
      attributes: {
        name: tea.name,
        description: tea.description,
        temperature: tea.temperature,
        brew_time: tea.brew_time
        },
      }
    }
  end
end
