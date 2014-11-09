module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    files:
      typescript:
        src: "app/**/*.ts"
        dest: "dest/app.ts.js"
      concat:
        dest: "dest/app.js"
      uglify:
        dest: "dest/app.min.js"

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
    concat:
      options:
        separator: ';'
      dist:
        src: ["<%= files.typescript.dest %>"],
        dest: "<%= files.concat.dest %>"
    uglify:
      options:
        mangle: true
        compress: true
      dist:
        files:
          "<%= files.uglify.dest %>": ["<%= files.concat.dest %>"]
    watch:
      typescript:
        files: "<%= files.typescript.src %>"
        tasks: ['typescript', 'concat']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-typedoc'
  grunt.loadNpmTasks 'grunt-typescript'

  # Default task.
  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build', ['typescript', 'typedoc', 'concat', 'uglify']
  grunt.registerTask 'doc', ['typedoc']