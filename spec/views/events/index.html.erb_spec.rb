# frozen_string_literal: true

require 'rails_helper'

# rubocop:todo Style/InlineComment
RSpec.describe('events/index', type: :view) do # rubocop:todo RSpec/EmptyExampleGroup, Style/InlineComment
  # rubocop:enable Style/InlineComment
  # before(:each) do
  #   assign(:events, [
  #     Event.create!(
  #       Title: "MyText",
  #       Description: "MyText",
  #       Location: "MyText",
  #       Points: 2,
  #       type: nil
  #     ),
  #     Event.create!(
  #       Title: "MyText",
  #       Description: "MyText",
  #       Location: "MyText",
  #       Points: 2,
  #       type: nil
  #     )
  #   ])
  # end

  # it "renders a list of events" do
  #   render
  #   assert_select "tr>td", text: "MyText".to_s, count: 2
  #   assert_select "tr>td", text: "MyText".to_s, count: 2
  #   assert_select "tr>td", text: "MyText".to_s, count: 2
  #   assert_select "tr>td", text: 2.to_s, count: 2
  #   assert_select "tr>td", text: nil.to_s, count: 2
  # end
end
