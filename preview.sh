(trap 'kill 0' SIGINT; while sleep 0.1; do find Sources -type f -name "*.md" -o -name "*.swift" | entr -d swift run; done & python3 -m http.server -d site/ 8083 & npx tailwindcss -i tailwind.css -o ./site/css/main.css --watch)

