class SearchesController < ApplicationController
  def search
    @random_word = Word.random(1).first
    @seventh_grade_words = Word.pilot_for_seventh_grade

    respond_to do |format|
      format.html
      format.js
    end
  end

  def results
    @search = params[:search]

    begin
      if @search
        @input_words = @search.split(",").map(&:strip)
        @word_groups = @input_words.map { |w| Word.define(w) }
                             .flatten
                             .group_by { |w| w.name }

        respond_to do |format|
          format.js
        end
      end
    rescue WordsApi::NoWordError => e
      @error = e.message
    end
  end
end
