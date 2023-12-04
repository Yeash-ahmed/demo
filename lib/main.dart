import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BookListPage(),
  ));
}

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Book Bazar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            BookCard(
              bookName: 'The Da Vinci Code',
              authorName: 'Dan Brown',
              bookRating: '4.5',
              imageUrl:
                  'https://i.ebayimg.com/images/g/PhUAAOSweNNgiphk/s-l640.jpg',
              description:
                  'Description:The Da Vinci Code is a 2003 mystery thriller novel by Dan Brown. It is Brown\'s second novel to include the character Robert Langdon: the first was his 2000 novel Angels & Demons.',
              price: '\$15.99',
            ),
            SizedBox(height: 16.0),
            BookCard(
              bookName: 'Blood Gospel',
              authorName: 'James Rollins and Rebecca Cantrell',
              bookRating: '4.2',
              imageUrl:
                  'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1357605320i/15818164.jpg',
              description:
                  'Description:Blood Gospel is a novel by James Rollins and Rebecca Cantrell. It is the first installment in the Order of the Sanguines series.',
              price: '\$12.50',
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final String imageUrl;
  final String description;
  final String price;

  const BookCard({
    required this.bookName,
    required this.authorName,
    required this.bookRating,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    width: 80,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          fontFamily: 'Beyond Wonderland',
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(authorName),
                      SizedBox(height: 4.0),
                      Text('Rating: $bookRating'),
                      SizedBox(height: 8.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuyNowPage(
                                bookName: bookName,
                                authorName: authorName,
                                imageUrl: imageUrl,
                                description: description,
                                price: price,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text('Buy Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String imageUrl;
  final String description;
  final String price;

  const BuyNowPage({
    required this.bookName,
    required this.authorName,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      backgroundColor: Colors.amberAccent,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'Beyond Wonderland',
              ),
            ),
            SizedBox(height: 8.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text('Author: $authorName'),
            SizedBox(height: 8.0),
            Text(description),
            SizedBox(height: 8.0),
            Text('Price: $price'),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Add functionality when dropdown value changes
              },
              hint: Text('Select an option'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
