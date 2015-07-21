query =
  'description': 'GO Terms'
  'from': 'Gene'
  'select': [
    'goAnnotation.ontologyTerm.identifier'
    'goAnnotation.ontologyTerm.name'
    'goAnnotation.evidence.code.code'
    'goAnnotation.ontologyTerm.namespace'
    'goAnnotation.qualifier'
  ]

module.exports = query
