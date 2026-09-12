import Lake
open Lake DSL

package «gauss» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.7.0"

@[default_target]
lean_lib «Gauss» where
  srcDir := "."
