#import "notes.typ": notes

#show: notes.with(author: "Конгресс", title: "var-master-exam")

#align(
  horizon + center,
  {
    set page(numbering: none)
    align(right, text(size: 26pt)[Киреева Елена Александровна #emoji.woman])
    v(5fr)
    text(size: 26pt, weight: "bold")[Экзамен]
    v(1fr)
    text(size: 20pt, weight: "bold")[Вариационные методы решения задач математической физики]
    v(1cm)
    text(size: 50pt)[#emoji.partalteration]
    v(8fr)
    align(center)[_Зимняя сессия 2025 - 2026_]
  },
)
#pagebreak()
#heading(numbering: none, outlined: false)[Распределение вопросов]
#figure(table(
  columns: 5,
  inset: 0.5em,
  align: center + horizon,
  table.header([*Раздел*], [*Валера*], [*Таня*], [*Андрей*], [*Саша*]),

  [Модуль 1], table.cell(rowspan: 3, text(size: 38pt, baseline: -0.125em)[#emoji.crossmark]),
  [], [1.3, 1.4],
  [1.1, 1.2, 1.5, 1.6], [Модуль 2],
  [2.1, 2.2, 2.3, 2.4, 2.5],
  [2.7, 2.8, 2.9], [2.6],
  [Практика], [3.3],
  [3.2],
  [3.1, 3.4],
))
#v(1cm)
#outline()
#pagebreak()

= Модуль 1
#include "mod-1-que-1.typ"; #pagebreak(weak: true)
#include "mod-1-que-2.typ"; #pagebreak(weak: true)
#include "mod-1-que-3.typ"; #pagebreak(weak: true)
#include "mod-1-que-4.typ"; #pagebreak(weak: true)
#include "mod-1-que-5.typ"; #pagebreak(weak: true)
#include "mod-1-que-6.typ"; #pagebreak(weak: true)

= Модуль 2
#include "mod-2-que-1.typ"; #pagebreak(weak: true)
#include "mod-2-que-2.typ"; #pagebreak(weak: true)
#include "mod-2-que-3.typ"; #pagebreak(weak: true)
#include "mod-2-que-4.typ"; #pagebreak(weak: true)
#include "mod-2-que-5.typ"; #pagebreak(weak: true)
#include "mod-2-que-6.typ"; #pagebreak(weak: true)
#include "mod-2-que-7.typ"; #pagebreak(weak: true)
#include "mod-2-que-8.typ"; #pagebreak(weak: true)
#include "mod-2-que-9.typ"; #pagebreak(weak: true)

= Практика
#include "prac-que-1.typ"; #pagebreak(weak: true)
#include "prac-que-2.typ"; #pagebreak(weak: true)
#include "prac-que-3.typ"; #pagebreak(weak: true)
#include "prac-que-4.typ"; #pagebreak(weak: true)


