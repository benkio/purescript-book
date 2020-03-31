{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "book-chapter5"
, dependencies =
  [ "console"
  , "effect"
  , "foldable-traversable"
  , "globals"
  , "lists"
  , "math"
  , "maybe"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
