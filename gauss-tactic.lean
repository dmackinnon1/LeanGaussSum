import Mathlib.Tactic.Linarith

-- Define a simple recursive function for the sum of 0 to n
def sum_to : Nat → Nat
  | 0     => 0
  | n + 1 => (n + 1) + sum_to n

-- Proving the identity: 2 * sum_to n = n * (n + 1)
theorem gauss_sum (n : Nat) : 2 * sum_to n = n * (n + 1) := by
  induction n with
  | zero => 
      rfl
  | succ n ih => 
      simp [sum_to]
      linarith

#print gauss_sum
