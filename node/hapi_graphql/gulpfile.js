'use strict';

var gulp   = require('gulp');
var plugins = require('gulp-load-plugins')();

var paths = {
  lint: ['./gulpfile.js', './lib/**/*.js', '!lib/**/node_modules/**'],
  tests: ['./test/**/*.js', '!./test/{temp,temp/**}']
};

gulp.task('lint', function () {
  return gulp.src(paths.lint)
    .pipe(plugins.jshint('.jshintrc'))
    .pipe(plugins.jscs())
    .pipe(plugins.jshint.reporter('jshint-stylish'));
});

gulp.task('lab', function () {
  gulp.src(paths.tests, {cwd: __dirname})
    .pipe(plugins.lab('-v -l -c'));
});

gulp.task('test', ['lint', 'lab']);

gulp.task('bump', ['test'], function () {
  var bumpType = plugins.util.env.type || 'patch'; // major.minor.patch
  return gulp.src(['./package.json'])
    .pipe(plugins.bump({ type: bumpType }))
    .pipe(gulp.dest('./'));
});

gulp.task('release', ['bump']);

gulp.task('default', function () {
  gulp.run('test');
  plugins.nodemon({ script: './lib/index.js', ext: 'js'})
    .on('change', ['test']);
});
