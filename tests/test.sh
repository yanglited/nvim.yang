#!/bin/bash

# Define an array of jokes
jokes=(
    "Why don't scientists trust atoms? Because they make up everything!"
    "Parallel lines have so much in common. It's a shame they'll never meet."
    "I told my wife she was drawing her eyebrows too high. She looked surprised."
    "What do you get when you cross a snowman and a vampire? Frostbite."
    "I used to play piano by ear, but now I use my hands."
)

# Function to display a random joke
tell_joke() {
    # Get the number of jokes in the array
    num_jokes=${#jokes[@]}
    
    # Generate a random index
    random_index=$((RANDOM % num_jokes))
    
    # Get the joke at the random index
    joke=${jokes[random_index]}
    
    # Print the joke
    echo "$joke"
}

# Main function
main() {
    echo "Here's a random joke for you:"
    tell_joke
}
tell_joke
# Run the main function
main

echo "This is a syntax error example"

# Missing a closing quote in the following line
echo "This line has a syntax error

# This line has a missing semicolon
echo "This line has a syntax error too"

# This line has an unclosed comment
echo "This line is a syntax error" # Missing closing comment symbol

# This line has an unmatched closing parenthesis
echo "This line is a syntax error" )
