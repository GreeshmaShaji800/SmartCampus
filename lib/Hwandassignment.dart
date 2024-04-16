import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/parentdiary.dart';

class BiologyPage extends StatelessWidget {
  var isCompleted = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Biology',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Assignment 1',
              style: TextStyle(fontSize: 20),
            ),
            Text('Due April 20, 2024'),
            SizedBox(height: 10), // Add some space between the texts and the inner container
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color:isCompleted==true ? Colors.green:Colors.red, // Example color, you can change it as needed
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child: isCompleted==true?Text(
                    'Completed',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ):Text(
                    'Pending',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class EnglishPage extends StatelessWidget {
  var isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'English',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 150,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Assignment 1',
                  style: TextStyle(fontSize: 20),
                ),
                Text('Due April 20, 2024'),
                SizedBox(height: 10), // Add some space between the texts and the inner container
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color:isCompleted==true ? Colors.green:Colors.red, // Example color, you can change it as needed
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: isCompleted==true?Text(
                        'Completed',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ):Text(
                        'Pending',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class ChemistryPage extends StatelessWidget {
  var isCompleted = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chemistry',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Assignment 1',
            style: TextStyle(fontSize: 20),
          ),
          Text('Due April 20, 2024'),
          SizedBox(height: 10), // Add some space between the texts and the inner container
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color:isCompleted==true ? Colors.green:Colors.red, // Example color, you can change it as needed
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: isCompleted==true?Text(
                  'Completed',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ):Text(
                  'Pending',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
            ),
          ),
        ],
      ),
      ),

    );
  }
}

class HW extends StatelessWidget {
  const HW({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ParentHome(),));
                },
                child: Icon(Icons.arrow_back)),
            onPressed: () {
              // Add your navigation logic here
            },
            color: Colors.white,
          ),
          title: Row(
            children: [
              Text(
                "HW & Assignments",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          centerTitle: false, // Align the title to the left
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue], // Violet to blue
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('HW'),
                    Text('Assignments'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    height: 50,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BiologyPage()),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Biology',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnglishPage()),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'English',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChemistryPage()),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chemistry',

                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


