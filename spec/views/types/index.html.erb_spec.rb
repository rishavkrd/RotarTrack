# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('types/index', type: :view) do
  before do
    assign(:types, [
      Type.create!(
        Value: 'MyText'
      ),
      Type.create!(
        Value: 'MyText'
      )
    ]
    )
  end

  it 'renders a list of types' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
