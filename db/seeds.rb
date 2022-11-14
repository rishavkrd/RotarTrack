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
  { UIN: 923_874_129, FirstName: 'Joe', LastName: 'Smith', PhoneNumber: 918_817_8917, Email: 'joe@smith.com', status_id: 2 , uuid: 'TEST_ACCOUNT_01' },
  { UIN: 344_523_451, FirstName: 'Rishav', LastName: 'Dokania', PhoneNumber: 129_883_7182, Email: 'rishavkrd11@tamu.edu', status_id: 1, uuid: 'TEST_ACCOUNT_02' },
  { UIN: 679_818_273, FirstName: 'John', LastName: 'Goodman', PhoneNumber: 161_928_3871, Email: 'john@tamu.edu', status_id: 2, uuid:'TEST_ACCOUNT_04' },
  { UIN: 927_003_214, FirstName: 'Ryan', LastName: 'Crowell', PhoneNumber: 121_421_1524, Email: 'rdcrowell13@tamu.edu', status_id: 2, uuid:'TEST_ACCOUNT_07'}
]
               )

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
