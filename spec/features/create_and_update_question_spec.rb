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

    scenario 'I can update a question with new information' do
      question = FactoryGirl.create(:question,
                                    title: 'this is the old title',
                                    body: 'this is the old body')

      visit edit_question_path(question)

      fill_in 'Title', with: 'this is a new title!'
      click_on 'Update Question'

      expect(page).to have_content('Successfully edited question')
      expect(page).to have_link('this is a new title!')
    end

    scenario 'I can delete a question from edit page' do
      question = FactoryGirl.create(:question)

      visit edit_question_path(question)

      click_on 'Delete'
      expect(page).to have_content('Question deleted')
      expect(page).to_not have_link(question.title)
    end

    scenario 'I can delete a question from show page' do
      question = FactoryGirl.create(:question)

      visit question_path(question)

      click_on 'Delete'
      expect(page).to have_content('Question deleted')
      expect(page).to_not have_link(question.title)
    end

    scenario 'when deleting question all associated answers are deleted' do
      question = FactoryGirl.create(:question)
      FactoryGirl.create(:answer, question: question)

      visit edit_question_path(question)

      click_on 'Delete'
      expect(page).to have_content('Question deleted')
      expect(Answer.count).to be 0
    end

    scenario 'other users cannot edit my question' do
      new_user = FactoryGirl.create(:user)
      question = FactoryGirl.create(:question, user: new_user)

      visit edit_question_path(question)
      expect(page).to have_content('You are not authorized to do that')
    end
  end

  context 'as a visitor' do
    scenario 'I cannot create a question' do
      visit new_question_path

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end
end
