import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _guestsController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  void _submitReservation() {
    // Aquí puedes agregar la lógica para guardar la reserva
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reserva confirmada'),
        content: Text('¡Gracias por reservar tu experiencia en el parque!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu experiencia'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Planifica tu visita',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Selecciona los detalles de tu reserva y confirma:',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Fecha',
                      hintText: 'Selecciona una fecha',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _dateController.text =
                              "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                        });
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _timeController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Hora',
                      hintText: 'Selecciona una hora',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _timeController.text =
                              pickedTime.format(context).toString();
                        });
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _guestsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número de personas',
                      hintText: 'Ingresa el número de invitados',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.people),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitReservation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Confirmar reserva',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      _dateController.clear();
                      _timeController.clear();
                      _guestsController.clear();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Colors.teal),
                    ),
                    child: Text(
                      'Limpiar formulario',
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
