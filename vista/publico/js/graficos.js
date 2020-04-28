'use strict'
/* Variables Globales para las barras*/
var dataset = [ 5, 10, 15, 20, 25 ];
var w = 500;
var h = 100;

/* Variables Globales para el ScarlePlot */
var fuente = [
[5, 20], [480, 90], [250, 50], [100, 33], [330, 95],
[410, 12], [475, 44], [25, 67], [85, 21], [220, 88]
];


/* Funciones de graficas: */
function dibujo(){
	/* Texto en parrafo d3 */
	d3.select('#draw').append('h2').attr('class','text-primary').text('Ejercicio con Gráficos');

	/* Grafico de barras */
	var svg = d3.select('#barras')
				.append('svg')
				.attr('width', w)
				.attr('height', h);
	svg.selectAll('rect')
	   .data(dataset)
	   .enter()
	   .append('rect')
	   .attr('x', (d, i)=>{
	   		return i * (w / dataset.length);
	   })
	   .attr('y', (d)=>{
	   		return h - (d);
	   })
	   .attr('width', w/dataset.length -1)
	   .attr('height', (d)=>{
	   		return d;
	   })
	   .on('click', (d)=>{
	   		return d3.select(this)
	   				 .style('fill', 'red');
	   })

/* Gráfico Scarlet Plot */
	// Creamos la etiqueta: 
	var svg = d3.select('#scatter')
				.append('svg')
				.attr('width', w)
				.attr('height', h);
	// Definimos el tamaño de x
	var xScale = d3.scaleLinear()
				   .domain([0, d3.max(fuente, (d)=>{
				   		return d[0];
				   })])
				   .range([0, w]);
	// Definimos el tamaño y
	var yScale = d3.scaleLinear()
				   .domain([0, d3.max(fuente, (d)=>{
				   		return d[1];
				   })])
				   .range([h, 0]);
	// Gráficamos los puntos que cruzan x y y:
	svg.selectAll('circle')
	   .data(fuente)
	   .enter()
	   .append('circle')
	   .attr('cx', (d)=>{
	   		return xScale (d[0]);
	   })
	   .attr('cy', (d)=>{
	   		return yScale (d[1]);
	   })
	   .attr('r', 5)
	   .attr('class', 'text-success');
}
