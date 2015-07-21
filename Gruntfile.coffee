module.exports = ->

	@initConfig
		coffee:
			src:
				expand: true
				flatten: false
				cwd: 'src'
				src: ['**/*.coffee']
				dest: '.tmp/src'
				ext: '.js'

		browserify:
			dist:
				src: '.tmp/src/app.js'
				dest: 'dist/imqb.js'
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
			build:
				files: [
					{expand: true, src: ['./build/*'], dest: "dist/"}
				]

		clean:
			all: ["dist", "build", ".tmp"]

		connect:
			all:
				options:
					port: 9000

		watch:
			coffee:
				files: 'src/**'
				tasks: ['build']
			css:
				files: 'less/**'
				tasks: ['less']

		mochaTest:
			test:
				src: ['test/**/*.coffee']


		less:
			dev:
				files:
					'dist/imqb.css': 'less/style.less'

		uglify:
			options:
				mangle: false
			main:
				files:
					'dist/imqb.min.js': 'dist/imqb.js'

		notify:
			build:
				options:
					title: "Build complete."
					message: "Build complete."


	@loadNpmTasks "grunt-contrib-coffee"
	@loadNpmTasks "grunt-browserify"
	@loadNpmTasks "grunt-contrib-connect"
	@loadNpmTasks "grunt-contrib-clean"
	@loadNpmTasks "grunt-contrib-watch"
	@loadNpmTasks "grunt-contrib-copy"
	@loadNpmTasks "grunt-contrib-less"
	@loadNpmTasks "grunt-contrib-uglify"
	@loadNpmTasks "grunt-notify"
	@loadNpmTasks "grunt-mocha-test"


	@registerTask "build", [
		# "clean:all", 	# Clean our build directories
		# "mochaTest"
		"copy:main", 	# Copy assets to tmp folder
		"coffee", 		# Transcompile our coffeescript to js
		"browserify:dist",
		# "sass:dev",
		"notify:build"
	]



	@registerTask "dev", [
		"build",
		"connect",
		"watch"
	]
