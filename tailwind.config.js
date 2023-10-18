module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/*.css',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        header: 'hsl(0, 1%, 16%)',
        body: 'hsl(0, 5%, 25%)',
        muted: 'hsl(0, 1%, 44%)',
        primary: 'hsl(350, 67%, 50%)',
        'primary-rotate': 'hsl(10, 73%, 54%)',
        'primary-bg': 'hsl(0, 85%, 96%)',
        secondary: 'hsl(101, 45%, 56%)',
        'secondary-rotate': 'hsl(120, 45%, 56%)',
        tertiary: 'hsl(49, 89%, 64%)',
        glint: 'hsl(210, 100%, 82%)',
        white: 'hsl(0, 0%, 100%)',
        background: 'hsl(30, 50%, 98%)',
        light: 'hsl(0, 6%, 93%)',
        dark: 'hsl(0, 1%, 16%)',
      },
    },
  },
  plugins: [
    function ({ addUtilities, addVariant }) {
      const newUtilities = {
        '.responsive-image': {
          display: 'block',
          maxWidth: '100%',
        },
        '.link': {
          color: 'hsl(350, 67%, 50%)',
          textDecoration: 'none',
          transition: 'color 200ms',
        },
        '.link:hover': {
          color: 'hsl(10, 73%, 54%)',
        },
        '.link:focus': {
          color: 'hsl(10, 73%, 54%)',
        },
        '.link:active': {
          color: 'hsl(10, 73%, 54%)',
        },
      };

      addVariant('link', ({ modifySelectors, separator }) => {
        modifySelectors(({ className }) => {
          return `.link${separator}${className}:hover,
          .link${separator}${className}:focus,
          .link${separator}${className}:active`;
        });
      });

      addUtilities(newUtilities, ['responsive', 'hover', 'link']);
    },
  ],
}
