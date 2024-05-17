# Hangman Game in Assembly Language

![Hangman Game](https://img.shields.io/badge/Hangman-Game-blue.svg)

Welcome to the Hangman Game implemented in Assembly Language! This project is designed to run on DOS/BIOS and simulates the classic word-guessing game with a fun twist, providing clues and graphical representation of the hangman.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [How to Play](#how-to-play)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Contributing](#contributing)

## Introduction

Hangman is a classic word-guessing game where the player attempts to guess a word by suggesting letters within a certain number of guesses. This implementation includes a graphical representation of the hangman using DOS/BIOS interrupts.

## Features

- **Random Word Selection:** The game selects a random word from a predefined list of musical instruments.
- **Graphical Display:** Visual representation of the hangman using DOS/BIOS interrupts.
- **Clue Provided:** A hint is given to the player, indicating the category of the word.
- **Life Count:** The player has a limited number of lives (5 by default).
- **Interactive Messages:** Various messages guide the player throughout the game.

## How to Play

1. **Start the Game:** Run the assembled and linked executable to start the game.
2. **Guess the Letters:** Type letters to guess the hidden word.
3. **Win or Lose:** If you guess the word correctly before running out of lives, you win! If you run out of lives, the game will display a "YOU LOSE" message.

## Installation

1. **Clone the Repository:**
    ```sh
    git clone https://github.com/your-username/hangman-game-assembly.git
    ```
2. **Navigate to the Project Directory:**
    ```sh
    cd hangman-game-assembly
    ```
3. **Assemble and Link the Code:**
    - Using TASM:
      ```sh
      tasm /zi hangman.asm
      tlink /v hangman.obj
      ```
    - Using MASM:
      ```sh
      masm hangman.asm;
      link hangman.obj;
      ```

## Usage

1. **Run the Game:**
    ```sh
    hangman.exe
    ```
2. **Follow On-Screen Instructions:** Interact with the game by typing letters to guess the hidden word.

## File Structure

- `hangman.asm`: Main assembly code for the Hangman game.
- `README.md`: Project documentation.
- Other necessary files and folders.

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. **Fork the Repository**
2. **Create a New Branch**
    ```sh
    git checkout -b feature/your-feature-name
    ```
3. **Commit Your Changes**
    ```sh
    git commit -m 'Add some feature'
    ```
4. **Push to the Branch**
    ```sh
    git push origin feature/your-feature-name
    ```
5. **Open a Pull Request**


