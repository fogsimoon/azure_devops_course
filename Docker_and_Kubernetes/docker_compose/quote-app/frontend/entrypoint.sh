#!/bin/sh

# Ensure API URL is set
if [ -z "$REACT_APP_API_URL" ]; then
  echo "REACT_APP_API_URL is not set! Using default."
  REACT_APP_API_URL="http://localhost:3000"
fi

# Replace placeholder in built React files
echo "Replacing API URL in React build files..."
find /app/build/static/js -type f -exec sed -i "s|REACT_APP_API_URL_PLACEHOLDER|$REACT_APP_API_URL|g" {} +

# Start the server
exec npx serve -s build -l 8080
