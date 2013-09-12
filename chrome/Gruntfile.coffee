module.exports = (grunt) ->
  grunt.initConfig
    clean:
      app: 'build/'
      dist: 'dist/'

    copy: 
      main: 
        expand: true
        cwd:    'src/'
        dest:   'build/'
        src: [
          'lib/*'
          '**.json'
          '**.png'
        ] 
    
    watch:
      files: ['src/**/*']
      tasks: ['build']

    shell:
      zip:
        command: "mkdir -p dist/ && zip -r dist/subhub-chrome.zip build"

    coffee:
      compile: 
        files: 
          'build/scripts/content.js': ['src/scripts/content.coffee']
          'build/scripts/background.js': ['src/scripts/background.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask 'build', [
    'clean'
    'coffee'
    'copy'    
  ]

  grunt.registerTask 'default', 'build'
  grunt.registerTask 'dist', [
    'build' 
    'clean:dist' 
    'shell:zip'
  ]  