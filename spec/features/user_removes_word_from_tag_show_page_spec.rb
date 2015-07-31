require 'rails_helper'

feature "user removes word from tag show page", %{

  As a user,
  I want to remove a word for
  one of my tag from that
  tag's show page.
} do

  # Acceptance Criteria
  #
  # [x] I can see a "remove" button
  # [x] That word is no longer on /tags/:id
  #     but still is a word I have in myLeksi
  # [x] I see a message of removal-success

  describe "\n user removes a tag -->" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:word_1) { FactoryGirl.create(:word) }
    let!(:tag) { FactoryGirl.create(:tag) }
    let!(:user_tag) { UserTag.create(user: user, tag: tag) }
    let!(:user_word_1) { UserWord.create(user: user, word: word_1) }
    let!(:word_tag_1) { WordTag.create(word: word_1, tag: tag) }
    let!(:user_word_tag_1) { UserWordTag.create(
      user: user, word_tag: word_tag_1)
    }

    scenario "scenario: remove one word from tag show page" do
      create_levels_and_games

      game_level = GameLevel.all[-8]
      game_level_2 = GameLevel.all[-7]
      game_level_3 = GameLevel.all[-6]
      game_level_4 = GameLevel.all[-5]
      game_level_5 = GameLevel.all[-4]
      game_level_6 = GameLevel.all[-3]
      game_level_7 = GameLevel.all[-2]
      game_level_8 = GameLevel.all[-1]

      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_2
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_3
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_4
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_5
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_6
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_7
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_8
      )

      log_in_as(user)

      visit myTags_path

      click_on tag.name

      within ".word-on-tag-show-page" do
        click_on "remove"
      end

      expect(page).to have_content("You removed \'")
      expect(page).not_to have_content("Yikes!")
      expect(Word.count).to eq(1)
      expect(UserWord.count).to eq(1)
      expect(Tag.count).to eq(1)
      expect(UserTag.count).to eq(1)
      expect(WordTag.count).to eq(0)
      expect(UserWordTag.count).to eq(0)
      expect(UserWordGameLevel.count).to eq(8)
    end

    scenario "scenario: remove one of two words from tag show page" do
      word_2 = FactoryGirl.create(:word, name: "chess_2")
      user_word_2 = UserWord.create(user: user, word: word_2)
      word_tag_2 = WordTag.create(word: word_2, tag: tag)
      user_word_tag_2 = UserWordTag.create(
        user: user, word_tag: word_tag_2
      )

      create_levels_and_games

      game_level = GameLevel.all[-8]
      game_level_2 = GameLevel.all[-7]
      game_level_3 = GameLevel.all[-6]
      game_level_4 = GameLevel.all[-5]
      game_level_5 = GameLevel.all[-4]
      game_level_6 = GameLevel.all[-3]
      game_level_7 = GameLevel.all[-2]
      game_level_8 = GameLevel.all[-1]

      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_2
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_3
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_4
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_5
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_6
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_7
      )
      UserWordGameLevel.create!(
        user_word: user_word_1,
        game_level: game_level_8
      )

      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level
      )
      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level_2
      )
      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level_3
      )
      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level_4
      )
      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level_5
      )
      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level_6
      )
      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level_7
      )
      UserWordGameLevel.create!(
        user_word: user_word_2,
        game_level: game_level_8
      )

      log_in_as(user)

      visit myTags_path

      click_on tag.name

      within all(".word-on-tag-show-page").last do
        click_on "remove"
      end

      expect(page).to have_content("You removed \'")
      expect(page).not_to have_content("Yikes!")
      expect(Word.count).to eq(2)
      expect(UserWord.count).to eq(2)
      expect(Tag.count).to eq(1)
      expect(UserTag.count).to eq(1)
      expect(WordTag.count).to eq(1)
      expect(UserWordTag.count).to eq(1)
      expect(UserWordGameLevel.count).to eq(16)
    end
  end
end
