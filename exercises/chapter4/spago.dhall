{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "book-chapter4"
, dependencies = [ "arrays", "console", "effect", "psci-support", "strings" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
