# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('types/edit', type: :view) do
  before do
    @type = assign(:type, Type.create!(
                            Value: 'MyText'
                          )
    )
  end

  it 'renders the edit type form' do
    render

    # rubocop:todo Style/InlineComment
    assert_select 'form[action=?][method=?]', type_path(@type), 'post' do # rubocop:todo RSpec/InstanceVariable, Style/InlineComment
      # rubocop:enable Style/InlineComment
      assert_select 'textarea[name=?]', 'type[Value]'
    end
  end
end
