FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "foobar#{n}" }
    password "password"
    password_confirmation "password"
  end

  factory :word do
    sequence(:name) { |n| "foobar#{n}" }
    definition "lorem ipsum"
    part_of_speech "noun"
    phonetic_spelling "foo-bar"
    example_sentence "foobar is foo plus bar."
  end

  factory :user_word do
    user
    word
  end

  factory :source do
    sequence(:name) { |n| "foo_source#{n}" }
  end

  factory :user_source do
    user
    source
  end

  factory :word_source do
    word
    source
  end
end
