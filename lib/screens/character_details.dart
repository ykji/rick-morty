import 'package:flutter/material.dart';
import 'package:rick_morty/data/provider/feed_data_provider.dart';
import 'package:rick_morty/widgets/network_image_widget.dart';

class CharacterDetails extends StatelessWidget {
  static const routeName = "CharacterDetails";

  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // read child
    return Scaffold(
      appBar: AppBar(
        title: Text(args.feedData.characters[args.index].name),
        centerTitle: true,
        backgroundColor: Colors.brown[200],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.02,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                height: h * 0.25,
                child: showImage(
                  url: args.feedData.characters[args.index].imageUrl,
                  radius: w * 0.1,
                ),
              ),
              SizedBox(height: h * 0.03),
              showCharacteristics(
                schema: "Status : ",
                value: args.feedData.characters[args.index].status,
                h: h,
              ),
              SizedBox(height: h * 0.03),
              showCharacteristics(
                schema: "Species : ",
                value: args.feedData.characters[args.index].species,
                h: h,
              ),
              SizedBox(height: h * 0.03),
              showCharacteristics(
                schema: "Gender : ",
                value: args.feedData.characters[args.index].gender,
                h: h,
              ),
              SizedBox(height: h * 0.03),
              showCharacteristics(
                schema: "Origin : ",
                value: args.feedData.characters[args.index].origin.name,
                h: h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

showCharacteristics({schema, value, h}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: schema,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: h * 0.035,
      ),
      children: <TextSpan>[
        TextSpan(
          text: value,
          style: TextStyle(
            color: Colors.brown,
            fontSize: h * 0.03,
          ),
        )
      ],
    ),
  );
}

class Arguments {
  final int index;
  final FeedDataProvider feedData;
  Arguments(this.index, this.feedData);
}
