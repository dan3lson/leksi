namespace :define do
  desc "Define 4th grade words from list"
  task :fourth_grade_words => :environment do
    puts "Starting to define 4th Grade Words:"
    puts
    rand_word_names = Word.fourth_grade_word_names.shuffle.take(75).sort
    num_errors = 0
    new_word_ids = []
    error_ids = []

    rand_word_names.each do |name|
      words_api_search = WordsApi.new(name).define

      if words_api_search.class == String
        puts words_api_search
      else
        words_api_search.each_with_index do |new_word, index|
          if new_word.save
            new_word_ids << new_word.id if index == 0
            puts "Success for word #{name}(#{new_word.id})"
          else
            num_errors += 1
            new_word_ids << Word.find_by(
              name: new_word.name,
              definition: new_word.definition
            ).id if index == 0
            puts "ERROR for word #{name}: #{new_word.errors.full_messages}."
          end
        end
      end
    end

    puts
    print new_word_ids
    puts
    puts
    print rand_word_names
    puts
    puts
    puts "TOTAL ERRORS: #{num_errors}"
  end
end
