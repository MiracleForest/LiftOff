# The carry spine (U0): config, lists, data, store (incl. world DB), slowness, capture/restore of
# chests and entities, forced placement and the protocol, on a real BDS.
$r = Invoke-SelfTest 'carry.*'
if ($r.Fail -gt 0) { throw "$($r.Fail) carry selftest(s) failed" }
if ($r.Pass -lt 12) { throw "expected at least 12 carry selftests to pass, got $($r.Pass)" }
# The config files are written with the defaults.
$cfg = Join-Path $script:SlotDir 'plugins\LiftOff\config\liftoff.json'
if (-not (Test-Path $cfg)) { throw "missing $cfg" }
$json = Get-Content $cfg -Raw | ConvertFrom-Json
if ($json.settings.maxDistance -ne 2.5) { throw "liftoff.json: maxDistance is $($json.settings.maxDistance)" }
if (-not ($json.blacklist.forbiddenTiles -contains 'minecraft:bed')) { throw 'liftoff.json: minecraft:bed is not blacklisted' }
