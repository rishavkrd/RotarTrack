# frozen_string_literal: true

# Create default roles
roles = ['Admin', 'Officer', 'Member', 'Inactive']
existing_roles = Status.all.map { |r| r.Value }

roles.each do |role|
  unless existing_roles.include?(role)
    Status.create!(Value: role)
  end
end

# Create accounts
Account.create!([
  { UIN: 167421892, FirstName: 'Joe', LastName: 'Smith', PhoneNumber: 1234567890, Email: 'joe@smith.com', status_id: 2 , uuid: 'TEST_ACCOUNT_01' },
  { UIN: 718276728, FirstName: 'Rishav', LastName: 'Dokania', PhoneNumber: 8729106896, Email: 'rishavkrd11@tamu.edu', status_id: 1, uuid: 'TEST_ACCOUNT_02' },
  { UIN: 123458729, FirstName: 'Sam', LastName: 'McDonalds', PhoneNumber: 5784297498, Email: 'sam@tamu.edu', status_id: 2, uuid:'TEST_ACCOUNT_03' },
  { UIN: 162719977, FirstName: 'John', LastName: 'Goodman', PhoneNumber: 6767982934, Email: 'john@tamu.edu', status_id: 2, uuid:'TEST_ACCOUNT_04' },
])

# Create default meeting types
types = ['Meeting', 'Event', 'Social', 'Other', 'Inactive']
existing_types = Type.all.map { |r| r.Value }

types.each do |type|
  unless existing_types.include?(type)
    Type.create!(Value: type)
  end
end         

# Create default event
Event.create!([
  {
    Title: 'Meetup with team',
    Description: 'Meet the officers and members of AggieRotaract',
    Date: '2022-12-12',
    Time: '2000-01-01 21:45:00',
    Location: 'MSC',
    Points: 1,
    type_id: 1
  }
])
