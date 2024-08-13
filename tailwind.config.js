const plugin = require('tailwindcss/plugin')

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./site/**/*.html"],
  theme: {
    extend: {
      keyframes: {
        "drive-car": {
          '0%, 100%': { transform: 'translateX(64px)' },
          '50%': { transform: 'translateX(-48px)' },
        },
        "bounce-car": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-4px)' },
        },
        "bounce-paw": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-5px)' },
        },
        "bounce-wheels": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-1px)' },
        },
        "bounce-hog": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-8px)' },
        },
      },
      animation: {
        "drive-car": 'drive-car 12s ease-in-out infinite',
        "bounce-car": 'bounce-car 0.6s ease-in-out infinite',
        "bounce-paw": 'bounce-paw 0.6s ease-in-out infinite',
        "bounce-wheels": 'bounce-wheels 0.6s ease-in-out infinite',
        "bounce-hog": 'bounce-hog 0.6s ease-in-out infinite',
      },
      extrude: {
        sm: '0 1px 0px var(--tw-shadow-color)',
        DEFAULT: '0 4px 0px var(--tw-shadow-color)',
        lg: '0 2px 0px var(--tw-shadow-color), 0 4px 0px var(--tw-shadow-color), 0 6px 0px var(--tw-shadow-color), 0 8px 0px var(--tw-shadow-color)',
      },
    },
    fontFamily: {
      'rounded': ['ui-rounded', '-apple-system', 'system-ui', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto', '"Helvetica Neue"', 'Arial', 'sans-serif']
    },
    container: {
      center: true
    },
    screens: {
      'sm': '375px',
      'md': '900px',
    }
  },
  plugins: [
    plugin(function ({ matchUtilities, theme }) {
      matchUtilities({
          'text-extrude': (value) => ({
            'text-shadow': value,
          }),
        },
        { values: theme('extrude') }
      )
      matchUtilities({
          'container-extrude': (value) => ({
            'box-shadow': value,
          }),
        },
        { values: theme('extrude') }
      )
    }),
  ],
}

