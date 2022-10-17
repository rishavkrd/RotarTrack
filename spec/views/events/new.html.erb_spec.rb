# frozen_string_literal: true

require 'rails_helper'

# rubocop:todo Style/InlineComment
RSpec.describe('events/new', type: :view) do # rubocop:todo RSpec/EmptyExampleGroup, Style/InlineComment
  # rubocop:enable Style/InlineComment
  # before(:each) do
  #   assign(:event, Event.new(
  #     Title: "MyText",
  #     Description: "MyText",
  #     Location: "MyText",
  #     Points: 1,
  #     type: nil
  #   ))
  # end

  # it "renders new event form" do
  #   render

  #   assert_select "form[action=?][method=?]", events_path, "post" do

  #     assert_select "textarea[name=?]", "event[Title]"

  #     assert_select "textarea[name=?]", "event[Description]"

  #     assert_select "textarea[name=?]", "event[Location]"

  #     assert_select "input[name=?]", "event[Points]"

  #     assert_select "input[name=?]", "event[type_id]"
  #   end
  # end
end
