import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class BusLine {
  String name;
  String from;
  String to;
  DateTime fromDateTime;
  DateTime toDateTime;
  String seats;
  String carNumber;
  String icon;

  BusLine({
    required this.name,
    required this.from,
    required this.to,
    required this.fromDateTime,
    required this.toDateTime,
    required this.seats,
    required this.carNumber,
    required this.icon,
  });
}

class Passenger {
  String name;
  Plevel placeType;
  String placeNumber;
  Type buyType;

  Passenger({
    required this.name,
    required this.placeNumber,
    required this.placeType,
    required this.buyType,
  });
}

enum Type {
  offline,
  online,
  noType,
}

enum Plevel {
  up,
  down,
}

class TextFieldCard extends StatelessWidget {
  final String text;
  final Color color;
// ignore: use_key_in_widget_constructors
  const TextFieldCard({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 20,
        child: TextFormField(
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
          initialValue: text,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}

Widget listTile(text, icon, onTap) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: ListTile(
      leading: IconTheme(data: const IconThemeData(size: 40), child: icon),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    ),
  );
}

Widget listElement(Passenger passenger, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            passenger.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              passenger.placeNumber,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            passenger.placeType == Plevel.up
                ? const Text('верхний')
                : const Text('нижний'),
          ],
        ),
        ButtonTheme(
          minWidth: 130,
          child: RaisedButton(
            child: passenger.buyType == Type.online
                ? const Text(
                    'ONLINE',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                : passenger.buyType == Type.offline
                    ? const Text(
                        'OFFLINE',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'no type',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
            onPressed: () {},
            color: passenger.buyType == Type.online
                ? Colors.green
                : passenger.buyType == Type.offline
                    ? Colors.grey
                    : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        )
      ],
    ),
  );
}

