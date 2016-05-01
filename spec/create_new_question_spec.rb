require 'rails_helper'

feature "post a question" do
  scenario "user successfuly adds a question to the question list" do

    visit new_question_path

    fill_in("Title", with: "i have question")
    fill_in("Description", with: "i dont have a question")

    click_on("Create Question")

    expect(page).to have_content("i have question")

  end
  scenario "user successfuly adds a question to the question list" do

    visit new_question_path

    fill_in("Title", with: " ")
    fill_in("Description", with: " ")

    click_on("Create Question")

    expect(page).to have_content("errors prohibited this question from being saved")
  end
end
