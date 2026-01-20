#import "notes.typ": *
#import "@preview/cetz:0.4.2"

== Метрические пространства. Замыкание множества, свойства операции замыкания (с доказательством). Множества, плотные в метрическом пространстве. Сепарабельность.

Метрические пространства $=>$ см. предыдущий вопрос.

Пусть $M$ --- метрическое пространство. $S subset M$.

#definition(title: "Замыкание множества")[
  Замыканием множества $S$ называется множество всех точек прикосновения множества $S$.

  Обозначение: $[S]$
]

#remark(title: "Свойства")[
  + $S subset [S]$
  + $[[S]] equiv[S]$
  + $S_1 subset S_2 => [S_1]=[S_2]$
  + $[S_1 union S_2] = [S_1] union [S_2]$
  #proof[
  #enum(
    [+ $x in S => x in U_epsilon (x) quad forall epsilon > 0 => x$ --- точка приконсовения $S => x in [S]$.],
    [
      #set enum(numbering: "a)")
      // чтобы не было переносов в строчной математике, то есть их надо вручную ставить
      // например $a => b$ - не будет перенесено
      // но $a$ $=>$ $b$ - будет перенесено
      // таким образом переносы контролируются вручную лучше
      // а это круто в ситуации когда горизонтального места не много
      #show math.equation.where(block: false): box
      Доказательство этого пункта проведем по очереди в обе стороны:
      #enum(numbering: "a)",
      [
      $[S] subset [[S]]$ следует из свойства 1
      ],[
      $[[S]] subset [S]$

      Пусть $x in [[S]] <=> x$ --- точка прикосновения $[S]$, тогда $forall epsilon > 0 exists y in [S]: y in [S]: y in U_epsilon (x)$, $y$ --- точка прикосновения $S$.

      Выберем $delta>0, exists z in S: z subset U_delta (y)$, выберем $delta$ такое, что $U_delta (y) subset U_delta (x)$. Тогда $z subset U_epsilon (x)$ $=>$ $x$ --- точка прикосновения для $S$ $=>$ $x in [S]$.

      Выбор $delta$: $1/2min(rho(x,y), epsilon - rho(x,y))$, тогда если $z in U_delta (x,y)$ $=>$ $rho(y,z)<delta$ $=>$ $rho(x,z) <= overbrace(rho(x,y), <epsilon) + overbrace(rho(y,z), <delta) < rho(x,y)+delta$, рассмотрим $rho(x,y)+delta$, получим:
      $
        rho(x,y) + delta = rho(x,y) + (min(rho(x,y), epsilon - rho(x,y)))/2 = \ =cases(delim: "[",
          1.5rho(x,y)\, rho(x,y)<epsilon - rho(x,y) => <= epsilon/2,
          (rho(x,y)+epsilon)/2 <= epsilon
        )
      $
      #figure(
      caption: [Пояснение к доказательству пункта 2],
      cetz.canvas({
        import cetz.draw: *
        circle((1,1), radius: 3, name: "eps")
        circle((0,0), radius: 1.2, name: "delta")

        circle("eps.center", radius: .04, fill: black)
        content("eps.center", [#h(1.75em)$X$])
        line((1,1), (3.12132, 3.12132), name: "epsradius")
        content("epsradius.centroid", [#h(1em)$epsilon$])

        circle("delta.center", radius: .04, fill: black)
        content("delta.center", [#h(0.7em)$y$])
        line((0,0), (0, 1.2), name: "epsradius")
        content("epsradius.centroid", [#h(0.75em)$delta$])

        circle((-0.5, -0.5), radius: .04, fill: black, name: "Z")
        content("Z", [#h(0.75em)$z$])
      }))
      ])
    ],
    [$S_1 subset S_2; x in [S_1] => x$ --- точка прикосновения $S_1 => x$ -- точка прикосновения $S_2 => x in [S_2]$],
    [
      Доказательство этого пункта проведем по очереди в обе стороны:
      #enum(numbering: "a)",[
        $[S_1] union [S_2] subset [S_1 union S_2]$. Пусть $x in [S_1] union [S_2]$, тогда:
        $
          cases(delim: "[",
            x in [S_1] => x - "т. прик." S_1\; space S_1 subset S_1 union S_2 => x in [S_1 union S_2],
            x in [S_2] => "аналогично..."
          )
        $
      ],
      [
        $[S_1 union S_2] subset [S_1] union [S_2]$. Пусть $x in [S_1 union S_2]: x$ --- точка прикосновения $S_1 union S_2$. Если $x in S_2 =>$ аналогично.
      ])

    ],
    )
  ]
]

#show figure: set block(breakable: false)
Пусть $M$ --- метрическое пространство, $A,B subset M$. Тогда в метрическом пространстве $M$ можно ввести следующие определения:
#definition(title: "Плотное множество")[
  Множество $A$ называется _плотным_ в $B$, если $[A] supset B$.
]
#definition(title: "Всюду плотное множество")[
  Множество $A$ называется _всюду плотным_ в $M$, если $[A] = B$.
]
#example[$QQ$ всюду плотно в $RR$.]

Гильбертново пространство см. @hilbert-space
#definition(title: "Сепарабельное гильбертово пространство")[
  Гильбертово пространство $H$ называется сепарабельным, если в нем существует счётное всюду плотное множество.
]
#todo[Надо что-то еще кроме определения сепарабельности сказать?]
