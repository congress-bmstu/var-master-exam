#import "notes.typ": *
#import "@preview/mannot:0.3.1": *
#let red(x) = text(fill: rgb("ff0000"))[#x]
#let blue(x) = text(fill: rgb("0000ff"))[#x]
#let green(x) = text(fill: rgb("00aa00"))[#x]
#let highlight(x) = text(fill: rgb("ff00ff").darken(20%))[*#x*]

== Применение метода Ритца

#example[
  $
    cases(
      y''-y+x=0,
      y(0)=y(1)=0
    )
  $
  Преобразуем к виду $A u = f$:
  $ -y''+y=x $
  Видно, что оператор $A$ является оператором Штурма-Лиувилля $A y = -(p u')' + r u$ при $p(x)=1$ и $r(x)=1$. Оператор Штурма-Лиувилля в свою очередь является положительно определенным, если $p(x)>=p_0>0$ и $r(x)>=0$. В данном случае это условие выполняется, следовательно $A$ --- положительно определенный.

  Найдем решение $u_0 = limits(sum)_(k=1)^n a_k phi_k$ для $n=3$, за основу взяв базис $phi_k = sin((pi n x)/l)$, где $l$ --- длина рассматриваемого отрезка (в нашем случае $l=1$ для отрезка $[0,1]$), таким образом базис имеет вид
  $
    phi_k = sin(pi n x).
  $
  Для $n=3$ получим:
  $
    phi_1 = sin(pi x), quad phi_2 = sin(2 pi x), quad phi_3 = sin(3 pi x)
  $

  Составим систему уравнений Ритца:
  $
    cases(
      &(phi_red(1), phi_1)_A a_1 &+(phi_red(1), phi_2)_A a_2 &+(phi_red(1), phi_3)_A a_3 &-(f, phi_red(1)) &=0,
      &(phi_green(2), phi_1)_A a_1 &+(phi_green(2), phi_2)_A a_2 &+(phi_green(2), phi_3)_A a_3 &-(f, phi_green(2)) &=0,
      &(phi_blue(3), phi_1)_A a_1 &+(phi_blue(3), phi_2)_A a_2 &+(phi_blue(3), phi_3)_A a_3 &-(f, phi_blue(3)) &=0,
    )
  $
  Перенесем члены вида $(f, phi_((dot)))$ в правую часть:
  // #let mr(x, ..args) = markhl(outset: 0.1em, radius: 25%, color: rgb("f00"), ..args)[#x]
  // #let mg(x, ..args) = markhl(outset: 0.1em, radius: 25%, color: rgb("0f0").darken(20%), ..args)[#x]
  // #let mb(x, ..args) = markhl(outset: 0.1em, radius: 25%, color: rgb("00f"), ..args)[#x]
  // #let mp(x, ..args) = markhl(outset: 0.1em, radius: 25%, color: rgb("f0f"), ..args)[#x]
  #let mr(x, ..args) = x
  #let mg(x, ..args) = x
  #let mb(x, ..args) = x
  #let mp(x, ..args) = x
  $
    cases(gap: #0.45em,
      &mr((phi_1, phi_1))_A a_1 &+mg((phi_1, phi_2))_A a_2 &+mb((phi_1, phi_3))_A a_3 &=(f, phi_1)\,,
      &mg((phi_2, phi_1))_A a_1 &+mr((phi_2, phi_2))_A a_2 &+mp((phi_2, phi_3))_A a_3 &=(f, phi_2)\,,
      &mb((phi_3, phi_1))_A a_1 &+mp((phi_3, phi_2))_A a_2 &+mr((phi_3, phi_3))_A a_3 &=(f, phi_3)\,
    )
  $
  // С учетом введенного скалярного произведения $(u,v)=integral_0^1 u v "d"x$ можно заметить, что:
  // - $mr(#hide[#rect(width: 0.85cm, height: 0.5cm)])$ --- нулевые, так как базис ортогональный;
  // - $mg(#hide[#rect(width: 0.85cm, height: 0.5cm)])$#h(-8pt) $mb(#hide[#rect(width: 0.85cm, height: 0.5cm)])$#h(-8pt) $mp(#hide[#rect(width: 0.85cm, height: 0.5cm)])$ --- равны в силу коммутативности скалярного произведения .
  В силу диагональности матрицы Грама необходимо найти только $(phi_1, phi_1)_A, (phi_2, phi_2)_A, (phi_3, phi_3)_A$ (остальные элементы нулевые), а также правую часть.

  Для начала найдем $A phi_1, A phi_2, A phi_3$:
  $
    &A phi_1 = &A sin(pi x) = &-sin''(&pi x) &+ sin(&pi x) &=& (pi^2+1)sin(pi x)\
    &A phi_2 = &A sin(pi x) = &-sin''(2&pi x) &+ sin(2&pi x) &=& (4pi^2+1)sin(pi x)\
    &A phi_3 = &A sin(pi x) = &-sin''(3&pi x) &+ sin(3&pi x) &=& (9pi^2+1)sin(pi x)\
  $
  Теперь вычислим диагональные элементы матрицы Грама:
  #let int(x) = $limits(integral)_0^1 #x upright(d)x$
  $
    &(A phi_1, phi_1) = int((pi^2+1)sin^2(pi x)) &&= (pi^2+1)/2\
    &(A phi_2, phi_2) = int((4pi^2+1)sin^2(2 pi x)) &&= (4pi^2 + 1)/2\
    &(A phi_3, phi_3) = int((9pi^2+1)sin^2(3 pi x)) &&= (9pi^2+1)/2
  $
  Вычислим выражения в правой части:
  $
    &(f, phi_1) = int(x sin(& &pi x)) &=& 1/pi\
    &(f, phi_2) = int(x sin(&2&pi x)) &=& -1/(2pi)\
    &(f, phi_2) = int(x sin(&3&pi x)) &=& 1/(3pi)
  $
  Таким образом СЛАУ принимает вид:
  $
    cases(
      &(pi^2+1)/2 &a_1 = 1/pi,
      &(4pi^2 + 1)/2 &a_2 = -1/(2pi),
      &(9pi^2+1)/2 &a_3 = 1/(3pi)
    ) =>
    markhl(outset: #.25em, radius: #10%, color: #yellow.lighten(20%), cases(
      a_1 = 2/(pi(pi^2+1)),
      a_2 = -1/(pi(4pi^2+1)),
      a_3 = 2/(3pi(9pi^2+1))
    ))
  $
]

