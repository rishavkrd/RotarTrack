const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        'maroon': { 
          '50': '#FF1A12', 
          '100': '#FF0D05', 
          '200': '#EB0600', 
          '300': '#D10400', 
          '400': '#B80300', 
          '500': '#9E0200', 
          '600': '#850100', 
          '700': '#6B0000', 
          '800': '#570000',
          '900': '#420001' 
        }
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
