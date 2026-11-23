# mrkrsl's Homebrew tap

[Ombro](https://ombro.app/) is a crew of AI agents, briefed by you and working
in the background. This tap installs its desktop app on macOS (Apple silicon):

```bash
brew install mrkrsl/tap/ombro
```

The app updates itself, so `brew upgrade` leaves it alone unless you add
`--greedy`. `brew uninstall ombro` removes the app; `brew uninstall --zap ombro`
also removes its caches and preferences, but not your settings
(`~/.config/ombro`) or your jobs and chats (`~/Ombro`).

The Ombro cask follows Ombro's latest release on its own: a daily workflow takes the
version and checksum from the release, checks the cask with Homebrew and
installs it before committing.

Ombro's code, issues and releases are at
[mrkrsl/ombro](https://github.com/mrkrsl/ombro). This tap is under the
BSD 2-Clause licence, like Homebrew's own.
