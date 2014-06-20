module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-shell'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    shell:
      metalsmith:
        command: 'node_modules/.bin/metalsmith'
        options:
          stderr: false

  grunt.registerTask 'metal', ['shell:metalsmith']