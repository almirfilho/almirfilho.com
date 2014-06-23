module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    shell:
      metalsmith:
        command: 'node_modules/.bin/coffee build.coffee'
        options:
          stderr: false

    connect:
      server:
        options:
          port: 4001
          base: 'build'
          keepalive: true

    watch:
      content:
        files: ['src/**/*.md']
        tasks: ['shell:metalsmith']

  grunt.registerTask 'metal', ['shell:metalsmith']
  grunt.registerTask 'run', ['watch:content']
