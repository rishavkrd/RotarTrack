# frozen_string_literal: true

Status.create!([
  { Value: 'officer' },
  { Value: 'Member' },
  { Value: 'Inactive' }
]
              )
Account.create!([
  { UIN: 923_874_129, FirstName: 'Joe', LastName: 'Smith', PhoneNumber: 19_283_712, Email: 'joe@smith.com', status_id: 2 },
  { UIN: 344_523_451, FirstName: 'Rishav', LastName: 'Dokania', PhoneNumber: 129_883_712, Email: 'rishavkrd11@tamu.edu', status_id: 1 },
  { UIN: 812_658_276, FirstName: 'Sam', LastName: 'McDonalds', PhoneNumber: 12_398_127, Email: 'sam@tamu.edu', status_id: 2 },
  { UIN: 9_818_273, FirstName: 'John', LastName: 'Goodman', PhoneNumber: 1_928_371, Email: 'john@tamu.edu', status_id: 2 },
  { UIN: 1_231_412, FirstName: 'Henry', LastName: 'Ford', PhoneNumber: 198_263_129, Email: 'henry@ford.com', status_id: 2 },
  { UIN: 431_414_124, FirstName: 'Tom', LastName: 'Hanks', PhoneNumber: 121_421_124, Email: 'tom@tu.edu', status_id: 2 },
  { UIN: 927_003_214, FirstName: 'Ryan', LastName: 'Crowell', PhoneNumber: 121_421_124, Email: 'rdcrowell13@tamu.edu', status_id: 2 }
]
               )
Type.create!([
  { Value: 'Meeting' },
  { Value: 'Event' },
  { Value: 'Social' },
  { Value: 'Other' },
  { Value: 'Inactive' }
]
            )
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
