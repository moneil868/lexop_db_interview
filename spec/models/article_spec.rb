require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    described_class.new(title: "Article 1",
                        excerpt: "Lorem ipsum",
                        author: "John Snow",
                        publication_date: DateTime.now,
                        category: "Sports")
  }

  # testing association
  it { should have_many(:likes) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do 
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a excerpt" do
    subject.excerpt = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a author" do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a publication_date" do
    subject.publication_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a category" do
    subject.category = nil
    expect(subject).to_not be_valid
  end
end
