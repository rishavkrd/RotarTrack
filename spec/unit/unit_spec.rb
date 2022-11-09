# frozen_string_literal: true

require 'rails_helper'
begin
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
# fill_in 'Title', with: 'Party'
#     fill_in 'Description', with: 'Captain'
#     fill_in 'Date', with: '01/11/2022'
#     fill_in 'Time', with: '9'
#     fill_in 'Location', with: 'MSC2'
#     fill_in 'Points', with: '12'
#     fill_in 'type_id', with: '1'
  RSpec.describe Event, type: :model do

    subject do
      described_class.new(Title: 'Game Day', Description: "Match at Kyle Field", Date: "01/11/2022", Time: "9", Location: "Kyle Field Stadium", Points: "12", type_id: "1");
    end

    # it 'is valid with all valid attributes' do
      # expect(subject).to be_valid
    # end

    it 'is not valid without a Title' do
      subject.Title = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a Description' do
      subject.Description = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a Date' do
      subject.Date = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a Time' do
      subject.Time = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a Location' do
      subject.Location = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a Points' do
      subject.Points = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a type_id' do
      subject.type_id = nil
      expect(subject).not_to be_valid
    end
  end
  RSpec.describe Status, type: :model do

    subject do
      described_class.new(Value: '1');
    end

    # it 'is valid with all valid attributes' do
      # expect(subject).to be_valid
    # end

    it 'status is not valid without a Value' do
      subject.Value = nil
      expect(subject).not_to be_valid
    end
  end

  # t.bigint "account_id", null: false
  #   t.bigint "event_id", null: false
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.integer "Points"
  RSpec.describe Point, type: :model do

    subject do
      described_class.new(account_id: '1', event_id: "1", Points: "2");
    end

    # it 'is valid with all valid attributes' do
      # expect(subject).to be_valid
    # end

    it 'is not valid without a account_id' do
      subject.account_id = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a event_id' do
      subject.event_id = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a Points' do
      subject.Points = nil
      expect(subject).not_to be_valid
    end
    
  end
  RSpec.describe Signup, type: :model do

    subject do
      described_class.new(event_id: '1', account_id: "1", Pickup: false);
    end

    # it 'is valid with all valid attributes' do
      # expect(subject).to be_valid
    # end

    it 'is not valid without a event_id' do
      subject.event_id = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a account_id' do
      subject.account_id = nil
      expect(subject).not_to be_valid
    end
    # it 'is not valid without a Pickup' do
    #   subject.Points = nil
    #   expect(subject).not_to be_valid
    # end
    
  end
  
end
