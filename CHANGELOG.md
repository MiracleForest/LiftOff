# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- The root command is now `/liftoff`.

### Removed

- The `client` variant. The variants are now the default, which is the newest line, and one per LeviLamina line,
  `26_60` and `26_51`; each holds the dedicated-server and the client build, and lip and LeviLauncher pick the one for
  the side they install to. On a client, install `github.com/MiracleForest/LiftOff` or
  `github.com/MiracleForest/LiftOff#26_60`. An install made as `#client` is not updated to this release: uninstall it
  (`lip uninstall github.com/MiracleForest/LiftOff#client`) and install one of the variants above. The configuration
  in `mods/LiftOff/config/` is kept.

## [0.2.0-beta.1] - 2026-11-11

First beta of 0.2.0. Please report anything that behaves differently from 0.1.1.

### Added

- Support for **Minecraft 1.26.60** with LeviLamina 26.60.x, on dedicated servers and on the client, which is now
  the version LiftOff is installed as by default. Minecraft 1.26.51 with LeviLamina 26.51.x is still supported and
  gets its own builds of every release, so nothing is lost by updating.
  - LiftOff is compiled against one LeviLamina line at a time, so each release now ships one download per side and
    line: `liftoff-server-win-x64-ll26.60.zip`, `liftoff-client-win-x64-ll26.60.zip`,
    `liftoff-server-win-x64-ll26.51.zip` and `liftoff-client-win-x64-ll26.51.zip`.

### Changed

- The package is now described by `lip.toml` of format 4 instead of `tooth.json`, so installing it needs
  [lip](https://github.com/LiteLDev/lip) **0.40.0** or later, or a LeviLauncher that reads it. Older releases stay
  installable with older lip.
- Each supported LeviLamina line is a variant named after it: `26_60` for 26.60.x and `26_51` for 26.51.x, each for
  both the dedicated server and the client. The default variant and `client` — the variants earlier releases were
  installed as on servers and clients — are the newest line, so `lip update` and LeviLauncher keep working and simply
  move you to 26.60.
  - To stay on Minecraft 1.26.51, install `github.com/MiracleForest/LiftOff#26_51`, or pick the `26_51` variant on
    the mod's page in LeviLauncher. lip treats it as another package: uninstall `github.com/MiracleForest/LiftOff`
    (or `#client`) first.
  - On a LeviLamina 26.60 server LiftOff lives in `mods/LiftOff/`, where LeviLamina 26.60 loads mods from, instead of
    `plugins/LiftOff/`. Moving a server to 26.60 leaves your configuration in `plugins/LiftOff/config/`: copy it to
    `mods/LiftOff/config/`. On a LeviLamina 26.51 server LiftOff stays in `plugins/LiftOff/`, and on a client in
    `mods/LiftOff/`; the configuration is kept either way.
- The downloads are now lip mod archives: the files sit at the root of the zip instead of inside a `LiftOff/` folder.
  Extract one into `mods/LiftOff/` (or `plugins/LiftOff/` on a LeviLamina 26.51 server), not into `mods/`.

### Known issues

These affect Minecraft 1.26.60 only, where LeviLamina 26.60 no longer offers some of the game functions LiftOff
used; Minecraft 1.26.51 behaves as in 0.1.1.

- With the client mod, a carried mob is not drawn in the carrier's arms, in first or in third person. Carried
  blocks and items are drawn as before, and players without the client mod still see the server's stand-in.
- In a single-player world, the carrying arm pose may not play, because the client mod can no longer load its arm
  animations into the game by itself. On a server they come with the server's resource pack.
- While you carry something, another mod that looks for a free inventory slot by itself may be offered the locked
  hotbar slot. Items the game adds to your inventory still never go there.
- Stacking a carried mob onto an untamed horse tames the horse through a different game function than on 1.26.51,
  which may also count as the carrier taming it (statistics, achievements, taming effects). The horse is still left
  without an owner. This has not been checked in game yet.

## [0.1.1] - 2026-11-01

### Changed

- The repository moved to [MiracleForest/LiftOff](https://github.com/MiracleForest/LiftOff).
- The lip package is now `github.com/MiracleForest/LiftOff` (`#client` for the client). With lip 0.36.0 or later,
  `lip update` moves an existing install to the new path. With an older lip, run
  `lip uninstall github.com/LiteLDev/LiftOff[#client]` and then `lip install github.com/MiracleForest/LiftOff[#client]`.
  Either way the configuration (`plugins/LiftOff/config/` on a server, `mods/LiftOff/config/` on a client) is kept.
  Version 0.1.0 is still published under the old path; installing it by the new path needs lip 0.35.0 or later.

## [0.1.0] - 2026-10-29

First release: pick up blocks and mobs and carry them in your arms. A LeviLamina mod for dedicated servers and the client.

### Added

- Pick up blocks with their contents (chests, furnaces, ...) and put them down with their facing recomputed.
- Pick up mobs, put them down and stack them; carry players.
- Slowness by weight, and the restrictions while carrying: locked hotbar, no item use, no containers, no breaking
  or attacking; `dropCarriedWhenHit`.
- Carries survive death (`keepInventory`), logout and dimension changes.
- Commands `/liftoff debug`, `clear [targets]`, `place [targets]`, `reload`.
- Configuration (`config/liftoff.json`, `config/liftoff_client.json`) with default black/whitelists,
  scripts (`config/scripts/`) and custom pickup conditions.
- The Carry key (default Left Shift) and the client-side restrictions.
- First-person and third-person rendering of the carried block or mob, model overrides, `facePlayer`,
  `rotateEntitiesSideways`, and the carrying arm pose (`renderArms`, per viewer).
- Client settings apply live while playing on a dedicated server.
- Players without the client mod see the arm pose and a stand-in of the carried block or mob.
- English and Simplified Chinese.

[Unreleased]: https://github.com/MiracleForest/LiftOff/compare/v0.2.0-beta.1...HEAD
[0.2.0-beta.1]: https://github.com/MiracleForest/LiftOff/compare/v0.1.1...v0.2.0-beta.1
[0.1.1]: https://github.com/MiracleForest/LiftOff/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/MiracleForest/LiftOff/releases/tag/v0.1.0
