import 'package:flutter/material.dart';



class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: ProfileBody(),);

    
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePictureHolder(),
          SizedBox(height: 20),
          Text(
            'John Doe', // Replace with actual name
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Image.asset("assets/school_logo.png"),
          Text(
            'Technological Institute of the Philippines', // Replace with actual name
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Merits of Participations:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),
          Divider(),

          Wrap(
          spacing: 8.0, // Spacing between containers horizontally
          runSpacing: 8.0, // Spacing between rows vertically
          children: List.generate(6, (index) {
            return 
            
            GestureDetector(
              onTap: () {
                // Navigate to different routes based on the index or any other condition
                if (index % 2 == 0) {
                  // Redirect to '/donations' for even indices
                  Navigator.pushNamed(context, "/DonationPage");
                } else {
                  // Redirect to '/content' for odd indices
                  Navigator.pushNamed(context, "/ContentPage");
                }
              },
              
              child: Padding( 
                padding: EdgeInsets.all(0),
                child: 
                  Container(
                    width: MediaQuery.of(context).size.width, // Adjust width to fit two columns
                    height: 189, // Adjust height as needed
                    decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage("assets/landing_back.png"),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.blue.withOpacity(0.1),
                                    BlendMode.overlay,
                                  ),
                                ),
                              ),
                      alignment: Alignment.center,
                      child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.green, // Border color
                                  width: 2, // Border thickness
                                ),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color.fromRGBO(163, 252, 186, 0.525),
                                    Color.fromARGB(176, 255, 255, 255)
                                  ],
                                ),
                              ),
                              child: Container(
                                //InnerCard Content
                                child: Column( //Could be problematic has const
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //TITLE
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: 
                                      Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 8), // Adjust spacing between image and text
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              Colors.white, // Change to the desired color
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset(
                                              "assets/logo_small.png", 
                                              width: 50, // Adjust the width of the image as needed
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "MERIT OF PARTICIPATION",
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                      
                                    ),
                                    //LOCATION
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Text("This certifies that Alexandra Quizon has generously contributed to our tree planting initiative, making a positive impact on our environment and community. July 28, 2024 Technological Institute of the Philippines",
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                            
                                          )),
                                      ),
                                    ),
                                    //DATE
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Text("Note: This certificate is auto generated by EcoGrow",
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white60
                                        )),
                                    ),

                                    

                                  ],
                                ),
                              ),
                            ),
                          ),
                    ),

                    

                

                
              )
              
              
            );
            
          }),
        )


        ],
      ),
    );
  }
}

class ProfilePictureHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey, // Placeholder color
      ),
      child: Icon(
        Icons.person, // Placeholder icon
        size: 100,
        color: Colors.white,
      ),
    );
  }
}

