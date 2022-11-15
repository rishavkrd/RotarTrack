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
  { UIN: 123456789, FirstName: 'Joe', LastName: 'Smith', PhoneNumber: 1234567890, Email: 'joe@smith.com', status_id: 2 , uuid: 'TEST_ACCOUNT_01' },
  { UIN: 123456789, FirstName: 'Rishav', LastName: 'Dokania', PhoneNumber: 1234567890, Email: 'rishavkrd11@tamu.edu', status_id: 1, uuid: 'TEST_ACCOUNT_02' },
  { UIN: 123456789, FirstName: 'Sam', LastName: 'McDonalds', PhoneNumber: 1234567890, Email: 'sam@tamu.edu', status_id: 2, uuid:'TEST_ACCOUNT_03' },
  { UIN: 123456789, FirstName: 'John', LastName: 'Goodman', PhoneNumber: 1234567890, Email: 'john@tamu.edu', status_id: 2, uuid:'TEST_ACCOUNT_04' },
  { UIN: 123456789, FirstName: 'Henry', LastName: 'Ford', PhoneNumber: 1234567890, Email: 'henry@ford.com', status_id: 2, uuid:'TEST_ACCOUNT_05' },
  { UIN: 123456789, FirstName: 'Tom', LastName: 'Hanks', PhoneNumber: 1234567890, Email: 'tom@tu.edu', status_id: 2, uuid:'TEST_ACCOUNT_06' },
  { UIN: 123456789, FirstName: 'Ryan', LastName: 'Crowell', PhoneNumber: 1234567890, Email: 'rdcrowell13@tamu.edu', status_id: 2, uuid:'TEST_ACCOUNT_07'},
  { UIN: 526009857, FirstName: 'Ryan', LastName: 'O\'Malley', PhoneNumber: 8155575141, Email: 'rdomalley@tamu.edu', status_id: 1, uuid:'test'},
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
