module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    files:
      typescript:
        src: "app/**/*.ts"
        dest: "dest/app.ts.js"
        dest_min: "dest/app.ts.min.js"

    typescript:
      compile:
        files:
          "<%= files.typescript.dest %>": "<%= files.typescript.src %>"
        options:
          target: 'es5'
          sourceMap: true
    typedoc:
      build:
        options:
          target: 'es5'
          out: 'docs/'
          name: 'react_with_typescript'
        src: "<%= files.typescript.src %>"
    uglify:
      options:
        mangle: true
        compress: true
      dist:
        files:
          "<%= files.typescript.dest_min %>": ["<%= files.typescript.dest %>"]
    watch:
      typescript:
        files: "<%= files.typescript.src %>"
        tasks: ['typescript']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-typedoc'
  grunt.loadNpmTasks 'grunt-typescript'

  # Default task.
  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build', ['typescript', 'typedoc', 'uglify']
  grunt.registerTask 'doc', ['typedoc']