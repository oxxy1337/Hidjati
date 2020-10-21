import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Places extends StatefulWidget {
  @override
  Places_map createState() => new Places_map();
}

class Places_map  extends State<Places> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Color(0xffaf5f63),
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("مكة"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xffaf5f63)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xffaf5f63)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(21.4228714,39.8235407), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(21.4228714,39.8235407), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://upload.wikimedia.org/wikipedia/commons/9/94/Kaaba_in_macca.jpg",
                  21.4228714,39.8235407,"مسجد الحرم"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("https://upload.wikimedia.org/wikipedia/commons/b/b8/MasjidNabawi.jpg",
                  24.4672105, 39.608937,"المسجد النبوي"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Al-Baqi%271.jpg/220px-Al-Baqi%271.jpg",
                  24.4671208, 39.6143779,"بقيع الغرقد"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://upload.wikimedia.org/wikipedia/commons/7/7d/Mosquée_El_Feth_Thénia_مسجد_الفتح_الثنية.jpg",
                  36.2983107,2.58649,"مسجد الثنية"),
            ),SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://live.staticflickr.com/7514/16144961990_3931fed8fe_b.jpg"      ,
                  24.4815106,39.5317241,"مسجد الفتح"),
            ),SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Al-Baqi%271.jpg/220px-Al-Baqi%271.jpg",
                  21.4225687,39.8243331,"زمزم"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String placeName) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(placeName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Color(0xffaf5f63),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            )),
        SizedBox(height:5.0),

        SizedBox(height:5.0),

      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(21.4224779, 39.8240835), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
            Marker1,Marker2,Marker3,Marker4,Marker5,Marker6
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker Marker1 = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(21.4228714,39.8235407),
  infoWindow: InfoWindow(title: 'مسجد الحرم'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);

Marker Marker2 = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(24.4672105, 39.608937),
  infoWindow: InfoWindow(title: 'المسجد النبوي'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);
Marker Marker3 = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(24.4671208, 39.6143779),
  infoWindow: InfoWindow(title: ' بقيع الغرقد'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);



Marker Marker4 = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(36.2983107,2.58649),
  infoWindow: InfoWindow(title: 'مسجذ الثنية'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);
Marker Marker5 = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(24.4815106,39.5317241),
  infoWindow: InfoWindow(title: 'مسجد الفتح'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);
Marker Marker6 = Marker(
  markerId: MarkerId('زمزم'),
  position: LatLng( 21.4225687,39.8243331),
  infoWindow: InfoWindow(title: 'زمزم'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);

