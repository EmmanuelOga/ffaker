# encoding: utf-8

require 'ffaker/lorem'

module FFaker
  module HealthcareIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      fetch_sample(HEALTHCARE_WORDS)
    end

    def words(num = 3)
      fetch_sample(HEALTHCARE_WORDS, count: num)
    end

    def sentence(word_count = 4)
      s = words(word_count + rand(5) + 1)
      s[0].capitalize!
      s = s.join(' ')
      "#{s}."
    end

    alias_method :phrase, :sentence

    def sentences(sentence_count = 3)
      (1..sentence_count).map { sentence }
    end

    alias_method :phrases, :sentences

    def paragraph(sentence_count = 3)
      sentences(sentence_count + rand(3)).join(' ')
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end
  end
end
