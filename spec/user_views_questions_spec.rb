require 'rails_helper'

feature "sees questions_path" do
  scenario "see all the questions_path" do

    question = Question.create(title: "what is MVC", description: "how to we find that MVC relates to each other ")
    visit questions_path
    expect(page).to have_content(question.title)
  end

  scenario " view a question's details" do
    question = Question.create(title: "what is MVC", description: "how to we find that MVC relates to each other ")
    visit questions_path
    click_on "Show"
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
