require 'rails_helper'

feature 'view quesitons' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'I can see all questions' do
      question = FactoryGirl.create(:question)

      visit questions_path
      expect(page).to have_content(question.title)
    end

    scenario 'I can view a questions details' do
      question = FactoryGirl.create(:question, title: 'this is a question')

      visit questions_path
      click_on 'this is a question'

      expect(page).to have_content(question.body)
      expect(page).to have_content(question.title)
    end
  end
end

