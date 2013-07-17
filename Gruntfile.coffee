#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    watch:

      livereload:
        files: "dist"
        options:
          livereload: true

      partials:
        files: "partials/*"
        tasks: "concat:partials"
        options:
          livereload:true

      stylesheets:
        files: "scss/**/*"
        tasks: "compass:dev"

      javascript:
        files: "coffee/*"
        tasks: "javascript:dev"

      testing:
        files: "specs/*"
        tasks: "jasmine"

    compass:
      dev:
        options:
          environment: 'dev'
      dist:
        options:
          environment: 'production'

    coffee:
      compile:
        files:
          "dist/js/grunt-demo.js": "coffee/app.coffee"

      jasmine_specs:
        files: grunt.file.expandMapping(["specs/*.coffee"], "specs/js/", {
          rename: (destBase, destPath) ->
            destBase + destPath.replace(/\.coffee$/, ".js").replace(/specs\//, "")
        })


    jsTesting:
      files: "dist/js/*.js"
      tasks: "jasmine"


    concat:
      partials:
        options:
          process: true
        files:
          # destination as key, sources as value
          "dist/index.html": ["partials/_header.html", "partials/_home-page.html", "partials/_footer.html"]

    jasmine:
      src: "dist/js/*.js"
      options:
        specs: "specs/js/*Spec.js"
        helpers: "specs/js/*Helper.js"
        vendor: ["public/js/jquery-1.9.1.min.js", "specs/lib/*.js"]

    uglify:
      my_target:
        files:
          "dest/<%= pkg.name %>.min.js": "js/<%= pkg.name %>.js"

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-jasmine"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-notify"

  # Clean, compile and concatenate JS
  grunt.registerTask "javascript:dev", [ "coffee", "jasmine" ]

  grunt.registerTask "javascript:dist", [ "coffee", "jasmine", "uglify" ]

  # Production task
  grunt.registerTask "dev", [ "javascript:dev", "compass:dev", "concat:partials" ]

  grunt.registerTask "dist", ["javascript:dist", "compass:dist", "concat:partials" ]

  # Default task
  grunt.registerTask "default", "dev"