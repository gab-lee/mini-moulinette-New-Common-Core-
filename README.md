# Mini-moulinette — New Common Core

![mini-moulinette](mini-moulinette.jpg)

Mini-moulinette is a test runner for 42 assignments. It runs a full suite of automated tests over an assignment with a single command, so you can check your code thoroughly *before* submitting — instead of finding out the hard way at evaluation.

This repository is a fork that aims to extend mini-moulinette to the **New Common Core** curriculum (Circles 0–6).


## Credits

All credit for the original mini-moulinette goes to **[Khairul Haaziq](https://github.com/khairulhaaziq)** — the original project lives at [khairulhaaziq/mini-moulinette](https://github.com/khairulhaaziq/mini-moulinette).

This tool was incredibly useful during my piscine: it saved me countless hours of waiting for evaluations only to fail on silly mistakes. This fork exists because I want the same safety net while going through the Common Core. Thank you, Khairul! 🙏


## How Does It Work?

![screenshot](screenshot.jpg)

- Mini-moulinette runs through all the test cases for an assignment automatically and checks that the expected conditions are met.
- It then prints a per-exercise pass/fail summary.
- Scoring follows 42's practice: if an earlier exercise fails, the following ones don't count.


## Roadmap

The original project covers the piscine (C00–C08). The goal of this fork is to progressively add test suites for the Common Core, circle by circle:

- [x] Piscine C00–C08 (inherited from the original project)
- [ ] Adapt the runner to detect Common Core project directories (not just `C00`–`C13`)
- [ ] **Circle 0** — Libft (Part 1, Part 2, bonus list functions)
- [ ] **Circle 1** — ft_printf, get_next_line (mandatory + bonus)
- [ ] **Circle 2** — push_swap (operation validity + sort check), minitalk / pipex
- [ ] **Circle 3** — philosophers (death timing / no-death scenarios), minishell (command comparison against bash)
- [ ] **Circle 4** — CPP Modules 00–04
- [ ] **Circle 5** — CPP Modules 05–09, webserv / ft_irc basic conformance tests
- [ ] Exam practice mode (exam rank 02–06 style exercises)

Projects that are graphical, system-administration or web-based (Born2beroot, so_long / FdF / fract-ol, NetPractice, cub3D / miniRT, inception, ft_transcendence) don't lend themselves well to automated unit testing, so they are out of scope for now — the table below still lists them for completeness.


## Coverage Status

### New Common Core

| Circle | Project                    | Exercises / Parts to cover                 | Coverage        |
| :----: | :------------------------- | :----------------------------------------- | :-------------: |
| 0      | Libft                      | Part 1 (libc), Part 2 (additional), bonus  | Planned         |
| 1      | ft_printf                  | Mandatory conversions + bonus flags        | Planned         |
| 1      | get_next_line              | Mandatory + multiple-fd bonus              | Planned         |
| 1      | Born2beroot                | —                                          | Out of scope (VM / sysadmin) |
| 2      | push_swap                  | Operation validity, sort check, op count   | Planned         |
| 2      | minitalk / pipex           | Signal transmission / pipe behaviour       | Planned         |
| 2      | so_long / FdF / fract-ol   | —                                          | Out of scope (graphical) |
| 3      | philosophers               | Death timing, no-death scenarios           | Planned         |
| 3      | minishell                  | Output comparison against bash             | Planned         |
| 4      | NetPractice                | —                                          | Out of scope (web exercise) |
| 4      | cub3D / miniRT             | —                                          | Out of scope (graphical) |
| 4      | CPP Modules 00–04          | Per-exercise behaviour tests               | Planned         |
| 5      | CPP Modules 05–09          | Per-exercise behaviour tests               | Planned         |
| 5      | webserv / ft_irc           | Basic protocol conformance                 | Planned         |
| 5      | inception                  | —                                          | Out of scope (Docker infra) |
| 6      | ft_transcendence           | —                                          | Out of scope (web project) |

### Piscine (inherited from the original project)

| Assignment | Coverage | Remarks                                             |
| :--------- | :------: | :-------------------------------------------------- |
| C00        | 9/9      |                                                     |
| C01        | 9/9      |                                                     |
| C02        | 12/13    |                                                     |
| C03        | 6/6      |                                                     |
| C04        | 6/6      |                                                     |
| C05        | 8/9      | ex05, ex06, ex07 tests don't cover all edge cases   |
| C06        | 4/4      |                                                     |
| C07        | 6/6      | ex02, ex03 tests don't cover all edge cases         |
| C08        | 6/6      | Tests mostly just cover compilation                 |
| C09–C13    | 0        | Not covered                                         |


## Get Started

> ***Warning***
> Mini-moulinette is not 100% accurate — the tests may not cover every edge case the real moulinette does. Use it as a safety net, not a guarantee.

1. Clone the repository into `~/mini-moulinette` (the runner expects this path):

```bash
git clone https://github.com/gab-lee/mini-moulinette-New-Common-Core-.git ~/mini-moulinette
```

2. Create an alias for it.

- zsh:

```zsh
echo "alias mini='~/mini-moulinette/mini-moul.sh'" >> ~/.zshrc && source ~/.zshrc
```

- bash:

```bash
echo "alias mini='~/mini-moulinette/mini-moul.sh'" >> ~/.bashrc && source ~/.bashrc
```

3. Go to the assignment directory you want to test, e.g. `C02`:

```bash
cd C02
```

4. Run `mini` with the assignment name as the argument:

```bash
mini C02
```

5. That's it — run it in every assignment directory where tests are provided. Have fun!


## Updating

```bash
cd ~/mini-moulinette && git pull
```


## Debugging

The error/success messages should be explicit enough. However, sometimes you'll hit a segmentation fault or your code won't compile.

### If your code doesn't compile

- Check the headers.
- Check whether the file contains a `main` — it shouldn't.
- Check whether your function name clashes with a standard library function.

### If you get a segmentation fault

Look at the test cases directly:

```bash
cd ~/mini-moulinette/mini-moul/tests
```

Every test file has the same name as the function/program it tests, e.g. `C05/ex00/ft_iterative_factorial.c` contains the tests for C05 > ex00 > `ft_iterative_factorial.c`.

Test cases are declared as an array of structs, e.g. for `ft_iterative_factorial`:

```c
 t_test tests[] = {
        {
            .desc = "Factorial of 0",
            .n = 0,
            .expected = 1,
        },
        {
            .desc = "Factorial of 1",
            .n = 1,
            .expected = 1,
        },
        {
            .desc = "Factorial of 10",
            .n = 10,
            .expected = 3628800,
        },
        {
            .desc = "Factorial of a negative number",
            .n = -5,
            .expected = 0,
        },
 }
```


## Customizing

You can add more test cases in the files above. Note that you'll need to manage your customizations yourself when pulling updates.


## Contributing

Contributions are very welcome — especially new test cases for Common Core projects:

- **Tests**: If you spot an error in a test or have an idea for a new test case, open an issue or a pull request.
- **Code**: Pull requests for the runner itself are happily reviewed.
- **Feedback**: If you've used this fork and have suggestions, let me know via an issue.


## Authors

- Original author: [Khairul Haaziq](https://github.com/khairulhaaziq)
- New Common Core fork: [gab-lee](https://github.com/gab-lee)


## Contributors

- [Claude](https://claude.com) (Anthropic) — a huge contributor to the creation of this fork, helping build and maintain the Common Core test suites
- [ChatGPT](https://chatgpt.com) — contributor to the original project


## License

MIT. Copyright 2023 [Khairul Haaziq](https://github.com/khairulhaaziq).
