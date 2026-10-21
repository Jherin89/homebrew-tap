# Jherin89/homebrew-tap

Homebrew formulae for command-line tools by [Jordan Herin](https://github.com/Jherin89).

| Formula | Install | What it is |
| --- | --- | --- |
| [`daypeek`](Formula/daypeek.rb) | `brew install jherin89/tap/daypeek` | One-screen terminal dashboard: calendar, tasks from 10 apps, weather. [Details below](#daypeek). |
| [`tidy`](Formula/tidy.rb) | `brew install jherin89/tap/tidy` | Safe, rules-driven Downloads folder organizer. Dry-run by default, Trash not delete, one-command undo. [Details below](#tidy). |

Every formula pins its downloads to SHA-256 checksums, and CI ([`test.yml`](.github/workflows/test.yml)) runs `brew style`, `brew audit --strict`, `brew install` and `brew test` for each one on macOS (Apple Silicon and Intel) and Linux.

## tidy

[tidy](https://github.com/Jherin89/tidy) cleans up a messy Downloads folder using rules you can read and edit. It shows a preview first, sends removals to the Trash (never a permanent delete), never overwrites, and `tidy undo` reverses the last run.

1. Install it:

   ```sh
   brew install jherin89/tap/tidy
   ```

2. Preview what it would do. This is read-only:

   ```sh
   tidy
   ```

3. Apply the plan, and undo it if you change your mind:

   ```sh
   tidy --apply
   tidy undo
   ```

4. Optional: sort new downloads automatically at login (macOS):

   ```sh
   tidy watch --install
   ```

| Platform | tidy v0.2.0 |
| --- | --- |
| macOS, Apple Silicon and Intel | Prebuilt universal binary |
| Linux x86_64 and ARM64 | Prebuilt static (musl) binary, any distribution |

Update with `brew upgrade tidy`. To uninstall, run `tidy watch --uninstall` first if you set up the watcher, then `brew uninstall tidy`. Full guide: [tidy README](https://github.com/Jherin89/tidy#readme).

The tidy formula is regenerated after each release with [`scripts/bump-homebrew.sh`](https://github.com/Jherin89/tidy/blob/main/scripts/bump-homebrew.sh), which reads the release's `.sha256` files. Neither repository stores a token.

## daypeek

[daypeek](https://github.com/Jherin89/daypeek) is a fast, one-screen dashboard
for your terminal: today's calendar, your tasks from 10 apps (Todoist, Things,
Apple Reminders, Obsidian, TickTick, Microsoft To Do, Google Tasks, Notion,
todo.txt, Markdown), and the weather, in one quick command.

This repository is its [Homebrew](https://brew.sh) tap: the recipe Homebrew
uses to install and update daypeek.

### Install

You need Homebrew first. If `brew --version` doesn't print a version, install
it from [brew.sh](https://brew.sh) (one command), then open a new terminal.

1. Install daypeek:

   ```sh
   brew install jherin89/tap/daypeek
   ```

   That one line adds this tap and installs daypeek. (If you prefer two steps:
   `brew tap jherin89/tap`, then `brew install daypeek`.)

2. Check that it works, with fake sample data (no accounts needed):

   ```sh
   daypeek --demo
   ```

3. Connect your own calendar, task apps and weather. The guided setup asks a
   few questions and writes the config for you:

   ```sh
   daypeek setup
   ```

4. See your day:

   ```sh
   daypeek
   ```

### Use it

| Command | What you get |
| --- | --- |
| `daypeek` | Today: calendar, tasks, weather, daily note |
| `daypeek tomorrow` | Tomorrow's events, tasks due tomorrow, the forecast |
| `daypeek week` | The next seven days, one block per day |
| `daypeek --compact` | A 3-line summary, made for shell startup |
| `daypeek --json` | Everything as JSON, for scripts |
| `daypeek providers` | Checks every connected app and says what's missing |
| `daypeek --refresh` | Fetch everything now instead of reusing results from the last few minutes |

Show it every time you open a terminal (zsh, the macOS default):

```sh
echo 'daypeek --compact' >> ~/.zshrc
```

Full guides: [setup](https://github.com/Jherin89/daypeek/blob/main/docs/SETUP.md) ·
[usage](https://github.com/Jherin89/daypeek/blob/main/docs/USAGE.md).

### Update and uninstall

```sh
brew update && brew upgrade daypeek   # get the newest version
brew uninstall daypeek                # remove it
brew untap jherin89/tap               # forget this tap
```

Uninstalling leaves your settings in `~/.config/daypeek/` and the cache in
`~/.cache/daypeek/`; delete those folders too if you want a clean slate.

### Which platforms get a ready-made binary?

| Platform | daypeek v0.1.0 |
| --- | --- |
| macOS, Apple Silicon (M1 and later) | Prebuilt binary (installs in seconds) |
| macOS, Intel | Built from source by Homebrew (installs Rust for the build; takes a few minutes) |
| Linux x86_64 | Prebuilt binary; needs glibc 2.39+ (Ubuntu 24.04, Debian 13, Fedora 40 or newer) |
| Linux ARM64 | Built from source by Homebrew |

The next daypeek release adds prebuilt Intel Mac binaries and a static Linux
binary that runs on any distribution, and this formula will switch to them.
Every download is pinned to a SHA-256 checksum, so Homebrew refuses a file
that doesn't match the release.

### Troubleshooting

- **`brew: command not found`**: install Homebrew from [brew.sh](https://brew.sh),
  then open a new terminal window.
- **`daypeek: command not found` right after installing**: open a new terminal,
  or run `eval "$(brew shellenv)"`.
- **Something doesn't show up** (a calendar, an app's tasks): run
  `daypeek providers`. It lists every source and what each one still needs.
- **Linux: `GLIBC_2.39 not found`**: your distribution is older than the v0.1.0
  binary supports. Install with `cargo install --git https://github.com/Jherin89/daypeek`
  for now; the next release's static build fixes this.

### About this tap

- Formula: [`Formula/daypeek.rb`](Formula/daypeek.rb)
- Bugs and ideas for daypeek itself: [daypeek issues](https://github.com/Jherin89/daypeek/issues)
- License: MIT (same as daypeek)
