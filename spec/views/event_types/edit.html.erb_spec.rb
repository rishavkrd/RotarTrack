require 'rails_helper'

RSpec.describe "event_types/edit", type: :view do
  before(:each) do
    @event_type = assign(:event_type, EventType.create!(
      Type: "MyText"
    ))
  end

  it "renders the edit event_type form" do
    render

    assert_select "form[action=?][method=?]", event_type_path(@event_type), "post" do

      assert_select "textarea[name=?]", "event_type[Type]"
    end
  end
end
