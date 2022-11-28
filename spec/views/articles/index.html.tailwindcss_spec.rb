require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        index: "Index",
        show: "Show"
      ),
      Article.create!(
        index: "Index",
        show: "Show"
      )
    ])
  end

  it "renders a list of articles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Index".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Show".to_s), count: 2
  end
end
