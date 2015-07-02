module.exports = ->

	@initConfig
		coffee:
			src:
				expand: true
				flatten: false
				cwd: 'src'
				src: ['**/*.coffee', 'package.json']
				dest: '.tmp/src'
				ext: '.js'

		browserify:
			dist:
				src: '.tmp/src/app.js'
				dest: 'build/app.js'
				options:
					transform: ['jstify']
					browserifyOptions:
						standalone: 'imqb'

		copy:
			main:
				files: [
					{expand: true, src: ['src/templates/**'], dest: '.tmp/'},
					{expand: true, src: ['package.json'], dest: '.tmp/'}
				]

		clean:
			build: ["build"]

		connect:
			all:
				options:
					port: 9000

		watch:
			coffee:
				files: 'src/**'
				tasks: ['build']

	@loadNpmTasks "grunt-contrib-coffee"
	@loadNpmTasks "grunt-browserify"
	@loadNpmTasks "grunt-contrib-connect"
	@loadNpmTasks "grunt-contrib-clean"
	@loadNpmTasks "grunt-contrib-watch"
	@loadNpmTasks "grunt-contrib-copy"

	@registerTask "default", ["watch"]
	@registerTask "serve", ["build", "connect", "watch"]
	@registerTask "build", ["clean:build", "copy:main", "coffee", "browserify:dist"]
	@registerTask "clean", ["clean:all"]