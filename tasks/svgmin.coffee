module.exports = (grunt) ->
  grunt.config 'svgmin',
    dist:
      files: [
        expand: true
        cwd: 'build/images/'
        src: ['**/*.svg']
        dest: 'build/images/'
      ]