#example[
  Рассмотрим модельную задачу Дирихле для уравнения Пуассона на отрезке $[0,1]$:
  $
      cases(
        -v''(x) = 1,
        v(0) = v(1) = 0
      )
  $
  Соответствующий функционал энергии:
  $
    cal(J)[v] = integral_(0)^(1) [1/2 (v^'(x))^2 - v(x)] d x quad (v in H^1_0(0,1))
  $
  Выберем пробные функции, удовлетворяющие граничным условиям:
  $
    phi_k (x) = x(1-x)x^(k-1) = x^k (1-x), quad k=1,2
  $
  Для $n=2$ ищем приближение $v_2 = a_1 phi_1 + a_2 phi_2$.

  Вычислим элементы матрицы Грама и вектора правой части:
  $
    &(phi_1, phi_1)_A = integral_0^1 phi_1^' (x)^2 d x = red(1/3), &&(phi_1, phi_2)_A = integral_0^1 phi_1^' (x)phi_2^' (x) d x = blue(1/12), \
    &(phi_2, phi_1)_A = blue(1/12), &&(phi_2, phi_2)_A = integral_0^1 phi_2^' (x)^2 d x = red(1/30), \
    &(f, phi_1) = integral_0^1 1dot phi_1(x) d x = green(1/12), && (f, phi_2) = integral_0^1 1dot phi_2(x) d x = green(1/60).\
  $
  Система Ритца для $n=2$ принимает вид:
  $
    cases(
      red(1/3) a_1 + blue(1/12) a_2 = green(1/6),
      blue(1/12) a_1 + red(1/30) a_2 = green(1/30)
    )
  $
  Решение системы:
  $
    a_1 = 1/4, quad a_2 = -1/2
  $
  Приближенное решение:
  $
    v_2(x) = 1/4 x(1-x) - 1/2 x^2(1-x) = x(1-x)(1/4 - x/2)
  $
]

#theorem(title: "Сходимость метода")[
  Для выбранного базиса ${phi_k}_(k=1)^n$ последовательность $v_n$ сходится к точному решению в норме $||dot||_(H^1_0)$:
  $
    lim_(n->infinity) ||v - v_n||_(H^1_0) = 0,
  $
  где $||u||_(H^1_0)^2 = integral_0^1 |u^' (x)|^2 d x$.
]

#remark[
  Для ортонормированного базиса $psi_k(x) = sqrt(sin(k pi x))$ коэффициенты вычисляются напрямую:
  $
    b_k = (f, psi_k) = integral_0^1 sqrt(sin(k pi x)) d x = (2sqrt(2))/(k pi)[1 - (-1)^k],
  $
  что демонстрирует преимущество ортогональных базисов (диагональная система).
]
