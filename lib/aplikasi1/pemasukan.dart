import 'package:flutter/material.dart';
import 'pengeluaran.dart';

class pemasukan extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<pemasukan> {
  bool isPemasukanSelected = true; // Tracks whether "Pemasukan" is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            // Background and content
            SingleChildScrollView(
              child: Container(
                color: Colors.grey[200], // Background abu-abu untuk seluruh layar
                child: Column(
                  children: [
                    // Top section with user info and balance
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue, // Bagian atas tetap biru
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                        bottom: 80,
                      ), // Add bottom padding to make room for buttons
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Hi, Mas Fuad Mandalika!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 50),
                          Center(
                            child: Text(
                              'Rp. 10.000.000,00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5), // Reduced spacing
                          Center(
                            child: Text(
                              'Total saldo Anda',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Add spacing before "Pendapatan Bulan Ini" box
                    SizedBox(height: 20), // Adjust this value to move the box further down

                    // Remaining content (grey section)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Colors.white, // Kontainer tetap putih
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pendapatan Bulan ini',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              'Rp. 5.000.000,00',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Image.asset('lib/aplikasi1/gambarpemasukan.png', height: 200, fit: BoxFit.cover),
                          ],
                        ),
                      ),
                    ),
                    // Teks "Pendapatan terakhir lu" di luar background putih dan di sebelah kiri
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pendapatan terakhir lu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Spasi antara teks dan kotak transaksi

                    // Recent Transactions with white background
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(

                          color: Colors.white, // Background putih
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TransactionItem(
                              icon: Icons.coffee_maker_rounded,
                              name: 'Maju Jaya Coffee',
                              date: 'October 4, 2024',
                              amount: 'Rp.1.600.000',
                            ),
                            TransactionItem(
                              icon: Icons.build_rounded,
                              name: 'Zeus Motorworks',
                              date: 'October 4, 2024',
                              amount: 'Rp.2.000.000',
                            ),
                            TransactionItem(
                              icon: Icons.design_services_rounded,
                              name: 'Freelance Design',
                              date: 'October 4, 2024',
                              amount: 'Rp.800.000',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Two Buttons inside a single box with white background
            Positioned(
              top: 240, // Adjust this value to position the buttons exactly at the boundary
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background putih untuk tombol
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPemasukanSelected = true; // Select Pemasukan
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          decoration: BoxDecoration(
                            color: isPemasukanSelected ? Colors.greenAccent : Colors.transparent,
                            border: Border.all(
                              color: isPemasukanSelected ? Colors.greenAccent : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Pemasukan',
                            style: TextStyle(
                              color: isPemasukanSelected ? Colors.white : Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPemasukanSelected = false;
                            Navigator.push( // Navigate to PengeluaranPage
                              context,
                              MaterialPageRoute(builder: (context) => pengeluaran()),
                            );
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          decoration: BoxDecoration(
                            color: !isPemasukanSelected ? Colors.redAccent : Colors.transparent,
                            border: Border.all(
                              color: !isPemasukanSelected ? Colors.redAccent : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Pengeluaran',
                            style: TextStyle(
                              color: !isPemasukanSelected ? Colors.white : Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white), // Ubah warna ikon + menjadi putih
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background putih untuk bottom navigation bar
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Bulat di atas
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, -2), // Mengatur posisi bayangan
              ),
            ],
          ),
          child: BottomNavigationBar( // Background putih untuk bottom navigation bar
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart_rounded),
                label: 'Statistik',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded),
                label: 'Berita',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded),
                label: 'Profil',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true, // Menampilkan label untuk ikon yang tidak dipilih
          ),
        )
    );
  }
}
class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String date;
  final String amount;

  TransactionItem({
    required this.icon,
    required this.name,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(name),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}