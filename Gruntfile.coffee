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
      after: ['build/pages', 'build/posts/2014']

    copy:
      images:
        files: [
          expand: true
          cwd: 'src/content/images/'
          src: ['**']
          dest: 'build/images/'
        ]
      post_images:
        files: [
          expand: true
          cwd: 'src/content/posts/'
          src: ['**/*.jpg']
          dest: 'build/posts/'
          rename: (dest, src, opt) -> dest + src.replace /^\d{4}\//, ''
        ]
      fonts:
        files: [
          expand: true
          cwd: 'src/assets/fonts/'
          src: ['**']
          dest: 'build/fonts/'
        ]

    watch:
      content:
        files: ['src/content/**/*.md', 'src/content/*.yaml', 'src/templates/*.hbt', 'src/templates/**/*.hbt']
        tasks: ['build:dev']
      styles:
        files: ['src/assets/styles/**/*.styl']
        tasks: ['stylus:dev']
      images:
        files: ['src/**/*.jpg', 'src/**/*.svg', 'src/**/*.png']
        tasks: ['copy:images']

    concurrent:
      dev:
        tasks: ['connect', 'watch']
        options:
          logConcurrentOutput: true

  grunt.registerTask 'metal', ['shell:metalsmith', 'clean:after']
  grunt.registerTask 'build:dev', ['metal', 'stylus:dev', 'copy']
  grunt.registerTask 'build:dev:fresh', ['clean:all', 'build:dev']
  grunt.registerTask 'build:prod', ['metal', 'stylus:prod', 'copy']
  grunt.registerTask 'run', ['build:dev:fresh', 'concurrent']
  grunt.registerTask 'default', ['run']
