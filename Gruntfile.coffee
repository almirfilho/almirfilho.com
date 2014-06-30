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
      compile:
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
        files: ['src/content/**/*.md', 'src/content/**/*.hbt']
        tasks: ['metal']
      styles:
        files: ['src/assets/styles/**/*.styl']
        tasks: ['stylus']

    concurrent:
      dev:
        tasks: ['connect', 'watch:content', 'watch:styles']
        options:
          logConcurrentOutput: true

  grunt.registerTask 'metal', ['shell:metalsmith', 'clean:after', 'copy:images']
  grunt.registerTask 'run', ['metal', 'concurrent']
  grunt.registerTask 'default', ['run']
