query =
  'description': 'Organism'
  'from': 'Gene'
  'select': [
    'secondaryIdentifier'
    'symbol'
    'primaryIdentifier'
    'organism.name'
    'organism.taxonId'
  ]
  'orderBy': [ {
    'path': 'secondaryIdentifier'
    'direction': 'ASC'
  } ]

module.exports = query
