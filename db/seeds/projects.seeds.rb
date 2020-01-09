after :companies do
  peru_company = Company.find_by(url: 'company.peru.com')
  colombia_company = Company.find_by(url: 'company.colombia.com')

  projects = [
    {
      name: 'Project ABC',
      description: 'company.default.com',
      init_date: 3.months.ago,
      end_date: 5.months.after,
      company: peru_company
    },
    {
      name: 'Project DEF',
      description: 'company.additional.com',
      init_date: 1.year.ago,
      end_date: 4.months.ago,
      company: peru_company
    },
    {
      name: 'Project GHI',
      description: 'company.additional.com',
      init_date: 6.months.after,
      end_date: 1.year.after,
      company: peru_company
    },
    {
      name: 'Project JKL',
      description: 'company.additional.com',
      init_date: 6.months.ago,
      end_date: 3.months.ago,
      company: colombia_company
    },
    {
      name: 'Project MNO',
      description: 'company.additional.com',
      init_date: 2.months.ago,
      end_date: 4.months.after,
      company: colombia_company
    }
  ]

  Project.create(projects)
end
