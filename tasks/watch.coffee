module.exports = (grunt) ->
  grunt.config 'watch',
    content:
      tasks: ['build:dev']
      files: [
        'src/content/**/*.md'
        'src/content/*.yaml'
        'src/templates/*.hbt'
        'src/templates/**/*.hbt'
      ]

    styles:
      tasks: ['stylus:dev']
      files: ['src/assets/styles/**/*.styl']

    images:
      tasks: ['copy:images']
      files: [
        'src/**/*.jpg'
        'src/**/*.svg'
        'src/**/*.png'
      ]
