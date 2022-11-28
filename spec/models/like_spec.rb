require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:article) {
    Article.create(title: "Article 1",
      slug: "Article 1".parameterize,
      excerpt: "Lorem ipsum",
      author: "John Snow",
      publication_date: DateTime.now,
      category: "Sports")
  }

  subject {
    described_class.new(date: DateTime.now, article: article)
  }

  it { should belong_to(:article).without_validating_presence }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a date" do 
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an article reference" do
    subject.article_id = nil
    expect(subject).to_not be_valid
  end

  it "is able to increase count with provided integer" do
    subject.increase_count(10)
    subject.count.should eq(10)
  end

end
