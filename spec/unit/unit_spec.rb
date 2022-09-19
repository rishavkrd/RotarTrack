require 'rails_helper'

RSpec.describe Status, type: :model do
  subject do
    described_class.new(Value: 'Officer')
  end

  it 'is valid with all valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end
end
