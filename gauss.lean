-- Define a simple recursive function for the sum of 0 to n
def sum_to : Nat → Nat
  | 0     => 0
  | n + 1 => (n + 1) + sum_to n

-- Proving the identity: 2 * sum_to n = n * (n + 1)
-- (We use multiplication by 2 to avoid dealing with fraction/division logic in Lean)
theorem gauss_sum (n : Nat) : 2 * sum_to n = n * (n + 1) := by
  induction n with
  | zero => 
      -- Base case: n = 0
      rfl
  | succ n ih => 
      -- Inductive step: assume it works for n, prove for n + 1
      -- We unfold the function definition and rearrange the math using arithmetic tactics
      simp [sum_to]
      linarith
#print gauss_sum