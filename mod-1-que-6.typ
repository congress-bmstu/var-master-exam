#import "notes.typ": *

== Функционал, линейный функционал, ограниченный функционал. Теорема Рисса (с доказательством).

#definition[
  Отображение $cal(F) : D_cal(F) -> RR$, $D_cal(F) subset H$ называется функционалом в пространстве
  $H$.
]

#remark[На функционалы переносятся определения: линейности, непрерывности, ограниченности.]

#example[
  $v in H$. Функционал $cal(F) u = (u, v)$. Такой функционал линейный и ограниченный.
  Его норма $norm(cal(F)) = norm(v)$.

  Линейность следует из определения скалярного произведения.

  Ограниченность следует из неравенства Коши-Буняковского: $abs(cal(F) u) = |(u, v)| <= norm(u) dot norm(v)$.
]

#theorem(title: "теорема Рисса")[
  Пусть $H$  -- гильбертово пространство. Всякий линейный ограниченный функционал $cal(F)$ в
  пространстве $H$ может быть единственным образом представлен в виде $ cal(F) u = (u, v), $
  для некоторого элемента $v in H$, однозначно определяемого функционалом $cal(F)$.

  Тогда $norm(cal(F)) = norm(v)$.

  #proof[
    + Если функционал $(forall u in H) cal(F) u = 0$, то в качестве $v$ подходит $0$;
    + Если $cal(F) equiv.not 0$, то $(exists x eq.not 0, x in H) space cal(F) x eq.not 0$.

      Рассмотрим множество $L = { z in H | cal(F) z = 0 }$ -- ядро функционала $cal(F)$
      (подпространство в $H$). Обозначим $K = L^perp = { z in H | (forall w in L) (z, w) = 0 } <= H$. Тогда $H = L plus.circle K$.

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
