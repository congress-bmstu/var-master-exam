#import "notes.typ" : *
#import "@preview/mannot:0.3.1": markrect

== Метод Ритца (с обоснованием).

Пусть $A$ --- положительно определенный оператор в сепарабельном гильбертовом пространстве $H$. Пусть $f in H$. Подмножество $D_A in H$ --- полно в $H$. $H_A$ --- пространство, построенное ранее (см. @orthonorm-sequence-method). Пусть $phi_1, phi_2, ...$ --- базис в $H_A$.

Рассмотрим операторное уравнение $A u = f$.

Рассмотрим функционал
$
  cal(F)_u = (u,u)_A - 2(f,u); quad u in H_A
$
Доказано, что функционал $cal(F)$ достигает минимума в $H_A$ на элементе $u_0$, который является обобщенным решением уравнения $A u = f$.

Выберем $n in NN$, будем искать аппроксимацию $u_0$ в виде $u_n = limits(sum)_(k=1)^n a_k phi_k$. Коэффициенты $a_k$ определяются из условий
#let clap(it, x: 0pt, top: 0pt, bottom: 0pt) = context {
  let w = measure(it).width
  pad(x: -w/2 + x, top: top+0.5em, bottom: bottom, scale(75%)[#it])
}
$
  cal(F)u_n = limits(min)_#clap($v_n=limits(sum)_(k=1)^n delta_k phi_k$) v_k
$

#let phi1(x) = text(fill: rgb("ff0000"))[*#x*]
#let phi2(x) = text(fill: rgb("0000ff"))[*#x*]
#let phin(x) = text(fill: rgb("00ff00").darken(20%))[*#x*]
$
  cal(F)v_n = &(b_1 phi_1 + ... + b_n phi_n, b_1 phi_1 + ... + b_n phi_n)_A - 2(f, b_1 phi_1 + ... + b_n phi_n) &= \
  = &b_phi1(1)^2(phi_phi1(1), phi_1)_A + b_1 b_2 (phi_phi1(1), phi_2)_A + ... + b_1 b_n (phi_phi1(1), phi_n)_A + \
  &+b_2 b_1 (phi_phi2(2), phi_1)_A + b_phi2(2)^2 (phi_phi2(2), phi_2)_A + ... + b_2 b_n (phi_phi2(2), phi_n)_A + \
  &dots.v& \
  &+b_n b_1 (phi_phin(n), phi_1)_A + b_n b_2 (phi_phin(n), phi_2)_A + ... + b_phin(n)^2(phi_phin(n), phi_n)_A - \
  &-2b_1 (f_1, phi_1) - 2b_2 (f, phi_2) - ... - 2b_n (f, phi_N)
$
Заметим, что $(phi_1, phi_2)_A=(phi_2, phi_1)_A, ...$

Заметим, что $cal(F)v_n$ --- кватратичная функция от $b_1, ..., b_n$. Тогда
$
  cal(F) v_n = (phi_1, phi_1)_A b_1^2 + 2(phi_1, phi_2)_A b_1 b_2 + ... &+ (phi_n, phi_n)b_n^2 -\ &- 2(f,phi_1)b_1-2(f,phi_n)b_n
$

Необходимым условие существования минимума является равенство всех частных производных
#let highlight(x) = text(fill: rgb("ff0000"))[*#x*]
$
  lr((partial cal(F) v_n)/(partial b_highlight(1))|)_#move(dy: -0.0em, $\ _(b_1=a_1\ dots.v\ b_n=a_n)$)#h(-0.5em)=0,quad ...quad lr((partial cal(F) v_n)/(partial b_highlight(n))|)_#move(dy: -0.0em, $\ _(b_1=a_1\ dots.v\ b_n=a_n)$)#h(-0.5em)=0
$
#let highlight(x) = text(fill: rgb("ff00ff").darken(20%))[*#x*]
Тогда получаем систему
$
  cases(
    &2(phi_highlight(1), phi_1)_A a_1 &+2(phi_highlight(1), phi_2)_A a_2 &+... &+2(phi_highlight(1), phi_n)_A a_n &-2(f, phi_highlight(1)) &=0,
    &2(phi_highlight(2), phi_1)_A a_1 &+2(phi_highlight(2), phi_2)_A a_2 &+... &+2(phi_highlight(2), phi_n)_A a_n &-2(f, phi_highlight(2)) &=0,
    &dots.v&&&&,
    &2(phi_highlight(n), phi_1)_A a_1 &+2(phi_highlight(n), phi_2)_A a_2 &+... &+2(phi_highlight(n), phi_n)_A a_n &-2(f, phi_highlight(n)) &=0,
  )
$
Преобразуем
$
  cases(
    &2(phi_highlight(1), phi_1)_A a_1 &+2(phi_highlight(1), phi_2)_A a_2 &+... &+2(phi_highlight(1), phi_n)_A a_n &=2(f, phi_highlight(1)),
    &2(phi_highlight(2), phi_1)_A a_1 &+2(phi_highlight(2), phi_2)_A a_2 &+... &+2(phi_highlight(2), phi_n)_A a_n &=2(f, phi_highlight(2)),
    &dots.v&&&,
    &2(phi_highlight(n), phi_1)_A a_1 &+2(phi_highlight(n), phi_2)_A a_2 &+... &+2(phi_highlight(n), phi_n)_A a_n &=2(f, phi_highlight(n)),
  ) stretch(-, size: #150%) #scale(80%)[посл-ть\ Ритца]
$<slau-ritca>

Получили систему уравнений $(n times n)$. Основная матрица --- матрица Грама. Определитель матрицы Грама $>=0$.

$u=0 <=>$ система линйено зависима.

Таким образом определитель $>0$. Если определитель $!=0=>exists!$ решение.

Полученное решение --- строгий минимум.

#theorem(title: "Метод Ритца")[
  $A$ --- положительно определенный оператор в $D_A$, $D_A$ --- полно в $H_A$. Тогда последоватльность Ритца ${u: u_n = limits(sum)_(k=1)^n a_k phi_k}_n$ с коэффициентами $a_1, a_2, ...$, определямыми из системы @slau-ritca, сходится в $H_A$, а значит и в $H$, к обобщенному решению $u_0$ уравнения $A u = f$.

  #proof[
    Предположим, что в $H_A$ к базису $phi_1, phi_2, ...$ применимы процессы ортогонализации и нормирования и получен базис $tilde(phi)_1, tilde(phi)_2, ...$ --- ортонормированный (матрица Грама будет диагональной кстати).
    $
      &markrect(fill: #yellow.lighten(70%), radius: #25%, outset: #3pt, tilde(phi)_1 = phi_1/(||phi_1||_A)) \
      &hat(phi)_2 = phi_1 + d_22 phi_2, quad hat(phi)_2 perp tilde(phi)_1 \
      &0 = (tilde(phi)_1, hat(phi)_2)_A = (tilde(phi)_1, tilde(phi)_1)_A + d_22(tilde(phi)_1, phi_2), quad d_22=- (tilde(phi)_1, phi_2)_A/(tilde(phi)_1, tilde(phi)_1)_A!=0 \
      &markrect(fill: #yellow.lighten(70%), radius: #25%, outset: #3pt, tilde(phi)_2 = hat(phi)_2/(||hat(phi)_2||_A))
    $
    Наоборот тоже можно выразить:
    $
      tilde(phi)_1 = phi_1/(||phi_1||_A) => phi_1 = ||phi_1||_A dot tilde(phi)_1\
      phi_2=c_1 tilde(phi)_1 + c_2 tilde(phi)_2
    $
    То есть системы векторов эквивалентны (и коэффициенты $!=0$).

    #text(fill: black.lighten(55%))[
      Системы векторов называются _эквивалентными_, если каждый вектор одной системы является линейной комбинацией векторов другой системы.
    ]
  ]
]

#remark[
  Если $phi_1, phi_2, ...$ --- ортонормированная система, то система @slau-ritca принимает вид:
  $ a_1 = (f, phi_1), a_2 = (f, phi_2), ..., a_n = (f, phi_n) $
  $ u_n = limits(sum)_(k=1)^n (f, phi_k) phi_k $
]

