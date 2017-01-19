Profile.destroy_all
User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

date = Date.today + 1.year

# User.create! [
#   { username: "Fiorina", password_digest: "1234"},
#   { username: "Trump", password_digest: "4321"},
#   { username: "Carson", password_digest: "5555"},
#   { username: "Clinton", password_digest: "7777"}
# ]

Profile.create! [
  { first_name: "Carly", last_name: "Fiorina", gender: "female", birth_year: 1954 },
  { first_name: "Donald", last_name: "Trump", gender: "male", birth_year: 1946 },
  { first_name: "Ben", last_name: "Carson", gender: "male", birth_year: 1951 },
  { first_name: "Hillary", last_name: "Clinton", gender: "female", birth_year: 1947 }
]

users = Profile.all

users.each do |user|
  user.create_user( username: user.last_name, password_digest: user.birth_year)
  user.user.todo_lists.create!(list_name: user.first_name, list_due_date: date)
end

# TodoList.create! [
#   { list_name: "Fiorina_list", list_due_date: date },
#   { list_name: "Trump_list", list_due_date: date },
#   { list_name: "Carson_list", list_due_date: date },
#   { list_name: "Clinton_list", list_due_date: date }
# ]

todoitems = TodoList.all

todoitems.each do |item|
  5.times do
    item.todo_items.create!(due_date: date, title: "Task", description: "something")
  end
end
