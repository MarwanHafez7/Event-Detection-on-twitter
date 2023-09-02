import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Navigation.dart';
import 'News.dart';
List<Map<String, dynamic>> _allUsers = [
  {
    "id": 1,
    "content":"Have a World Series winning pitcher coming on the pod down in FLA this week.Who else is down here for Spring training that wants to help us educate, entertain &amp; inspire the next generation with @theathletespod? #MLB #SpringTraining #sports" ,
    "date": "1/31/2023",
    "category" : "sports",
    "likes" : 7,
    "liked" : false,
  },
  {
    "id": 2,
    "content":"God wants us to learn to be content with his provision.#budget #budgeting #budgetlife #debt #saving #save #savingmoney #moneymanagement #moneyadvice #finance #personalfinance #financialadvice #highinflation" ,
    "date": "1/31/2023",
    "category" : "finance",
    "likes" : 3,
    "liked" : false,

  },
  {
    "id": 3,
    "content":"#DFI is a key enabler of #innovation and economic growth. From #startups to large #enterprises, it is essential for businesses to have access to necessary #funding. @FlexaHQ is proud to be a leading provider of #DFI to help businesses of all sizes succeed. #Finance #Investment" ,
    "date": "1/31/2023",
    "category" : "finance",
    "likes" : 16,
    "liked" : false,

  },
  {
    "id": 4,
    "content":"Frontline health services demand money. Tax hikes bring in less! Listen to the experts #politics" ,
    "date": "1/9/2023",
    "category" : "politics",
    "likes" : 43,
    "liked" : false,

  },
  {
    "id": 5,
    "content":"Mitch McConnell represents China, NOT Kentucky or America at large.  Recall him now! #politics #media" ,
    "date": "12/24/2022",
    "category" : "politics",
    "likes" : 18,
    "liked" : false,

  },
  {
    "id": 6,
    "content":"Did you know that pickleball was invented in 1965 by a 65-year-old man named Joel Pritchard? #pickleball #fact #sports #learn #history" ,
    "date": "1/23/2023",
    "category" : "sports",
    "likes" : 33,
    "liked" : false,

  },
  {
    "id": 7,
    "content":"LSU and Burrow and Chase 46 Bama and Tua and Davonta Smith #SportsNews #sports #nfl #football #news" ,
    "date": "1/23/2023",
    "category" : "sports",
    "likes" : 21,
    "liked" : false,

  },
  {
    "id": 8,
    "content":"If we are to help those effected by poverty together we should reject the blame game. #politics" ,
    "date": "1/21/2023",
    "category" : "politics",
    "likes" : 93,
    "liked" : false,

  },
  {
    "id": 9,
    "content":"Transform your business into the digital age with #DigitalTransformation â€“ it's the key to success! #Innovation #Tech #business" ,
    "date": "1/18/2023",
    "category" : "Business",
    "likes" : 66,
    "liked" : false,

  },
  {
    "id": 10,
    "content":"Your uniqueness can be leverage to create top of mind awareness. Be consistent and be you. #marketing #business" ,
    "date": "1/18/2023",
    "category" : "Business",
    "likes" : 27,
    "liked" : false,

  },
];




class Tweet extends StatefulWidget {
  int Tweet_id;
  Tweet({Key? key , required this.Tweet_id}) : super(key: key);

  List<String> images = [
    'https://media.istockphoto.com/id/1158115722/photo/sports-and-games-background.jpg?s=170667a&w=0&k=20&c=JcnnIjPP_wVQaRKPLy5aIi536TTWxLk6xvbDHazpScQ=',
    'https://www.leasefoundation.org/wp-content/uploads/2018/10/rsz_technology_abstract_photo.jpg',
    'https://thumbs.dreamstime.com/b/blue-screensaver-international-politics-news-background-world-map-n-screensaver-news-policy-100113198.jpg',
    'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzaW5lc3MlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
  ];



  @override
  _TweetState createState() => _TweetState();
}

class _TweetState extends State<Tweet> {

