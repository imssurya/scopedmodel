import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopedmodel/model/donationmodel.dart';

class DonationModelScreen extends StatefulWidget {
  DonationModelScreen({Key key}) : super(key: key);
  @override
  _DonationModelScreenState createState() => _DonationModelScreenState();
}

class _DonationModelScreenState extends State<DonationModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/5696873/pexels-photo-5696873.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            fit: BoxFit.fill),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              shadowColor: Color(0x802196F3),
              child: ScopedModelDescendant<DonationModel>(
                builder: (context, child, model) {
                  if (model.donClick) {
                    return _buildContent(model);
                  } else {
                    return _buildInitContent(model);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        child: Column(
          children: <Widget>[
            _thankYouText(model),
            _backButton(),
          ],
        ),
      ),
    );
  }

  Widget _thankYouText(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.bone,
            color: Color(0xffdd6b3d),
            size: 40.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Thank you for donating \u0024 ${model.count}',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xffdd6b3d),
            ),
          ),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.dog,
            color: Color(0xffdd6b3d),
            size: 30.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            color: Color(0xffdd6b3d),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Donate More',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            FontAwesomeIcons.dog,
            color: Color(0xffdd6b3d),
          )
        ],
      ),
    );
  }

  Widget _buildInitContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        child: Column(
          children: <Widget>[
            _titleContainer(),
            _priceContainer(model),
            _donateContainer(model),
          ],
        ),
      ),
    );
  }

  Widget _titleContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'STEWARD',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Dogs are helpful, not painful',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xffdd6b3d),
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _priceContainer(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              model.decrement();
            },
            child: Icon(
              FontAwesomeIcons.minus,
              color: Color(0xffdd6b3d),
              size: 30.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Color(0xffFAF4F2),
            padding: EdgeInsets.all(10.0),
          ),
          Text(
            '\u0024 ${model.count}',
            style: TextStyle(fontSize: 44.0, color: Colors.black),
          ),
          RawMaterialButton(
            onPressed: () {
              model.increment();
            },
            child: Icon(
              FontAwesomeIcons.plus,
              color: Color(0xffdd6b3d),
              size: 30.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Color(0xffFAF4F2),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }

  Widget _donateContainer(DonationModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              model.donClick = true;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            textColor: Colors.white,
            color: Color(0xffdd63d),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Donate',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Icon(
                    FontAwesomeIcons.paw,
                    color: Colors.white,
                    size: 30.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
