module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    shell:
      metalsmith:
        command: 'node_modules/.bin/coffee <%= pkg.main %>'
        options:
          stderr: false

    stylus:
      prod:
        files:
          'build/styles/style.css': 'src/assets/styles/main.styl'
      dev:
        options:
          compress: false
        files:
          'build/styles/style.css': 'src/assets/styles/main.styl'

    connect:
      server:
        options:
          port: 4001
          base: 'build'
          keepalive: true

    clean:
      all: ['build']
      after: ['build/pages']

    copy:
      images:
        files: [
          expand: true
          cwd: 'src/content/images/'
          src: ['**']
          dest: 'build/images/'
        ]

    watch:
      content:
        files: ['src/content/**/*.md', 'src/templates/**/*.hbt']
        tasks: ['build:dev']
      styles:
        files: ['src/assets/styles/**/*.styl']
        tasks: ['stylus:dev']
      images:
        files: ['src/**/*.jpg']
        tasks: ['copy:images']

    concurrent:
      dev:
        tasks: ['connect', 'watch']
        options:
          logConcurrentOutput: true

  grunt.registerTask 'metal', ['shell:metalsmith', 'clean:after']
  grunt.registerTask 'build:dev', ['metal', 'stylus:dev', 'copy:images']
  grunt.registerTask 'build:prod', ['metal', 'stylus:prod', 'copy:images']
  grunt.registerTask 'run', ['build:dev', 'concurrent']
  grunt.registerTask 'default', ['run']
