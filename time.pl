before(am(_, _), pm(_, _)).
before(am(H1, M1),  am(H2, M2))  :- H1 < H2.
before(am(H, M1),   am(H, M2))   :- M1 < M2.
before(pm(H1, M1),  pm(H2, M2))  :- H1 < H2.
before(pm(H, M1),   pm(H, M2))   :- M1 < M2.
