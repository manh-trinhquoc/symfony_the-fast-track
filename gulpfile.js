// basic
var gulp = require('gulp');
var sass = require('gulp-sass');
let sourcemaps = require("gulp-sourcemaps");
var livereload = require('gulp-livereload');
// aditional
var autoprefixer = require('gulp-autoprefixer'); // auto prefix
var browserSync = require('browser-sync').create();

// input and output
// var input = 'sunshine/assets/sass/**/*.scss';
// var output = 'sunshine/assets/css';

//task
//compile
// gulp.task('sass', function () {
//     return gulp.src(input)
//         .pipe(sourcemaps.init())
//         .pipe(sass({
//             outputStyle: 'expanded'
//         }))
//         //.pipe(autoprefixer())
//         .pipe(sourcemaps.write("../maps/css"))
//         .pipe(gulp.dest(output))
//     // .pipe(livereload());
// });
// Watch Files For Changes
gulp.task('browser-sync', function () {
    browserSync.init({
        proxy: "http://symfony-the-fast-track:8080/",
        // port: 3002,
    });
    gulp.watch("**/*.scss").on('change', browserSync.reload);
    gulp.watch("**/*.php").on('change', browserSync.reload);
    gulp.watch("**/*.js").on('change', browserSync.reload);
    gulp.watch("**/*.twig").on('change', browserSync.reload);
    gulp.watch("**/*.yml").on('change', browserSync.reload);
    livereload.listen();
    //gulp.watch([input], gulp.series('sass'));

});

// Default Task
gulp.task('default', gulp.series('browser-sync'))