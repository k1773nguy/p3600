return {
  [0] = {
    singular  = 'human',
    plural    = 'humans',
    adjective = 'human',
    sexes = {
      -- Pretty sure every human is born with genitalia.
      [1] = true,
      [2] = true,
      -- A hermaphrodite looks like either a man or a woman until they take
      -- their pants off, and this game doesn't let you take your pants off
      -- yet, so...
    },

    playable  = true,
    description = [[
A human.
'nuff said.

Has the most potential, but starts off weak.]],
  },

  [1] = {
    singular  = 'dwarf',
    plural    = 'dwarves',
    adjective = 'dwarven',
    sexes = {
      [1] = true,
      [2] = true, -- The ladies still have beards, don't worry.
    },

    playable  = true,
    description = [[
 A short, sturdy creature fond of drink and
 industry.  -- The First Toad

Short, extremely resilient, and a little crazy.
Dwarves are some of the world's greatest
artisans, smiths, and engineers, but they have
a tendency to start wars and set forests on
fire.

Slow, hairy, and usually drunk.]],
  },

  [2] = {
    singular  = 'elf',
    plural    = 'elves',
    adjective = 'elven',
    sexes = {
      [1] = true,
      [2] = true,
    },

    playable  = true,
    description = [[
The elves are immortal beings that live in
forests and do elf things like growing trees
and hating dwarves.

Tall, fast, weak, fragile.]],
  },

  [3] = {
    singular  = 'kobold',
    plural    = 'kobolds',
    adjective = 'small',
    sexes = { -- I think..?
      [1] = true,
      [2] = true,
    },

    playable  = true, -- joke
    description = [[
Annoying vermin that steal stuff.
They have no language, and nobody feels
like teaching them to speak anyway.

Tiny, cowardly, stealthy kleptomaniacs.]],
  },

  [4] = {
    singular  = 'bragasian',
    plural    = 'bragasians',
    adjective = 'bragasian',
    sexes = {
      [1] = true,
      [2] = true,
    },

    playable  = true,
    description = [[
Bragasians are actually just humans.
They usually posess some form of psychic
abilities, which leads to most of the other
races fearing them. Live far away from other
races, but are accepting of outsiders. (Mostly
because they know if you are planning something
bad.)

Politicians hate them for some reason.]],
  },

  [5] = {
    singular  = 'fairy',
    plural    = 'fairies',
    adjective = 'fey',
    sexes = {
      [1] = true,
      [2] = true,
    },

    playable  = true,
    description = [[
Tiny winged humanoids with a natural affinity
for magic. They are easily defeated by a stiff
breeze, but their size allows them to go
unnoticed most of the time.

4 inches tall, can fly, can glow.

They are capable of increasing their size
to about 5 feet, but this form takes a lot of
energy and can not be maintained for long.

They are infamous pranksters.]],
  },

  [6] = { -- fairy, alternate form
    singular  = 'faerie',
    plural    = 'faeries',
    adjective = 'fey',
    sexes = {
      [1] = true,
      [2] = true,
    },
  },

  [7] = {
    singular  = 'mamkute',
    plural    = 'mamkutes',
    adjective = 'draconic',
    sexes = {
      [1] = true,
      [2] = true,
    },

    playable  = true,
    description = [[
Long ago, dragons ruled the skies.
During a great event, all dragons slowly began
going "feral". In order to retain their sanity,
many dragons sealed their forms away and took
on a human appearance.

Extremely long lifespan, strong, can use magic.
Can temporarily turn into a dragon using special
stones.]],
  },

  [8] = { -- mamkute, alternate form
    singular  = 'dragon',
    plural    = 'dragons',
    adjective = 'draconic',
    sexes = {
      [1] = true,
      [2] = true,
    },
  },

  [9] = {
    singular  = 'kitsune',
    plural    = 'kitsunes',
    adjective = 'otherworldly',
    sexes = {
      [1] = true,
      [2] = true,
    },

    playable  = true,
    description = [[
A race of eldrich, fox-like humanoids.
They live for 900 years, and posess ancient
knowledge beyond mortal ken.
They gain another tail every 100 years, and
9-tailed kitsunes are exceptionally powerful;
they can even attain immortality.

Can turn into a fox.]],
  },

  [10] = { -- kitsune, alternate form
    singular  = 'fox',
    plural    = 'foxes',
    adjective = 'vulpine',
    sexes = {
      [1] = true,
      [2] = true,
    },
  },

  [11] = {
    singular  = 'doppelganger',
    plural    = 'doppelgangers',
    adjective = 'strange',
    sexes = { -- Or what they feel like being, anyway.
      [0] = true,
      [1] = true,
      [2] = true,
      [3] = true,
    },

    playable  = true,
    description = [[
Shapeshifters.

They can take the form of anything they touch.

They must concentrate to maintain a form, and
they all have unique forms that they revert
to when they are not shifted.

It is impossible to identify a shapeshifter
without seeing one transform, so many live
amongst the other races.

Like bragasians, they can pose a threat to
the powerful, so they are often prosecuted
if they are discovered.]],
  },

  [12] = {
    singular  = 'goblin',
    plural    = 'goblins',
    adjective = 'ugly',
    sexes = {
      [1] = true,
      [2] = true,
    },

    playable  = true,
    description = [[
A goblin is basically a green dwarf.
They are even stronger than dwarves, but
they lack the dwarves' dexterity.

Usually cruel by nature, very few are actually
peaceful. The few peaceful goblins are rather
"creative", and are good at tinkering with
things. A goblin tinkerer with dwarven technology
is a force to be reckoned with.]],
  },

  [13] = {
    singular  = 'incubus',
    plural    = 'incubi',
    adjective = 'demonic',
    sexes = {
      [1] = true,
    },

    playable  = true,
    description = [[
Long ago, the demons created a race of hellish
creatures that could survive in the light and
set them loose on the surface to sow pain and
suffering. This plan backfired, as when these
creatures looked upon the light, they fell in
love with the world.

While they still have demonic tendencies, they
are not inherently evil.

They are immune to most fire.

The incubus is the male variant.]],
  },

  [14] = {
    singular  = 'succubus',
    plural    = 'succubi',
    adjective = 'demonic',
    sexes = {
      [2] = true,
    },

    playable  = true,
    description = [[
Long ago, the demons created a race of hellish
creatures that could survive in the light and
set them loose on the surface to sow pain and
suffering. This plan backfired, as when these
creatures looked upon the light, they fell in
love with the world.

While they still have demonic tendencies, they
are not inherently evil.

They are immune to most fire.

The succubus is the female variant.]],
  },

  [15] = {
    singular  = 'omnibus',
    plural    = 'omnibi',
    adjective = 'demonic',
    sexes = {
      [3] = true,
    },

    playable  = true,
    description = [[
Long ago, the demons created a race of hellish
creatures that could survive in the light and
set them loose on the surface to sow pain and
suffering. This plan backfired, as when these
creatures looked upon the light, they fell in
love with the world.

While they still have demonic tendencies, they
are not inherently evil.

They are immune to most fire.

The omnibus is the *ahem* "special" variant.]],
  },

  [16] = {
    singular  = 'elemental',
    plural    = 'elementals',
    adjective = 'primordial',
    sexes = { -- They are formless, they can be whatever they want.
      [0] = true,
      [1] = true,
      [2] = true,
      [3] = true,
    },
  },

  [17] = {
    singular  = 'diety',
    plural    = 'dieties',
    adjective = 'powerful',
    sexes = {
      [0] = true,
      [1] = true,
      [2] = true,
      [3] = true,
    },
  },
}
