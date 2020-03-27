require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  scenario "user creates an article" do
    article = FactoryBot.create(:article)

    visit welcome_index_path
    click_link "My Blog"
    click_link "New article"
    fill_in "Title", with: article.title
    fill_in "Text", with: article.text
    click_button "Create Article"
  end
end
