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
				files: 'sass/**'
				tasks: ['sass']

		sass:
			dev:
				options: {style: 'expanded', compass: false}
				files:
					'dist/imqb.css': 'sass/style.scss'

		uglify:
			options:
				mangle: false
			main:
				files:
					'dist/imqb.min.js': 'dist/imqb.js'


	@loadNpmTasks "grunt-contrib-coffee"
	@loadNpmTasks "grunt-browserify"
	@loadNpmTasks "grunt-contrib-connect"
	@loadNpmTasks "grunt-contrib-clean"
	@loadNpmTasks "grunt-contrib-watch"
	@loadNpmTasks "grunt-contrib-copy"
	@loadNpmTasks "grunt-contrib-sass"
	@loadNpmTasks "grunt-contrib-uglify"


	@registerTask "build", [
		"clean:all", 	# Clean our build directories
		"copy:main", 	# Copy assets to tmp folder
		"coffee", 		# Transcompile our coffeescript to js
		"browserify:dist",
		"sass:dev"
	]



	@registerTask "dev", [
		"build",
		"connect",
		"watch"
	]
