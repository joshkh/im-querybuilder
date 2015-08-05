query =
  'description': 'Pathways'
  'from': 'Gene'
  'select': [
    'secondaryIdentifier'
    'symbol'
    'pathways.identifier'
    'pathways.name'
    'pathways.dataSets.name'
  ]
  'orderBy': [ {
    'path': 'secondaryIdentifier'
    'direction': 'ASC'
  } ]
  'where': [ {
    'path': 'Gene'
    'op': 'LOOKUP'
    'value': 'bsk'
    'extraValue': 'D. melanogaster'
    'code': 'A'
  } ]

module.exports = query
