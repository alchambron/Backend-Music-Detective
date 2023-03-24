admin = User.create(
  nickname: "Les 3 mousquetaires",
  email: "admin@admin.fr",
  password: ENV['ADMIN_MDP'],
  is_admin: true
)

puts "Seed : Done"