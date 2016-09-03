Item Structure
--------------


### `id`

The name of the item.
Yes, this is redundant, it's the name of the file too.

### `description`

The in-game description of the item.

### `equipment`

If present, the item can be equipped.
(There needs to be a spritesheet for it in `p3600/data/spritesheet/r/*/equip`.)

#### `equipment.defense`

If present, the amount of additional defense the item provides while equipped.

Defaults to `0`.
Can be negative.

#### `equipment.coverage_skin`

If present, how much skin the item covers.
(Even if it's transparent.)

Defaults to `0.0`, for something like a bracelet or an earring.

A double in the range `0..1`.
`0` would mean stark naked, while `1` would be a burqa with gloves,
socks, a ski mask, and sunglasses.

#### `equipment.coverage_light`

If present, how much skin can be seen.

Defaults to `0.0`, for something like a bracelet or an earring.

A double in the range `0..1`.

 - `0` is naked (or invisible clothes (like glass armor, for example))
 - a fish net (a literal fish net, see "The Peasant's Wise Daughter"
   or your culture's equivalent (there are tons of versions)) would be `0.1`
 - a two-piece bikini would be `0.1` (`0.05` for the bra or thong seperately)
 - a t-shirt would be `0.3` (lower half isn't covered)
 - shorts would alse be `0.3` (short shorts, `0.2`)
 - a long-sleeved shirt would be `0.49` (hands aren't covered)
 - jeans would be `0.49` (feet aren't covered)
 - a floor-length skirt (like the bottom half of a wedding dress) would be `0.5`
 - `1` would be a burqa with gloves, socks, a ski mask, and sunglasses.

The difference between `equipment.coverage_skin` and `equipment.coverage_light`
can be explained like so:

If you wore a huge sheet of plastic wrap as clothes (kinky),
it would cover a lot of skin, but you could see everything; so
`equipment.coverage_skin` would be 1.0 (or 0.9 if you left air holes),
while `equipment.coverage_light` would be 0.001 (plastic absorbs a tiny
amount of light).

#### `equipment.freedom`

If present, how easy it is to move while wearing the item.
If the item is bulky and/or not aerodynamic, then it would be reflected here.

Defaults to `1.0`, for something like a bracelet or an earring.

A double in the range `0..1`.

 - `1.0` is naked
 - `0.8` and `0.9` are for things that don't cover any joints (`0.9` is perfect)
 - `0.7` is light materials
 - `0.1` is a straightjacket (you can still squirm)

#### `equipment.weight`

How much it weighs, in kilograms.

### `on_hit(hit)`

Called when the entity wearing the item is hit by something.

### `on_equip(entity)`

Called when an entity equips the item.

### `on_unequip(entity)`

Called when an entity removes the item.
