#!/usr/bin/env ruby

require "bundler/setup"
require "nutrientes"
require "benchmark"
include Benchmark

alimentos = [HuevoLacteoHelado.new("Huevo frito", 14.1, 0, 19.5),
             HuevoLacteoHelado.new("Leche vaca", 3.3, 4.8, 3.2),
             HuevoLacteoHelado.new("Yogurt", 3.8, 4.9, 3.8),
             DerivadoCarne.new("Cerdo", 21.5, 0, 6.3),
             DerivadoCarne.new("Ternera", 21.1, 0, 3.1),
             DerivadoCarne.new("Pollo", 20.6, 0, 5.6),
             PescadoMarisco.new("Bacalao", 17.7, 0, 0.4),
             PescadoMarisco.new("Atún", 21.5, 0, 15.5),
             PescadoMarisco.new("Salmón", 19.9, 0, 13.6),
             AlimentoGraso.new("Aceite de oliva", 0, 0.2, 99.6),
             AlimentoGraso.new("Mantequilla", 0.7, 0, 83.2),
             AlimentoGraso.new("Chocolate", 5.3, 47, 30),
             AlimentoRicoCarbohidratos.new("Azúcar", 0, 99.8, 0),
             AlimentoRicoCarbohidratos.new("Arroz", 6.8, 77.7, 0.6),
             AlimentoRicoCarbohidratos.new("Lentejas", 23.5, 52.0, 1.4),
             AlimentoRicoCarbohidratos.new("Papas", 2, 15.4, 0.1),
             VerduraHortaliza.new("Tomate", 1, 3.5, 0.2),
             VerduraHortaliza.new("Cebolla", 1.3, 5.8, 0.3),
             VerduraHortaliza.new("Calabaza", 1.1, 4.8, 0.1),
             Fruta.new("Manzana", 0.3, 12.4, 0.4),
             Fruta.new("Plátanos", 1.2, 21.4, 0.2),
             Fruta.new("Pera", 0.5, 12.7, 0.3)]

Benchmark.bmbm do |x|
  x.report("sort_for") {alimentos.sort_for}
  x.report("sort_each") {alimentos.sort_each}
  x.report("sort") {alimentos.sort}
end