require 'rails_helper'

feature 'creating and updating questions' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'I can successfully create a question' do
      visit new_question_path

      fill_in 'Title', with: 'How does rails work?'
      fill_in 'Body', with: 'No one knows sldkfjslkdfj sdlfkj sdlkfj sdflkj sdflkj !!'
      click_on 'Create Question'

      expect(page).to have_content('Successfully created question')
      expect(page).to have_link('How does rails work?')
    end
  end

  context 'as a visitor' do
    scenario 'I cannot create a question' do
      visit new_question_path

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end
end
