module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    shell:
      metalsmith:
        command: 'node_modules/.bin/coffee <%= pkg.main %>'
        options:
          stderr: false

    connect:
      server:
        options:
          port: 4001
          base: 'build'
          keepalive: true

    clean:
      build: ['build']

    watch:
      content:
        files: ['src/**/*.md', 'src/**/*.hbt']
        tasks: ['shell:metalsmith']

    concurrent:
      dev:
        tasks: ['connect', 'watch:content']
        options:
          logConcurrentOutput: true

  grunt.registerTask 'metal', ['shell:metalsmith']
  grunt.registerTask 'run', ['metal', 'concurrent']
  grunt.registerTask 'default', ['run']
