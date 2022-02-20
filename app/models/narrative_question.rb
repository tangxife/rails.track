class NarrativeQuestion < Question
  validates_length_of :answer_example0, maximum: 1000
  validates_length_of :answer_example1, maximum: 1000
end
