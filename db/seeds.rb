Status.create!([
  {Value: "officer"},
  {Value: "Member"},
  {Value: "Inactive"}
])
Account.create!([
  {UIN: 923874129, FirstName: "Joe", LastName: "Smith", PhoneNumber: 19283712, Email: "joe@smith.com", status_id: 2},
  {UIN: 344523451, FirstName: "Rishav", LastName: "Dokania", PhoneNumber: 129883712, Email: "rishavkrd11@tamu.edu", status_id: 1},
  {UIN: 812658276, FirstName: "Sam", LastName: "McDonalds", PhoneNumber: 12398127, Email: "sam@tamu.edu", status_id: 2},
  {UIN: 9818273, FirstName: "John", LastName: "Goodman", PhoneNumber: 1928371, Email: "john@tamu.edu", status_id: 2},
  {UIN: 1231412, FirstName: "Henry", LastName: "Ford", PhoneNumber: 198263129, Email: "henry@ford.com", status_id: 2},
  {UIN: 431414124, FirstName: "Tom", LastName: "Hanks", PhoneNumber: 121421124, Email: "tom@tu.edu", status_id: 2}
])
Type.create!([
  {Value: "Meeting"},
  {Value: "Event"},
  {Value: "Social"},
  {Value: "Other"},
  {Value: "Inactive"}
])
Event.create!([
  {Title: "Meetup with team", Description: "Meet the officers and members of AggieRotaract", Date: "2022-12-12", Time: "2000-01-01 21:45:00", Location: "MSC", Points: 1, type_id: 1}
])
