/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  
  plugins: [
    require("daisyui"),
  ],
  
  daisyui: {
    darkTheme: false, // ダークモードをONにする場合は削除
    themes: [
      'business', // businessテーマを追加
    ],
  },
}