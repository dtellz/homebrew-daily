# daily

<p align="center" margin="0">
    <a href="https://www.diego-tellez.com/">
    <img alt="stuart logo" src="./assets/daily-logo.png" width="250">
</a>
</p>

A simple CLI tool to help you present your daily tasks during you remote daily stand ups.

## Installation

You can install `daily` via Homebrew with the following commands:

```bash
brew tap dtellz/daily
brew install daily
```

## Usage

`daily` allows you to add tasks done, tasks todo, display list for the day and search on your previously added notes.

You can add a task done by running:

```bash
daily did "reviewed auth PR"
```

You can add a task todo by running:

```bash
daily do "implement auth"
```

You can display the list of tasks for the day by running:

```bash
daily display
```

You can search for a task by running:

```bash
daily search "auth"
```

You can search for a full day list by running:

```bash
daily search "24/05/23"
```

## Contributing

If you would like to contribute to this project, please open an issue or a pull request. We welcome any and all contributions.

## License

This project is licensed under the MIT License - see the [MIT License](https://opensource.org/licenses/MIT) file for details.
