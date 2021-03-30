// basic
var gulp = require('gulp');
var sass = require('gulp-sass');
let sourcemaps = require("gulp-sourcemaps");
var livereload = require('gulp-livereload');
// aditional
var autoprefixer = require('gulp-autoprefixer'); // auto prefix
var browserSync = require('browser-sync').create();

// input and output
var input = 'sunshine/assets/sass/**/*.scss';
var output = 'sunshine/assets/css';

//task
//compile
gulp.task('sass', function () {
    return gulp.src(input)
        .pipe(sourcemaps.init())
        .pipe(sass({
            outputStyle: 'expanded'
        }))
        //.pipe(autoprefixer())
        .pipe(sourcemaps.write("../maps/css"))
        .pipe(gulp.dest(output))
    // .pipe(livereload());
});
// Watch Files For Changes
gulp.task('browser-sync', function () {
    browserSync.init({
        proxy: "http://localhost/website_sunshinegroup/",
        // port: 3002,
    });
    gulp.watch("sunshine/**/*.scss").on('change', browserSync.reload);
    gulp.watch("sunshine/**/*.php").on('change', browserSync.reload);
    gulp.watch("sunshine/**/*.js").on('change', browserSync.reload);
    livereload.listen();
    gulp.watch([input], gulp.series('sass'));

});

// Default Task
gulp.task('default', gulp.series('sass', 'browser-sync'))