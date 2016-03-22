require 'rails_helper'

feature "post a answer" do
  scenario "user successfuly adds a answer to the question detail page" do
    question = Question.create(title: "what is MVC", description: "how to we find that MVC relates to each other ")
    visit question_path(question.id)
     click_on("Answer")
    fill_in("Answer Here", with: "i have Answer test")
  
    click_on("Create Answer")

    expect(page).to have_content("i have Answer test")
  end
end
