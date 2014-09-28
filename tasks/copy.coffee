module.exports = (grunt) ->
  src   = grunt.config.data.paths.src
  build = grunt.config.data.paths.build

  grunt.config 'copy',
    images:
      files: [
        expand: true
        cwd: src.images
        src: ['**']
        dest: build.images
      ]

    post_images:
      files: [
        expand: true
        cwd: src.posts
        src: ['**/*.jpg']
        dest: build.posts + '/'
        rename: (dest, src, opt) -> dest + src.replace /^\d{4}\//, ''
      ]

    fonts:
      files: [
        expand: true
        cwd: src.fonts
        src: ['**']
        dest: build.fonts
      ]
