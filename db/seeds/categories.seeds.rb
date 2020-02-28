after :projects do
  abc_project = Project.find_by(name: 'Project ABC')
  def_project = Project.find_by(name: 'Project DEF')
  ghi_project = Project.find_by(name: 'Project GHI')
  jkl_project = Project.find_by(name: 'Project JKL')
  mno_project = Project.find_by(name: 'Project MNO')

  categories = [
    {
      name: 'Categoría 1',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: abc_project
    },
    {
      name: 'Categoría 2',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: abc_project
    },
    {
      name: 'Categoría 3',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: abc_project
    },
    {
      name: 'Categoría 4',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: def_project
    },
    {
      name: 'Categoría 5',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: def_project
    },
    {
      name: 'Categoría 6',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: def_project
    },
    {
      name: 'Categoría 7',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: ghi_project
    },
    {
      name: 'Categoría 8',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: jkl_project
    },
    {
      name: 'Categoría 9',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: jkl_project
    },
    {
      name: 'Categoría 10',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      project: mno_project
    }
  ]

  Category.create(categories)
end