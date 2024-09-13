import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:quote_generator/screens/api.dart';
import 'package:quote_generator/screens/quote_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool inprogress = false;
  QuoteModel? quote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Quotes",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'monospace',
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                Text(
                  quote?.q ?? "....",
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'monospace',
                      color: Colors.white54),
                ),
                Text(
                  quote?.a ?? ".........",
                  style: const TextStyle(
                    fontFamily: 'serif',
                    fontSize: 20,
                    color: Color.fromARGB(136, 9, 230, 16),
                  ),
                ),
                const Spacer(),
                inprogress
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _fetchQuote();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 5, 155, 155)),
                        child: const Text(
                          "Generate",
                          style: TextStyle(color: Colors.black87),
                        ),
                      )
              ],
            ),
          ),
        ));
  }

  _fetchQuote() async {
    setState(() {
      inprogress = true;
    });
    try {
      final fetchedQuote = await APi.fetchRandomQuote();
      debugPrint(fetchedQuote.toJson().toString());
      setState(() {
        quote = fetchedQuote;
      });
    } catch (e) {
      debugPrint("failed to generate  quote");
    } finally {
      setState(() {
        inprogress = false;
      });
    }
  }
}
