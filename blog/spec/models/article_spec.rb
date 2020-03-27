require 'rails_helper'

RSpec.describe Article, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:article)).to be_valid
  end

  it "is valid with a title and text" do
    article_params = {
      title: "Title",
      text: "content"
    }

    article = Article.new(article_params)

    expect(article).to be_valid
  end

  it "is invalid without a title" do

    article = FactoryBot.build(:article, title: nil)

    article.valid?

    expect(article.errors[:title]).to include("can't be blank")
  end

  it "title must be at least 5 characters in length" do

    article = FactoryBot.build(:article, title: "Titl")
    article.valid?

    expect(article.errors[:title]).to include("is too short (minimum is 5 characters)")
  end

  it "does not require content" do

    article = FactoryBot.build(:article, text: nil)
    expect(article).to be_valid
  end

end
