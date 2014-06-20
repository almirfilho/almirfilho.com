module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    shell:
      metalsmith:
        command: 'node_modules/.bin/metalsmith'
        options:
          stderr: false

    watch:
      content:
        files: ['src/**/*.md']
        tasks: ['metal']

  grunt.registerTask 'metal', ['shell:metalsmith']
  grunt.registerTask 'run', ['watch:content']
