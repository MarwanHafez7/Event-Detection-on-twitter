import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Tweet.dart';


List<Map<String, dynamic>> _allUsers = [
  {
    "id": 1,
    "content":"Have a World Series winning pitcher coming on the pod down in FLA this week.Who else is down here for Spring training that wants to help us educate, entertain &amp; inspire the next generation with @theathletespod? #MLB #SpringTraining #sports" ,
    "date": "1/31/2023  2:00:49 AM",
    "category" : "sports",
    "likes" : 0,
  },
  {
    "id": 2,
    "content":"God wants us to learn to be content with his provision.#budget #budgeting #budgetlife #debt #saving #save #savingmoney #moneymanagement #moneyadvice #finance #personalfinance #financialadvice #highinflation" ,
    "date": "1/31/2023  8:00:31 PM",
    "category" : "finance",
    "likes" : 0,
  },
  {
    "id": 3,
    "content":"#DFI is a key enabler of #innovation and economic growth. From #startups to large #enterprises, it is essential for businesses to have access to necessary #funding. @FlexaHQ is proud to be a leading provider of #DFI to help businesses of all sizes succeed. #Finance #Investment" ,
    "date": "1/31/2023  8:03:02 PM",
    "category" : "finance",
    "likes" : 0,
  },
  {
    "id": 4,
    "content":"Frontline health services demand money. Tax hikes bring in less! Listen to the experts #politics" ,
    "date": "1/9/2023  7:11:26 PM",
    "category" : "politics",
    "likes" : 0,
  },
  {
    "id": 5,
    "content":"Mitch McConnell represents China, NOT Kentucky or America at large.  Recall him now! #politics #media" ,
    "date": "12/24/2022  4:00:02 AM",
    "category" : "politics",
    "likes" : 0,
  },
  {
    "id": 6,
    "content":"Did you know that pickleball was invented in 1965 by a 65-year-old man named Joel Pritchard? #pickleball #fact #sports #learn #history" ,
    "date": "1/23/2023  2:59:41 PM",
    "category" : "sports",
    "likes" : 0,
  },
  {
    "id": 7,
    "content":"LSU and Burrow and Chase 46 Bama and Tua and Davonta Smith #SportsNews #sports #nfl #football #news" ,
    "date": "1/23/2023  6:57:57 PM",
    "category" : "sports",
    "likes" : 0,
  },
  {
    "id": 8,
    "content":"If we are to help those effected by poverty together we should reject the blame game. #politics" ,
    "date": "1/21/2023  7:09:53 PM",
    "category" : "politics",
    "likes" : 0,
  },
  {
    "id": 9,
    "content":"Transform your business into the digital age with #DigitalTransformation â€“ it's the key to success! #Innovation #Tech #business" ,
    "date": "1/18/2023  6:47:05 AM",
    "category" : "Bussiness",
    "likes" : 0,
  },
  {
    "id": 10,
    "content":"Your uniqueness can be leverage to create top of mind awareness. Be consistent and be you. #marketing #business" ,
    "date": "1/18/2023  6:37:33 AM",
    "category" : "Bussiness",
    "likes" : 0,
  },
];
List<Map<String, dynamic>> _foundUsers = [];
final Map<String, String> background_image = {"politics": "https://thumbs.dreamstime.com/b/blue-screensaver-international-politics-news-background-world-map-n-screensaver-news-policy-100113198.jpg",
  "Bussiness": "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzaW5lc3MlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "sports": "https://media.istockphoto.com/id/1158115722/photo/sports-and-games-background.jpg?s=170667a&w=0&k=20&c=JcnnIjPP_wVQaRKPLy5aIi536TTWxLk6xvbDHazpScQ=",
  "finance": "https://www.leasefoundation.org/wp-content/uploads/2018/10/rsz_technology_abstract_photo.jpg",
};
bool sports_selected = false;
bool finance_selected = false;
bool politics_selected = false;
bool bussiness_selected = false;
bool all_selected = true;




class Saved extends StatefulWidget {
  Saved({Key? key}) : super(key: key);



  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (ModalRoute
              .of(context)
              ?.settings
              .name != '/home') {
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,


          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                //Logo
                Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      height: 25.14,
                      width: 139,
                      child: SvgPicture.asset("assets/images/Logo.svg"),
                    )
                  ]),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                //Search
                Container(
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(143, 147, 154, 1),
                        ),
                        hintText: 'Search news',
                        hintStyle: GoogleFonts.raleway(
                          color: const Color.fromRGBO(143, 147, 154, 1),
                          //fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromRGBO(39, 39, 40, 1)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color.fromRGBO(180, 25, 25, 1)),
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Spacer(),
                //Saved News
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Saved News",
                        style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(39, 39, 40, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal)
                        //style: TextStyle(color: Color.fromRGBO(133, 137, 143, 1))
                        ,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 17),

                //Tweets
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child:Expanded(
                    child: _foundUsers.isNotEmpty
                        ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) =>Column(
                        children: [
                          GestureDetector(
                            child: Container(

                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      background_image[_foundUsers[index]['category'].toString()]! ,
                                    ),
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
                                        IconButton(
                                          onPressed: (){},
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Color.fromRGBO(180, 25, 25, 1),
                                            size: 30,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: (){},
                                          icon: const Icon(
                                            Icons.bookmark_border,
                                            color: Color.fromRGBO(244, 244, 244, 1),
                                            size: 25,

                                          ),
                                        ),
                                        IconButton(
                                          onPressed: (){},
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
                                            Expanded(
                                              child: Text(
                                                _foundUsers[index]['content'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                GoogleFonts.raleway(
                                                  color: Color.fromRGBO(244, 244, 244, 1),
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
                                          children: [
                                            Text(
                                              _foundUsers[index]['likes'].toString(),
                                              style:
                                              GoogleFonts.raleway(
                                                color: Colors.white70,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
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
                              // Navigator.of(context).pushReplacement(
                              //     new MaterialPageRoute(
                              //         builder: (context) => new Tweet()));
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),


                    )
                        : const Text(
                      'No results found! \nPlease try to search with different name',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),

                ),
              ],
            ),
          ),

        ));
  }}