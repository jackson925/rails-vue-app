module.exports = {
    content: ["./src/**/*.{html,js}"],
    purge: [
      "./app/**/*.html.erb",
    ],
    darkMode: false, // or 'media' or 'class'
    theme: {
      extend: {},
    },
    variants: {
      extend: {},
    },
    plugins: [],
}