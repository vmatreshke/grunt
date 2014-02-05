module.exports = (grunt) ->
	grunt.initConfig
		# includes:
		# 	files:
		# 		src: ["dev/*.html"] # Source files
		# 		dest: "fancy" # Destination directory
		# 		flatten: true
		# 		cwd: "."
		# 		options:
		# 			silent: true
		# 			filenamePrefix: "partials/"
		# 			filenameSuffix: ".html"
		bake:
			build:
				files:[{
						src: "dev/index.html"
						dest: "fancy/index.html"
					},{
						src: "dev/index1.html"
						dest: "fancy/index1.html"
					}
				]


		clean:
			files: ["fancy/*.html", "fancy/*.js", "fancy/img/"]

		copy:
			main:
				files: [
					expand: true
					cwd: "dev/img/"
					src: ["**"]
					dest: "fancy/img"
				,
					expand: true
					cwd: "dev/js"
					src: ["**"]
					dest: "fancy/js"
				,
					expand: true
					cwd: "dev/img/svg/"
					src: "*"
					dest: "fancy/img/svg/"
					filter: "isFile"
				]
		watch:
			files: ["dev/*.html", "dev/js/*.js", "dev/partials/*.html", "dev/img/icons*.png"]
			tasks: ["clean", "bake:build", "copy"]

	require("matchdep").filterDev("grunt-*").forEach grunt.loadNpmTasks
	grunt.registerTask "default", ["watch"]
	grunt.registerTask "a", ["clean", "includes", "copy"]