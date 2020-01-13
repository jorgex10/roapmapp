after :companies do
  peru_company = Company.find_by(url: 'company.peru.com')
  colombia_company = Company.find_by(url: 'company.colombia.com')

  users = [
    {
      first_name: 'Tony',
      last_name: 'Stark',
      email: 'tony.stark@demo.com',
      password: 'roadmapp',
      company: peru_company
    },
    {
      first_name: 'Steve',
      last_name: 'Rogers',
      email: 'steve.rogers@demo.com',
      password: 'roadmapp',
      company: peru_company
    },
    {
      first_name: 'Bruce',
      last_name: 'Banner',
      email: 'bruce.banner@demo.com',
      password: 'roadmapp',
      company: colombia_company
    },
  ]

  User.create(users)
end
