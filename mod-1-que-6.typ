#import "notes.typ": *

== Функционал, линейный функционал, ограниченный функционал. Теорема Рисса (с доказательством).

#definition[
  Отображение $cal(F) : D_cal(F) -> RR$, $D_cal(F) subset H$ называется
  *функционалом в пространстве $H$*.
]

#definition[
  Функционал $cal(F)$ называется *линейным*, если 
  + $(forall u, v in D_cal(F)) cal(F) (u+v) = cal(F) u + cal(F) v$;
  + $(forall u in D_cal(F)) (forall alpha in RR) cal(F) (alpha u) = alpha dot cal(F) u$
]

#definition[
  Пусть $cal(F)$ -- функционал в гильбертовом пространстве $H$.
  Он называется *ограниченным* в $D_cal(F)$, если 
  $
  (exists k >= 0, k in RR) (forall u in D_cal(F)) space norm( cal(F) u ) <= k dot norm(u)
  $

  Наименьшее из таких чисел $k$ (если оно существует) называется *нормой функционала $cal(F)$*
  $norm( cal(F) )$:
  $
  norm(cal(F) u) <= norm(cal(F)) dot norm(u).
  $
]

#theorem(title: "теорема Рисса")[
  Пусть $H$  -- гильбертово пространство. Всякий линейный ограниченный функционал $cal(F)$ в
  пространстве $H$ может быть единственным образом представлен в виде $ cal(F) u = (u, v), $
  #par(first-line-indent: 0pt)[
    для некоторого элемента $v in H$, однозначно определяемого функционалом $cal(F)$.
  ]

  Тогда $norm(cal(F)) = norm(v)$.

  #proof[
    + Если функционал такой, что $(forall u in H) space cal(F) u = 0$,
      то в качестве $v$ подходит $0$;
    + Если $cal(F) equiv.not 0$, то $(exists x eq.not 0, x in H) space cal(F) x eq.not 0$.

      Рассмотрим множество $L = { z in H | cal(F) z = 0 }$ -- ядро функционала $cal(F)$
      (подпространство в $H$).
      Обозначим ортогональное дополнение к $L$ как $K$:
      $
      K = L^perp = { z in H | (forall w in L) (z, w) = 0 } <= H.
      $
      Тогда $H = L plus.o K.$

      Т.к. $cal(F) equiv.not 0$, то $L eq.not H$. Тогда $K eq.not {0}$ $=>$ $(exists x in K, x eq.not 0) space cal(F) x = alpha eq.not 0$.

      Возьём $y = x / alpha => y in K, cal(F) y = cal(F) (x/alpha) = 1/alpha cal(F) x = 1$.

      Возьём $u in H$ -- произвольный элемент: $cal(F) u = beta$.
      Запишем $u = underbrace((u - beta y), in L) + underbrace(beta y, in K)$ (это вроде как доказывает, что прямая суммая $L$ и $K$ совпадает с $H$). Почему $u-beta y in L$:
      $
      cal(F) (u - beta y) = cal(F) u - beta cal(F) y = beta - beta dot 1 = 0.
      $

      Тогда
      $
      (u, y) = (u - beta y + beta y, y) = (u - beta y, y) + beta (y, y) = 0 + beta norm(y)^2 = beta norm(y)^2 = cal(F) u dot norm(y)^2 \
      => cal(F) u = 1 / norm(y)^2 dot (u, y).
      $

    *Единственность.* Пусть $v'$ -- другой элемент такой, что $ cal(F) u = (u, v') $.
    $
    (forall u in H) \
    cases(
      cal(F) u = (u, v')\,,
      cal(F) u = (u, v),
    ) =>
    0 = (u, v) - (u, v') => (u, v-v') = 0
    $
    тогда рассмотрим $u = v - v'$:
    $
    norm(v - v')^2 = 0 <=> v - v' = 0 <=> v = v'.
    $

    *Норма.* $abs(cal(F) u) = abs( (u, v) ) <= norm(u) dot norm(v)$.
    Тогда $norm(F) <= norm(v)$.

    Докажем, что меньше быть не может: предположим, что может: $norm(cal(F)) < norm(v)$ (домножим на $norm(v)$: $norm(F) dot norm(v) < norm(v)^2$),
    тогда $cal(F) v = (v, v) = norm(v)^2$. Тогда
    $ norm(v)^2= abs(cal(F) v) <= norm(cal(F)) dot norm(v) < norm(v)^2 $ -- противоречие.


    #text(size: 25pt)[Ч. Т. Д.]
  ]
]
