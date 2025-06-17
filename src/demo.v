From mathcomp Require Import all_ssreflect.

Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

Module Graph.
Section Defs.
Variable V : finType.
Variable E : rel V.

Inductive path x : seq V -> V -> Prop :=
| p_nil  : path x [::] x
| p_cons y z p of E x y & path y p z : path x (y :: p) z.

Definition connected :=
  forall x y, x != y -> exists p, path x p y.
End Defs.
End Graph.

Lemma demo_nat : 2.+2 = 4. Proof. by []. Qed.
