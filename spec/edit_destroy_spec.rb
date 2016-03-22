require 'rails_helper'

feature "edit and destroy a question" do
  scenario "user successfuly edit a question to the question list" do
    question = Question.create(title: "what is MVC", description: "how to we find that MVC relates to each other ")
    visit edit_question_path(question.id)
    
    fill_in("Title", with: "i have question")
    fill_in("Description", with: "i dont have a question")

    click_on("Update Question")

    expect(page).to have_content("i have question")
  end
end
