import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Peliculas'),
        ),
        body: PeliculaList(),
      ),
    );
  }
}

class Pelicula {
  final String titulo;
  final String fecha;
  final String genero;
  final String imagenUrl;
  final String descripcion;

  Pelicula({
    required this.titulo, 
    required this.fecha, 
    required this.genero,
    required this.imagenUrl,
    required this.descripcion,
  });
}

class PeliculaList extends StatelessWidget{
  final List<Pelicula> peliculas = [
    Pelicula(
      titulo: "Batman: el caballero de la noche", 
      fecha: "17 de julio de 2008", 
      genero: "Thriller, Acción, Drama", 
      imagenUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn_Nc7XNSzg1aIVjW_ziNl7YBKRSSITCEKykOE2Qc3kg&s", 
      descripcion: "Batman tiene que mantener el equilibrio entre el heroísmo y el vigilantismo para pelear contra un vil criminal conocido como el Guasón, que pretende sumir Ciudad Gótica en la anarquía."
    ),
    Pelicula(
      titulo: "El padrino", 
      fecha: "29 de noviembre de 2012", 
      genero: "Crimen, Drama", 
      imagenUrl: "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2023/07/padrino-3096022.jpg?tf=3840x", 
      descripcion: "Una adaptación ganadora del Premio de la Academia, de la novela de Mario Puzo acerca de la familia Corleone."
    ),
    Pelicula(
      titulo: "Gravity", 
      fecha: "14 de noviembre de 2013", 
      genero: "Thriller. Drama", 
      imagenUrl: "https://i.blogs.es/c32361/el-203d-20de-20gravity-20xataka/650_1200.jpg", 
      descripcion: "La doctora Ryan Stone es una ingeniera médica en su primera misión espacial. Su comandante es el veterano Matt Kowalsky, en su último viaje antes de retirarse."
    ),
    Pelicula(
      titulo: "Oppenheimer", 
      fecha: "21 de julio de 2023", 
      genero: "Drama. Thriller", 
      imagenUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKbrvJ7_DTRx4tKkUI4jwkV09bW4K3hvMiISTgwlzI4Q&s", 
      descripcion: "Durante la Segunda Guerra Mundial, el teniente general Leslie Groves designa al físico J. Robert Oppenheimer para un grupo de trabajo que está desarrollando el Proyecto Manhattan, cuyo objetivo consiste en fabricar la primera bomba atómica."
    ),
  ];

  @override
  Widget build(BuildContext) {
    return ListView.builder(
      itemCount: peliculas.length,
      itemBuilder: (context, index){
        return PeliculaCard(pelicula: peliculas[index]);
      },
    );
  } 
}

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;
  PeliculaCard({required this.pelicula});

  @override 
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(pelicula.imagenUrl),
            SizedBox(height: 10),
            Text(
              pelicula.titulo,
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            Text("Fecha: ${pelicula.fecha}"),
            SizedBox(height: 10),
            Text("Género: ${pelicula.genero}"),
            SizedBox(height: 10),
            Text("Descripción: ${pelicula.descripcion}"),
          ],
        ),
      ),
    );
  }
}
