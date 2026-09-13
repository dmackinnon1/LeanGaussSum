-- Define a simple recursive function for the sum of 0 to n
def sum_to : Nat → Nat
  | 0 => 0
  | n + 1 => sum_to n + (n + 1)
  
-- Proving the identity: 2 * sum_to n = n * (n + 1)
theorem gauss_sum : ∀ (n : Nat), 2 * sum_to n = n * (n + 1)
  | 0 => rfl
  | n + 1 =>
    have ih : 2 * sum_to n = n * (n + 1) := gauss_sum n
    calc
      2 * sum_to (n + 1)
        = 2 * (sum_to n + (n + 1))   := rfl
      _ = 2 * sum_to n + 2 * (n + 1) := Nat.left_distrib 2 (sum_to n) (n + 1)
      _ = n * (n + 1) + 2 * (n + 1) := congrArg (· + 2 * (n + 1)) ih
      _ = (n + 2) * (n + 1)         := (Nat.add_mul n 2 (n + 1)).symm
      _ = (n + 1) * (n + 2)         := Nat.mul_comm (n + 2) (n + 1)
      _ = (n + 1) * ((n + 1) + 1)   := rfl