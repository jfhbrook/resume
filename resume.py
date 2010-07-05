from jinja2 import Environment, FileSystemLoader

template=Environment(loader=FileSystemLoader('templates/'),
                block_start_string='<=',
                block_end_string='=>',
                variable_start_string='<<',
                variable_end_string='>>'
                ).get_template('resume.tex')
                
header={ 'author': 'Joshua Holbrook'
       , 'streetaddress': '1727 Bridgewater Dr.'
       , 'citystatezip': 'Fairbanks AK  99709'
       , 'phone': '(907) 841-9238'
       , 'email': 'josh.holbrook@gmail.com'
       , 'webpage': 'http://www.github.com/jesusabdullah'

       , 'objective': 'To be genuinely challenged in a meaningful position that requires the use of a wide variety of skills, from practical and aesthetic design to simulation to manufacturing.'

       , "skills": [ 'Proficient with Microsoft Office suite and GNU/Linux; and experience with COMSOL Multiphysics'
                   , 'Proficient with MATLAB and python/scipy; and experience with bash, C(++) and perl'
                   , 'Certified LabVIEW Associate Developer'
                  #, 'Comprehensive understanding of engineering principles'
                   ]

      , "schools": [ { 'location': 'University of Alaska Fairbanks'
                     , 'degree': 'Master of Science in Mechanical Engineering'
                     , 'dates': 'Sept. 2009 -- Dec. 2010 (expected)'
                     , 'minor': 'Mathematics'
                     , 'chrs': 15
                     , 'gpa': '3.68 current'
                     }
                   , { 'location': 'University of Alaska Fairbanks'
                     , 'degree': 'Bachelor of Science in Mechanical Engineering, Cum Laude'
                     , 'dates': 'Aug. 2005 -- May 2010'
                     #, 'chrs': 143
                     , 'gpa': '3.67'
                     }
                   , { 'location': 'Susitna Valley Jr/Sr High School'
                     , 'degree': 'High School Diploma'
                     , 'dates': 'May 2005'
                     , 'gpa': '3.73'
                     }
                   ]

      , "jobs": [ { 'employername': 'UAF Institute of Northern Engineering, Fairbanks AK'
                  , 'employeraddress': r'PO Box 755190 \\ 525 Duckering Bldg. \\ Fairbanks, AK  99775-5190'
                  , 'jobtitle': 'Research Assistant'
                  , 'dates': 'January 2010 -- Present'
                  , 'duties': [ 'Designing and running finite element models using COMSOL and MATLAB'
                              , 'Analyzing geographical information using perl, python, MATLAB and C++'
                              ]
                  }
                , { 'employername': 'UAF Mechanical Engineering Department, Fairbanks AK'
                  , 'employeraddress': r'337 Duckering Bldg.'
                  , 'jobtitle': 'Office Assistant'
                  , 'dates': 'January 2008 -- December 2009'
                  , 'duties': [ 'Tracking purchase information on UAF\'s Oracle database and compiling it into a human-readable form'
                              , 'Facilitating communication between students, faculty and system administration'
                              ]
                  }
                , { 'employername': 'UAF Mechanical Engineering Department, Fairbanks AK'
                  , 'employeraddress': r'337 Duckering Bldg.'
                  , 'jobtitle': 'Professor\' Assistant'
                  , 'dates': 'September 2008 -- December 2008'
                  , 'duties': [ 'Grading and correcting homework assignments for ES 331, "Mechanics of Materials"']
                  }
                , { 'employername': 'UAF Conference Services, Fairbanks AK'
                  , 'employeraddress': r'732 Yukon Dr. \\ PO Box 756860 Fairbanks, AK  99775-6860'
                  , 'jobtitle': 'Painter'
                  , 'dates': 'May 2008 -- August 2008'
                  , 'duties': [ 'Patching, painting and wet-sanding walls, ceilings, doors and trim']
                  }
                , { 'employername': 'Panco Construction, Talkeetna AK'
                  , 'employeraddress': r'PO Box 210 \\ Talkeetna AK  99676'
                  , 'jobtitle': 'Construction Laborer'
                  , 'dates': r'May 2007 -- June 2007 full-time January 2008 -- Present on irregular basis'
                  , 'duties': [ 'Sanding, polishing and assisting in the fabrication of solid surface'
                              , 'Stocking, staging and assisting in the install of countertops other materials'
                              ]
                  }
                , { 'employername': 'UAF Water and Environmental Research Center, Fairbanks AK'
                  , 'employeraddress': r'P. O. Box 755860 \\ Fairbanks AK 99775-5860'
                  , 'jobtitle': 'Laboratory Assistant'
                  , 'dates': 'February 2007 -- May 2007'
                  , 'duties': [ 'Taking inventory of chemical stock'
                              , 'Tabulating, manipulating and organizing test data in Excel'
                              ]
                  }
                , { 'employername': 'Aramark-Harrison Lodging, Denali National Park AK'
                  , 'employeraddress': '??'
                  , 'jobtitle': 'Porter'
                  , 'dates': 'May 2006 -- August 2006'
                  , 'duties': [ 'Stocking; cleaning and maintaining public areas; and preparing rooms for guest arrival']
                  }
                ]
}

print template.render(header)
