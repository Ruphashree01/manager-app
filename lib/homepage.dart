import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color indicatorColor = Color(0XFFF6890D);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        indicatorColor = _getIndicatorColor(_tabController.index);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Request List - Processing',
            style: GoogleFonts.inter(
              color: Color(0xFFFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Color(0xFF242F3E),
          toolbarHeight: 58,
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: indicatorColor,
              onTap: (index) {
                setState(() {
                  indicatorColor = _getIndicatorColor(index);
                });
              },
              tabs: [
                Tab(
                  child: Text('Processing',
                      style: GoogleFonts.inter(
                          color: Color(0XFFF6890D),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
                Tab(
                  child: Text('Approved',
                      style: GoogleFonts.inter(
                          color: Color(0XFF2B8ABA),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
                Tab(
                  child: Text('Rejected',
                      style: GoogleFonts.inter(
                          color: Color(0XFFFF4E4E),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
                Tab(
                  child: Text('Processed',
                      style: GoogleFonts.inter(
                          color: Color(0XFF00BC38),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            width: 403,
                            height: 365,
                            child: _form(),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F3F3),
                          ),
                          width: 403,
                          height: 365,
                        ),
                      ],
                    ),
                  ),
                  _summary(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getIndicatorColor(int index) {
    switch (index) {
      case 0:
        return Color(0XFFF6890D);
      case 1:
        return Color(0XFF2B8ABA);
      case 2:
        return Color(0XFFFF4E4E);
      case 3:
        return Color(0XFF00BC38);
      default:
        return Color(0xFFFFFFFF);
    }
  }

  Widget _form() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 140.54,
          height: 305,
          color: Color(0xFFFFFFFF),
          child: Column(
            children: [
              Container(
                width: 140,
                height: 228,
                color: Color(0xFFEDEDED),
                child: Center(
                    child: IconButton(
                  icon: Icon(
                    Icons.insert_photo,
                    size: 100,
                    color: Color(0xFF606060),
                  ),
                  onPressed: () {},
                )),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.cloud_upload,
                        size: 30, color: Color(0xFF0073BB)),
                    onPressed: () {},
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Scan/Upload receipt Image',
                    style: GoogleFonts.inter(
                        color: Color(0xFF0073BB),
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              _field(
                  label: "Date",
                  width: 235.43,
                  height: 40,
                  color: Color(0xFFB4B4B4)),
              _field(
                  label: "Description",
                  width: 235.43,
                  height: 40,
                  color: Color(0xFFB4B4B4)),
              _field(
                  label: "Bill No.",
                  width: 235.43,
                  height: 40,
                  color: Color(0xFFB4B4B4)),
              _field(
                  label: "Amount",
                  width: 235.43,
                  height: 40,
                  color: Color(0xFFB4B4B4)),
              _field(
                  label: "Category",
                  width: 235.43,
                  height: 40,
                  color: Color(0xFFB4B4B4)),
              _field(
                  label: "Merchant",
                  width: 235.43,
                  height: 40,
                  color: Color(0xFFB4B4B4)),
            ],
          ),
        )
      ]),
    );
  }

  Widget _field({
    required String label,
    required double width,
    required double height,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: color),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Widget _summary() {
    return Flexible(
      child: Container(
        color: Color(0xFFF2F3F3),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Color(0xFFFFFFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary:',
                    style: GoogleFonts.inter(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xFFC4C4C4),
                  ),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(0.2),
                      2: FlexColumnWidth(1),
                    },
                    children: [
                      _tableRow('Prepared Date', '27/09/2024'),
                      _tableRow('Number of Receipts', '3'),
                      _tableRow('Request Number', 'RCT034'),
                      _tableRow('Prepared By', 'Kumar'),
                      _tableRow('Total Amount', 'Rs.1520.25'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TableRow _tableRow(String label1, String label2) {
    return TableRow(
      children: [
        Container(
          height: 25,
          child: Text(
            label1,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            ),
          ),
        ),
        Container(
          height: 25,
          child: Text(
            ':',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            ),
          ),
        ),
        Container(
          height: 25,
          child: Text(
            label2,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            ),
          ),
        ),
      ],
    );
  }
}
