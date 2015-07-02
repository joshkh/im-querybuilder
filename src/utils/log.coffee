enabled = true
context = "𝖎𝖒-𝖖𝖇  "


module.exports = alias =
	debug: !enabled || console.debug.bind console, context
	log: !enabled || console.log.bind console, context
	warn: !enabled || console.warn.bind console, context
	error: !enabled || console.error.bind console, context