class Btn extends StatelessWidget {
// ignore: use_key_in_widget_constructors
  const Btn({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: RaisedButton(
        color: Colors.green,
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _HomeState extends State<Home> {
  List<BusLine> busList = [
    BusLine(
        name: 'YUTONG',
        from: 'Асыката',
        to: 'Алматы',
        fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
        toDateTime: DateTime.parse("2020-02-07 06:10:00"),
        seats: '32 мест',
        carNumber: 'KZ 888 KN02',
        icon: 'bus1.jpg'),
    BusLine(
        name: 'End2End Test1',
        from: 'Город X',
        to: 'Сарыагаш',
        fromDateTime: DateTime.parse("2020-02-06 19:30:00"),
        toDateTime: DateTime.parse("2020-02-07 18:36:00"),
        seats: '53 мест',
        carNumber: 'KZ 123 ABC',
        icon: 'bus2.jpg'),
    BusLine(
        name: 'YUTONG',
        from: 'Сарыагаш',
        to: 'Алматы',
        fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
        toDateTime: DateTime.parse("2020-02-07 06:10:00"),
        seats: '32 мест',
        carNumber: 'KZ 888 KN02',
        icon: 'bus3.jpg'),
  ];

  Widget textTemp(text, [fontSize = 18.0, weight = FontWeight.normal]) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: fontSize,
        fontWeight: weight,
        fontStyle: FontStyle.normal,
        color: Colors.black,
      ),
    );
  }

  Widget cardTemplate(BusLine bus) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/${bus.icon}',
                        fit: BoxFit.fitHeight,
                        width: 135,
                        height: 152,
                      ),
                    ),
                    const SizedBox(height: 5),
                    textTemp(bus.name, 20.0),
                    const SizedBox(height: 5),
                    textTemp(bus.carNumber, 15.0),
                    const SizedBox(height: 4),
                    textTemp(bus.seats, 15.0)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    textTemp(bus.from + ' -', 19.0),
                    textTemp(bus.to, 19.0),
                    const SizedBox(height: 15),
                    textTemp('Отправление', 18.0, FontWeight.bold),
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textTemp(
                            'Дата  -  ' +
                                DateFormat('dd.MM.yyyy E')
                                    .format(bus.fromDateTime),
                            16.0),
                        const SizedBox(height: 5),
                        textTemp(
                            'Время  -  ' +
                                DateFormat('HH:mm').format(bus.fromDateTime),
                            16.0)
                      ],
                    ),
                    const SizedBox(height: 14),
                    textTemp('Прибытие', 18.0, FontWeight.bold),
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textTemp(
                            'Дата  -  ' +
                                DateFormat('dd.MM.yyyy E')
                                    .format(bus.toDateTime),
                            16.0),
                        const SizedBox(height: 5),
                        textTemp(
                            'Время  -  ' +
                                DateFormat('HH:mm').format(bus.toDateTime),
                            16.0)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          FlatButton(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            onPressed: () {
              Widget cancelButton = FlatButton(
                  child: const Text(
                    "НЕТ",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  });
              Widget continueButton = FlatButton(
                child: const Text(
                  "ДА",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () => setState(() {
                  busList.remove(bus);
                  Navigator.of(context).pop();
                }),
              );

              AlertDialog alert = AlertDialog(
                  content: const Text(
                    "Вы хотите удалить этот рейс?",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 19.0),
                  ),
                  actions: [cancelButton, continueButton]);
              showDialog(context: context, builder: (context) => alert);
            },
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(7)),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: textTemp('Удалить рейс'),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Расписание',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: busList.map((bus) => cardTemplate(bus)).toList(),
      ),
      floatingActionButton: FlatButton(
        onPressed: () {},
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
          child: const Text(
            'Добавить рейс',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: Text(
                        'Test Company',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        'Aty Zhoni',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 36,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black87, width: 2),
                  ),
                ),
              ),
              listTile('Продажа билетов', const Icon(Icons.credit_card), () {}),
              listTile(
                  'Список администраторов', const Icon(Icons.people), () {}),
              listTile('Автобусы', const Icon(Icons.departure_board), () {}),
              listTile('Статистика', const Icon(Icons.equalizer), () {}),
              listTile(
                  'Пассажиры', const Icon(Icons.airline_seat_recline_extra),
                  () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PassengerScreen()));
              }),
              listTile('Расписание', const Icon(Icons.date_range), () {}),
              listTile('История', const Icon(Icons.library_books), () {}),
              listTile('Настройки', const Icon(Icons.settings), () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  _PassengerState createState() => _PassengerState();
}

class _PassengerState extends State<PassengerScreen> {
  List<Passenger> passengers = [
    Passenger(
      name: 'Aigerim',
      placeNumber: '0 A',
      placeType: Plevel.up,
      buyType: Type.offline,
    ),
    Passenger(
      name: 'Arlan',
      placeNumber: '0 B',
      placeType: Plevel.up,
      buyType: Type.offline,
    ),
    Passenger(
      name: 'Assel',
      placeNumber: '1',
      placeType: Plevel.down,
      buyType: Type.online,
    ),
    Passenger(
      name: 'Temirlan',
      placeNumber: '1',
      placeType: Plevel.up,
      buyType: Type.online,
    ),
  ];

  List<Passenger> emptyPlaces = [
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 A',
      placeType: Plevel.down,
      buyType: Type.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 B',
      placeType: Plevel.down,
      buyType: Type.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: Plevel.down,
      buyType: Type.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: Plevel.down,
      buyType: Type.noType,
    ),
  ];

  Widget childWidget(context, name, placeNumber, placeType, passenger) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Пассажиры',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Имя',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Место',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Тип',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  children: passengers
                      .map(
                        (passenger) => listElement(passenger, () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return childWidget(
                                context,
                                passenger.name,
                                passenger.placeNumber,
                                passenger.placeType,
                                passenger,
                              );
                            },
                          );
                        }),
                      )
                      .toList(),
                ),
                const Text(
                  'Свободные места',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  children: emptyPlaces
                      .map(
                        (emptyPlace) => listElement(emptyPlace, () {}),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
