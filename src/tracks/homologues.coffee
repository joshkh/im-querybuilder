query =
  'description': 'Homologues'
  'from': 'Gene'
  'select': [
    'homologues.homologue.primaryIdentifier'
    'homologues.homologue.symbol'
    'homologues.homologue.organism.shortName'
    'homologues.evidence.evidenceCode.name'
    'homologues.dataSets.name'
  ]

module.exports = query
