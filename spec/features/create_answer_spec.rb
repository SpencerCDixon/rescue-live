require 'rails_helper'

feature 'create an answer' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'create on the question show page' do
      question = FactoryGirl.create(:question)
      visit question_path(question)

      fill_in 'Body', with: 'this is the answer to your question'
      click_on 'Create Answer'

      expect(page).to have_content('Successfully created answer')
    end
  end
end
