require 'rails_helper'

feature "two users add the same word", %{

  As a user,
  I want to add a word to myLeksi
  that another user already added.
} do

  # Acceptance Criteria
  #
  # [x] I can see an "add" button for the
  #     word I want
  # [x] myLeksi shows my newly added word
  # [x] I see a message of success

  describe "\n two users add same word -->" do
    let!(:user_word) { FactoryGirl.create(:user_word) }
    let!(:word) { user_word.word }
    let(:user2) { FactoryGirl.create(:user) }

    pending "scenario: add word" do
      log_in_as(user2)

      visit search_path

      fill_in "Search", with: word.name

      click_on "look up"

      click_on "Learn"

      expect(page).not_to have_content("Yikes!")
      expect(page).to have_content(word.name)
      expect(page).to have_content(word.phonetic_spelling)
      expect(page).to have_content(word.part_of_speech)
      expect(page).to have_content(word.definition)
      expect(page).to have_content(word.example_sentence)
      expect(Word.count).to eq(4)
      expect(UserWord.count).to eq(2)
      expect(UserTag.count).to eq(0)
      expect(WordTag.count).to eq(0)
      expect(UserWordTag.count).to eq(0)
    end
  end
end
