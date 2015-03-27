require 'rails_helper'

feature 'view answers on questions show page' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question) }

    before :each do
      sign_in_as(user)
    end

    scenario 'we can see all answers associated with a question' do
      FactoryGirl.create(:answer, body: 'this is a super awesome answer', question: question)

      hidden_answer = FactoryGirl.create(:answer)

      visit question_path(question)

      expect(page).to have_content('this is a super awesome answer')
      expect(page).to_not have_content(hidden_answer.body)
    end

    scenario 'I see answers in order from most recent to last' do
      first_answer = FactoryGirl.create(:answer, question: question)
      second_answer = FactoryGirl.create(:answer, question: question, created_at: 2.days.ago)

      visit question_path(question)

      expect(page).to have_selector("li##{first_answer.id}", text: first_answer.body)
      expect(page).to have_selector("li##{second_answer.id}", text: second_answer.body)
    end
  end

  context 'as a visitor' do

  end
end
