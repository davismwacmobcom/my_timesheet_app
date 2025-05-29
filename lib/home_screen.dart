import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../common_functions/one_signal_service.dart';
import '../di/main_di.dart';
import '../get_it/get_it.dart';

class HomeScreen extends StatefulWidget {


  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String longText = 'Refer a Nurse to us and receive €300 Refer a Nurse to us and receive €300';
  final CarouselController _controller = CarouselController();
  int activeIndex = 0;

  final List<Map<String, String>> imgList = [
    {
      'title': 'Mountain Landscape',
      'url': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
    },
    {
      'title': 'Ocean Sunset',
      'url': 'https://images.unsplash.com/photo-1513553404607-988bf2703777',
    },
    {
      'title': 'Forest Path',
      'url': 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e',
    },
    {
      'title': 'Desert Dunes',
      'url': 'https://images.unsplash.com/photo-1547234935-80c7145ec969',
    },
    {
      'title': 'Snow Peaks',
      'url': 'https://images.unsplash.com/photo-1579202673506-ca3ce28943ef',
    },
  ];
  @override
  void initState() {
    //init();
    super.initState();

    // ✅ Set status bar to transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make status bar transparent
        statusBarIconBrightness: Brightness.light, // White icons for dark backgrounds
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPaddingForAppbar = MediaQuery.of(context).padding.top + 16;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background Image with Content on top
            Stack(
              children: [
                // Background Image
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // App Bar
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: topPaddingForAppbar,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          context.push(
                            '/menu-screen',
                          );
                        },
                        child: SvgPicture.asset(
                            'assets/icons/xpress_home_menu.svg',
                          height: 28,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home_message.svg',
                            height: 28,
                          ),
                          SizedBox(width: 16),
                          SvgPicture.asset(
                            'assets/icons/home_call.svg',
                            height: 28
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Title
                Positioned(
                  left: 16,
                  top: 140,
                  child: Text(
                    'Happy Christmas!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(height: 200),
                    // User Profile Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: const AssetImage('assets/images/profile_pic.png'),
                                        backgroundColor: Colors.grey[300],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Text(
                                          '10%',
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Neha Samuel',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.download, size: 14),
                                          SizedBox(width: 4),
                                          Text(
                                            'Virtual ID',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Icon(Icons.star, color: Colors.amber, size: 16),
                                        ],
                                      ),
                                      const Text(
                                        '12 Reviews',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Divider(),
                              Row(
                                children: [
                                  const Icon(Icons.warning, color: Colors.red, size: 16),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Documents expired. Access restricted!',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text(
                                      'View more',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '€61.88',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'Total Balance',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Icon(Icons.chevron_right, color: Colors.green),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),
                    // Documentation Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Documentation',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text(
                                      'See all',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.description_outlined, color: Colors.green),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Healthy and Safety',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Please upload Healthy and Safety documents',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(Icons.warning, color: Colors.red, size: 16),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 48, top: 8),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                    'View more',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Important Update Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Important Update',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '€300 Referral Bonus!',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Refer a Nurse to us and receive €300...',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                minimumSize: Size.zero,
                                                padding: EdgeInsets.zero,
                                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              ),
                                              child: const Text(
                                                'Read more',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: const [
                                            Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                                            SizedBox(width: 4),
                                            Text(
                                              '10-08-2025',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.green[50],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        const Icon(
                                          Icons.monetization_on_outlined,
                                          color: Colors.green,
                                          size: 32,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Upcoming Shifts Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Upcoming Shifts',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[50],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.access_time, color: Colors.blue),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Morning Shift - Hospital ABC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '28 Dec 2025, 08:00 - 16:00',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.purple[50],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.access_time, color: Colors.purple),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Night Shift - Clinic XYZ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '30 Dec 2025, 22:00 - 06:00',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Payment History Card
                    SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Payment History',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.green[50],
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.payments_outlined, color: Colors.green),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'November Payment',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            'Processed on 5 Dec 2025',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '€1,245.30',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.green[50],
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.payments_outlined, color: Colors.green),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'October Payment',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            'Processed on 5 Nov 2025',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '€987.65',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Add bottom padding to ensure content is not cut off
                    SizedBox(height: 24),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CarouselSlider.builder(
                          itemCount: imgList.length,
                          itemBuilder: (context, index, realIndex) {
                            final urlImage = imgList[index]['url']!;
                            return buildImage(urlImage, index);
                          },
                          options: CarouselOptions(
                            height: 220, // Adjust height to suit your design
                            autoPlay: true,
                            enlargeCenterPage: false,
                            viewportFraction: 0.90, // 👈 Shows part of next/prev image
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                        ),
                        SizedBox(height: 20),
                        buildIndicator(),
                        SizedBox(height: 20),
                        buildCard(),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard() => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '€300 Referral Bonus!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(height: 8),
                    ReadMoreText(
                      longText,
                      trimLines: 2,
                      colorClickableText: Colors.blue,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Read more',
                      trimExpandedText: '',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Color(0xff019B5B)),
                      lessStyle: TextStyle(height: 0),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calender_2.svg',
                          height: 16,
                          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)
                        ),
                        SizedBox(width: 4),
                        Text(
                          DateFormat('dd-MM-yyyy').format(DateTime(2025, 8, 10)),
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                ),
              ),
              height: 142,
              width: 130,
              child: Stack(
                children: [
                  Image.asset(
                   height: 180,
                    'assets/images/gradient.png',
                  ),
                  Image.asset(
                    'assets/images/handimage.png',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget buildImage(String urlImage, int index) => GestureDetector(
    onTap: () async {
      final returnedIndex = await context.push<int>(
        '/details/$index',
        extra: urlImage,
      );

      if (returnedIndex != null) {
        setState(() {
          activeIndex = returnedIndex;
        });
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: urlImage,
          placeholder: (context, url) => Image.asset(
            'assets/images/placeholder.png', // ✅ Your local placeholder
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          errorWidget: (context, url, error) => Image.asset(
            'assets/images/placeholder.png', // ✅ Your local error image
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
  );


  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: imgList.length,
    effect: ExpandingDotsEffect(
      dotWidth: 10,
      dotHeight: 10,
      activeDotColor: Colors.blue,
    ),
  );
}
