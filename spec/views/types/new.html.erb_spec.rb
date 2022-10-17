# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('types/new', type: :view) do
  before do
    assign(:type, Type.new(
                    Value: 'MyText'
                  )
    )
  end

  it 'renders new type form' do
    render

    assert_select 'form[action=?][method=?]', types_path, 'post' do
      assert_select 'textarea[name=?]', 'type[Value]'
    end
  end
end
