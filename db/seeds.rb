# frozen_string_literal: true

# Create default roles
roles = %w[Admin Officer Member Inactive]
existing_roles = Status.all.map(&:Value)

roles.each do |role|
  Status.create!(Value: role) unless existing_roles.include?(role)
end

# Create accounts
Account.create!([
  {
    UIN: 167_421_892,
    FirstName: 'Joe',
    LastName: 'Smith',
    PhoneNumber: 1_234_567_890,
    Email: 'joe@smith.com',
    status_id: 2,
    uuid: 'TEST_ACCOUNT_01'
  },
  {
    UIN: 718_276_728,
    FirstName: 'Rishav',
    LastName: 'Dokania',
    PhoneNumber: 8_729_106_896,
    Email: 'rishavkrd11@tamu.edu',
    status_id: 1,
    uuid: 'TEST_ACCOUNT_02'
  },
  {
    UIN: 123_458_729,
    FirstName: 'Sam',
    LastName: 'McDonalds',
    PhoneNumber: 5_784_297_498,
    Email: 'sam@tamu.edu',
    status_id: 2,
    uuid: 'TEST_ACCOUNT_03'
  },
  {
    UIN: 162_719_977,
    FirstName: 'John',
    LastName: 'Goodman',
    PhoneNumber: 6_767_982_934,
    Email: 'john@tamu.edu',
    status_id: 2,
    uuid: 'TEST_ACCOUNT_04'
  }
]
               )

# Create default meeting types
types = %w[Meeting Event Social Other Inactive]
existing_types = Type.all.map(&:Value)

types.each do |type|
  Type.create!(Value: type) unless existing_types.include?(type)
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
]
             )
