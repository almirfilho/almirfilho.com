module.exports = (grunt) ->
  grunt.config 'copy',
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