  @override
  Widget build(BuildContext context) {
    String content = _allUsers.firstWhere((user) => user["id"] == widget.Tweet_id)["content"];
    // String date = _allUsers.firstWhere((user) => user["id"] ==widget.Tweet_id )["date"];
    // int Likes = _allUsers.firstWhere((user) => user["id"] == widget.Tweet_id)["Likes"];
    return Scaffold(

      resizeToAvoidBottomInset: false,

      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [

            SizedBox(height: MediaQuery.of(context).size.height * 0.000999),

            //Logo
            Center(
              child: Row(
                  children: [
                    //Back Button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        FloatingActionButton(

                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Nav(),
                                ));
                          },
                          child: Icon(Icons.arrow_back,size: 32,),
                          backgroundColor: Colors.white,
                          foregroundColor: Color.fromRGBO(39, 39, 40, 1),
                          elevation: 1.5,
                        ),
                      ],
                    ),


                    SizedBox(width: 70),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          height: 25.14,
                          width: 139,
                          child: SvgPicture.asset("assets/images/Logo.svg"),
                        ),
                      ],
                    ),






                  ]),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),








            // SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //Line
            const Divider(
              height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(143, 147, 154, 1),
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            //Tweet Name
            Text(content,
              style: GoogleFonts.raleway(
                  color: const Color.fromRGBO(39, 39, 40, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),
            ),



            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            //Tweet Content
            // Text('The State of Palestine lies at the heart of the world, located in the middle of the three continents of Asia, Africa, and Europe on the western side of Asia Palestine is bordered from the north by the State of Lebanon at Ras Naqoura, and by the Mediterranean Sea from the west and by the Dead Sea and the Jordan River from the east.',
            //   style: GoogleFonts.raleway(
            //       color: const Color.fromRGBO(133, 137, 143, 1),
            //       fontSize: 16,
            //       fontWeight: FontWeight.w500,
            //       fontStyle: FontStyle.normal
            //   ),
            // ),



            SizedBox(height: MediaQuery.of(context).size.height * 0.02),


            //Line
            const Divider(
              //height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(143, 147, 154, 1),
            ),



            SizedBox(height: MediaQuery.of(context).size.height * 0.01),


            //Likes
            Text("1000 Likes",
              style: GoogleFonts.raleway(
                  color: const Color.fromRGBO(39, 39, 40, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal
              ),
            ),




            SizedBox(height: MediaQuery.of(context).size.height * 0.013),

            //Line
            const Divider(
              height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(143, 147, 154, 1),
            ),




            SizedBox(height: MediaQuery.of(context).size.height * 0.0),

            //Icons
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.favorite,
                    color: Color.fromRGBO(180, 25, 25, 1),
                    size: 28,
                  ),
                ),



                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Color.fromRGBO(39, 39, 40, 1),
                    size: 28,

                  ),
                ),


                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.share,
                    color: Color.fromRGBO(39, 39, 40, 1),
                    size: 28,

                  ),
                ),



              ],
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.0),

            //Line
            const Divider(
              height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(143, 147, 154, 1),
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Spacer(),

            //Related Tweets
            Text("Related to this tweet",
              style: GoogleFonts.raleway(
                  color: const Color.fromRGBO(39, 39, 40, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),
            ),



            SizedBox(height: 10),

            //Related Tweets
            Container(
              height: MediaQuery.of(context).size.height * 0.22,

              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(widget.images[index]),
                            colorFilter: const ColorFilter.mode(
                              Colors.black54,
                              BlendMode.darken,
                            ),
                            fit: BoxFit.cover),
                        //color: Colors.cyan,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: 200),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Color.fromRGBO(180, 25, 25, 1),
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_border,
                                    color: Color.fromRGBO(244, 244, 244, 1),
                                    size: 25,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Color.fromRGBO(244, 244, 244, 1),
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width *
                                          0.79,
                                      child: Text(
                                        'Event Name Event Name Event Name Event Name Event Name Event Name Event Name Event Name Event Name Event Name',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.raleway(
                                          color: Color.fromRGBO(
                                              244, 244, 244, 1),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Text(
                                      '1000 Likes',
                                      style: GoogleFonts.raleway(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 253,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (context) => new Tweet(Tweet_id: 1,)));
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 5),
                  itemCount: widget.images.length),

            )











          ],
        ),
      ),






    );
  }
}
