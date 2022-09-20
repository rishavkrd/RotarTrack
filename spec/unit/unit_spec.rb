require 'rails_helper'
=begin
RSpec.describe Status, type: :model do
  subject do
    described_class.new(Value: 'Officer')
  end

  it 'is valid with all valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.Value = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Account, type: :model do

  subject do
    described_class.new(UIN: '123456789', FirstName: "Tom", LastName: "Hanks", PhoneNumber: "9123456780", Email: "tomhanks@who.com", status_id: "1");
  end
  
  # it 'is valid with all valid attributes' do
    # expect(subject).to be_valid
  # end

  it 'is not valid without a UIN' do
    subject.UIN = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a First Name' do
    subject.FirstName = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a Last Name' do
    subject.LastName = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a PhoneNumber' do
    subject.PhoneNumber = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a Email' do
    subject.Email = nil
    expect(subject).not_to be_valid
  end
  # it 'is not valid without a status id' do
  #   subject.status_id = nil
  #   expect(subject).not_to be_valid
  # end
end
=end