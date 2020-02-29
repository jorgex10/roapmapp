after :projects do
  abc_project = Project.find_by(name: 'Project ABC')
  def_project = Project.find_by(name: 'Project DEF')
  ghi_project = Project.find_by(name: 'Project GHI')
  jkl_project = Project.find_by(name: 'Project JKL')
  mno_project = Project.find_by(name: 'Project MNO')

  groups = [
    {
      name: 'Grupo 1',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: abc_project
    },
    {
      name: 'Grupo 2',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: abc_project
    },
    {
      name: 'Grupo 3',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: abc_project
    },
    {
      name: 'Grupo 4',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: def_project
    },
    {
      name: 'Grupo 5',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: def_project
    },
    {
      name: 'Grupo 6',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: def_project
    },
    {
      name: 'Grupo 7',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: ghi_project
    },
    {
      name: 'Grupo 8',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: jkl_project
    },
    {
      name: 'Grupo 9',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: jkl_project
    },
    {
      name: 'Grupo 10',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      init_date: 1.month.ago,
      end_date: 1.week.after,
      project: mno_project
    }
  ]

  Group.create(groups)
end