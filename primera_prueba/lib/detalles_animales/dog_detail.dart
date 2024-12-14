import 'package:flutter/material.dart';

class DogDetail extends StatefulWidget {
  const DogDetail({super.key});

  @override
  State<DogDetail> createState() => _DogDetailState();
}

class _DogDetailState extends State<DogDetail> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    double heightAppAnimal = size.height * .15;
    double heightPictureAnimal = size.height * .60;
    double heighAnimalDescription = size.height * .25;



    return Scaffold(
      backgroundColor: const Color(0xFF2E4A46),
      body: Column(
        children: [
          AppBarAnimal(
            height: heightAppAnimal,
          ),
          PictureAnimal(
            height: heightPictureAnimal,
          ),
          AnimalDescription(
            height: heighAnimalDescription,
          ),
        ],
      ),
    );
  }
}

  class AppBarAnimal extends StatelessWidget {
  final double height;

  const AppBarAnimal({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: const Color(0xFF2E4A46),
      child: Column(
        children: [
          //Bajando los Iconos - Appbar
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:  Colors.white,
                      width: 0.8,
                    ),
                    shape: BoxShape.circle, 
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    color: Colors.white,
                    iconSize: 24,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:  Colors.white,
                          width: 0.8,
                        ),
                        shape: BoxShape.circle, 
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


  class PictureAnimal extends StatelessWidget {
  final double height;

  const PictureAnimal({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: const Color(0xFF2E4A46),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: const Color.fromARGB(255, 49, 183, 163),
                  width: 2, 
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/img/dog_2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 30,
            left: 280,
            child: Text(
              'Perro',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 90,
            bottom: 30,
            left: -45,
            right: 230,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Text(
                      '¡Guau!',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



  class AnimalDescription extends StatelessWidget {
  final double height;
  
  const AnimalDescription({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: const Color(0xFF2E4A46),
      child: const Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 15,
          left: 25,
          right: 25,
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    "Los perros tienen un súper olfato, ¡pueden oler hasta 100.000 veces mejor que los humanos! Por eso, muchas veces ayudan a encontrar cosas o personas.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }
}
