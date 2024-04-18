import "package:flutter/material.dart";


class topUpPage extends StatefulWidget {
  @override
  State<topUpPage> createState() => _topUpPageState();
}

class _topUpPageState extends State<topUpPage> {
  @override
  Widget build(BuildContext context) {
    List<int> amounts = [10, 20, 30, 40, 50, 100, 200, 300, 400];

    return Scaffold(
      appBar: AppBar(
        title: Text("Donate Now"),
        
      ),
      body: Center(
          child: Column (
      
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed function here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('Donation Amount', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed function here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('Payment Method', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),

          
            
            
            
            
            Expanded(
              child: Container (
                decoration: BoxDecoration(
                ),
                padding: EdgeInsets.all(25),
                child: GridView.count(
                crossAxisCount: 3, // Number of columns
                mainAxisSpacing: 10.0, // Vertical gap between the grid items
                crossAxisSpacing: 10.0, // Horizontal gap between the grid items
                children: List.generate(amounts.length, (index) {
                  return Container(
                 
                    decoration: BoxDecoration(
                      color: Colors.white, // Set white background color
                      border: Border.all(
                        color: Colors.green, // Set green border color
                        width: 5.0, // Set border width
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Set border radius
                    ),

                    child: Center(
                      child: Text(
                        '${amounts[index]}',
                        style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
            ),),
            
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Amount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Add some space between text field and currency text
                  Text(
                    'PHP',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            
                    
            ElevatedButton(
              onPressed: () {
                print("Donation has been processed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set green background color
                elevation: 5, // Add box shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set border radius
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Add padding to the text
                child: Text(
                  'Proceed with Donation',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.0), // Add some space between text field and currency text



            ]
          )


      ),

    );
  }
}
