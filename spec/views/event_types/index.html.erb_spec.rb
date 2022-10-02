require 'rails_helper'

RSpec.describe "event_types/index", type: :view do
  before(:each) do
    assign(:event_types, [
      EventType.create!(
        Type: "MyText"
      ),
      EventType.create!(
        Type: "MyText"
      )
    ])
  end

  it "renders a list of event_types" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
