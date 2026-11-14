# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-11-14

First release: pick up chests, blocks and mobs and carry them in your arms. A LeviLamina mod for Minecraft Bedrock
Edition on dedicated servers and in single-player worlds.

### Added

- Pick up blocks with their contents (chests, furnaces, ...) and put them down with their facing recomputed.
- Pick up mobs, put them down and stack them; carry players.
- Slowness by weight, and the restrictions while carrying: locked hotbar, no item use, no containers, no breaking
  or attacking; optionally drop the load when hit (`dropCarriedWhenHit`).
- Carries survive death (`keepInventory`), logout and dimension changes.
- Commands `/liftoff debug`, `clear [targets]`, `place [targets]`, `reload` and `selftest`.
- Configuration (`config/mod.json`, `config/liftoff.json`, `config/liftoff_client.json`) with default
  black/whitelists, scripts (`config/scripts/`) and custom pickup conditions.
- The Carry key (default Left Shift) and the client-side restrictions.
- First-person and third-person rendering of the carried block or mob, model overrides, `facePlayer`,
  `rotateEntitiesSideways`, and the carrying arm pose (`renderArms`, per viewer).
- Client settings apply live while playing on a dedicated server.
- Players without the client mod see the arm pose and a stand-in of the carried block or mob.
- English and Simplified Chinese.
- Support for Minecraft 1.26.60 with LeviLamina 26.60.x and Minecraft 1.26.51 with LeviLamina 26.51.x, each with a
  dedicated-server and a client build: `liftoff-server-win-x64-ll26.60.zip`, `liftoff-client-win-x64-ll26.60.zip`,
  `liftoff-server-win-x64-ll26.51.zip` and `liftoff-client-win-x64-ll26.51.zip`.
- Installation with [lip](https://github.com/LiteLDev/lip) 0.40.0 or later, or from LeviLauncher: the variants
  `26_60` (also the default) and `26_51`.

### Known issues

These affect Minecraft 1.26.60 only, where LeviLamina 26.60 does not offer some of the game functions LiftOff uses.

- With the client mod, a carried mob is not drawn in the carrier's arms, in first or in third person. Carried
  blocks and items are drawn, and players without the client mod still see the server's stand-in.
- In a single-player world, the carrying arm pose may not play, because the client mod cannot load its arm
  animations into the game by itself. On a server they come with the server's resource pack.
- While you carry something, another mod that looks for a free inventory slot by itself may be offered the locked
  hotbar slot. Items the game adds to your inventory never go there.
- Stacking a carried mob onto an untamed horse may also count as the carrier taming it (statistics, achievements,
  taming effects). The horse is still left without an owner.

[Unreleased]: https://github.com/MiracleForest/LiftOff/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/MiracleForest/LiftOff/releases/tag/v0.1.0
