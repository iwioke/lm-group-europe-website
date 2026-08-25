/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html'],
  theme: {
    extend: {
      screens: {
        menu: '1150px',
      },
      fontFamily: {
        sans: ['"Space Grotesk"', 'ui-sans-serif', 'system-ui'],
        display: ['"Space Grotesk"', 'sans-serif'],
      },
      colors: {
        ink: '#0a0a0a',
        paper: '#fafafa',
      },
      letterSpacing: {
        tightest: '-0.06em',
      },
    },
  },
  plugins: [],
};
