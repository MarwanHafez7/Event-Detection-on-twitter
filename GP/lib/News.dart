import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'Tweet.dart';
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

List<Map<String, dynamic>> _foundUsers = [];
final Map<String, String> background_image = {"politics": "https://thumbs.dreamstime.com/b/blue-screensaver-international-politics-news-background-world-map-n-screensaver-news-policy-100113198.jpg",
  "Business": "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzaW5lc3MlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "sports": "https://media.istockphoto.com/id/1158115722/photo/sports-and-games-background.jpg?s=170667a&w=0&k=20&c=JcnnIjPP_wVQaRKPLy5aIi536TTWxLk6xvbDHazpScQ=",
  "finance": "https://www.leasefoundation.org/wp-content/uploads/2018/10/rsz_technology_abstract_photo.jpg",
};
bool sports_selected = false;
bool finance_selected = false;
bool politics_selected = false;
bool business_selected = false;
bool all_selected = true;



class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {



  // This list holds the data for the list view


  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();

  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["content"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
  void _runFilter_category(String category_name) {
    List<Map<String, dynamic>> results = [];
    if (category_name == "all") {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
      user["category"].toLowerCase() == (category_name.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
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


          body:Padding(
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
                    onChanged: (value) => _runFilter(value),

                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 13),

                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(143, 147, 154, 1),
                        ),

                        hintText: 'Search news', hintStyle: GoogleFonts.raleway(
                      color: const Color.fromRGBO(143, 147, 154, 1),
                      //fontSize: 16,
                      fontWeight: FontWeight.w400,

                    ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color.fromRGBO(39, 39, 40, 1)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Color.fromRGBO(180, 25, 25, 1)),
                          borderRadius: BorderRadius.circular(12),
                        )
                    ),
                  ),
                ),





                SizedBox(height: MediaQuery.of(context).size.height * 0.015),

                //Categories
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Expanded(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                            icon: SvgPicture.asset("assets/icons/world.svg",width: 24,height: 24,
                              color : all_selected ? Colors.white : Color.fromRGBO(133, 137, 143, 1),
                            ),
                            label: Text('All',
                                style: GoogleFonts.raleway(
                                  color : all_selected ? Colors.white : Color.fromRGBO(133, 137, 143, 1),
                                  fontSize: 14,
                                  fontWeight: all_selected ? FontWeight.w500 : FontWeight.w400,

                                )
                            ),
                            onPressed: () {
                              setState(() {
                                all_selected=true;
                                sports_selected = false;
                                finance_selected = false;
                                politics_selected = false;
                                business_selected = false;
                              });
                              _runFilter_category("all");

                            }  ,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                              primary: all_selected ? Color.fromRGBO(180, 25, 25, 1) : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          ElevatedButton.icon(
                            icon: SvgPicture.asset("assets/icons/stadium.svg",width: 24,height: 24),
                            label: Text('Sports',
                                style: GoogleFonts.raleway(
                                  color : sports_selected ? Colors.white : Color.fromRGBO(133, 137, 143, 1),

                                  fontSize: 14,
                                  fontWeight: all_selected ? FontWeight.w400 : FontWeight.w500,
                                )),
                            onPressed: () {
                              setState(() {
                                all_selected=false;
                                sports_selected = true;
                                finance_selected = false;
                                politics_selected = false;
                                business_selected = false;
                              });
                              _runFilter_category("sports");

                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              primary: sports_selected ? Color.fromRGBO(180, 25, 25, 1) : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          ElevatedButton.icon(
                            icon: SvgPicture.asset("assets/icons/profit-bar-chart.svg",width: 24,height: 24),
                            label: Text('Finance',
                                style: GoogleFonts.raleway(
                                  color : finance_selected ? Colors.white : Color.fromRGBO(133, 137, 143, 1),
                                  fontSize: 14,
                                  fontWeight: all_selected ? FontWeight.w400 : FontWeight.w500,
                                )
                            ),
                            onPressed: (){
                              setState(() {
                                all_selected=false;
                                sports_selected = false;
                                finance_selected = true;
                                politics_selected = false;
                                business_selected = false;
                              });
                              _runFilter_category("finance");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              primary: finance_selected ? Color.fromRGBO(180, 25, 25, 1) : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          ElevatedButton.icon(
                            icon: SvgPicture.asset("assets/icons/politician.svg",width: 24,height: 24),
                            label: Text('Politics',
                                style: GoogleFonts.raleway(
                                  color : politics_selected ? Colors.white : Color.fromRGBO(133, 137, 143, 1),
                                  fontSize: 14,
                                  fontWeight: all_selected ? FontWeight.w400 : FontWeight.w500,
                                )
                            ),
                            onPressed: () {
                              setState(() {
                                all_selected=false;
                                sports_selected = false;
                                finance_selected = false;
                                politics_selected = true;
                                business_selected = false;
                              });
                              _runFilter_category("Politics");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              primary: politics_selected ? Color.fromRGBO(180, 25, 25, 1) : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          ElevatedButton.icon(
                            icon: SvgPicture.asset("assets/icons/business.svg",width: 24,height: 24),
                            label: Text('Business',
                                style: GoogleFonts.raleway(
                                  color : business_selected ? Colors.white : Color.fromRGBO(133, 137, 143, 1),
                                  fontSize: 14,
                                  fontWeight: all_selected ? FontWeight.w400 : FontWeight.w500,
                                )
                            ),
                            onPressed: (){
                              setState(() {
                                all_selected=false;
                                sports_selected = false;
                                finance_selected = false;
                                politics_selected = false;
                                business_selected = true;
                              });
                              _runFilter_category("Business");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              primary: business_selected ? Color.fromRGBO(180, 25, 25, 1) : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Spacer(),

                //Popular Events
                Container(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Popular News",
                        style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(39, 39, 40, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal
                        )
                        //style: TextStyle(color: Color.fromRGBO(133, 137, 143, 1))
                        ,),
                    ],
                  ),

                ),



                SizedBox(height: 17),

                //Tweets
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
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

                                        //Like Button
                                        IconButton(
                                          onPressed: (){
                                            setState(() {

                                              if(_foundUsers[index]['liked']==false){
                                                _foundUsers[index]['likes']+=1;
                                                _foundUsers[index]['liked'] =true;}
                                              else if(_foundUsers[index]['liked']==true){
                                                _foundUsers[index]['likes']-=1;
                                                _foundUsers[index]['liked']=false;
                                              }
                                            });
                                          },

                                          icon:  Icon(
                                            _foundUsers[index]['liked']?Icons.favorite:Icons.favorite_border,
                                            color: _foundUsers[index]['liked']?Color.fromRGBO(180, 25, 25, 1):Color.fromRGBO(244, 244, 244, 1),
                                            size: 30,
                                          ),


                                        ),


                                        //Save Button
                                        IconButton(
                                          onPressed: (){},
                                          icon: const Icon(
                                            Icons.bookmark_border,
                                            color: Color.fromRGBO(244, 244, 244, 1),
                                            size: 25,

                                          ),
                                        ),


                                        //Share Button
                                        IconButton(
                                          onPressed: ()async{
                                            await Share.share(_foundUsers[index]['content']);
                                          },
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
                                          crossAxisAlignment: CrossAxisAlignment.center,

                                          children: [
                                            Icon(
                                              Icons.thumb_up,
                                              color: Colors.white70,
                                              size:20,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),

                                            Text(
                                              _foundUsers[index]['likes'].toString() + "  Likes",
                                              style:
                                              GoogleFonts.raleway(
                                                color: Colors.white70,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Icon(
                                              Icons.calendar_month_sharp,
                                              color: Colors.white70,
                                              size:20,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),


                                            Text(
                                              _foundUsers[index]['date'].toString(),
                                              style:
                                              GoogleFonts.raleway(
                                                color: Colors.white70,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                                      builder: (context) => new Tweet(
                                        Tweet_id:_foundUsers[index]['id'] ,
                                      )));
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