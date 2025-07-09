import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transfer/data/api_service.dart';
import 'package:transfer/data/app_secure_storage.dart';
import 'package:transfer/ui/app_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      title: 'Transfer App',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // This could be handled/injected by a DI system
  final _controller = AppController(apiService: ApiService(storage: AppSecureStorage()));

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.status == AppStatus.success) {
        _showDialog('Success', 'The operation was successful!');
      } else if (_controller.status == AppStatus.failure) {
        _showDialog('Error', 'The operation failed.');
      }
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              TextFormField(
                controller: _accountController,
                decoration: InputDecoration(label: Text('Account Number')),
                maxLength: 10,
                validator: (value) {
                  return value != null && value.isEmpty ? 'Please enter an account Number' : null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(label: Text('Amount')),
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  final amount = double.tryParse(value);
                  if (amount != null) {
                    return amount < 5000 ? 'Amount must be lower than 5,000' : null;
                  } else {
                    return 'Please enter a correct amount';
                  }
                },
              ),
              const SizedBox(height: 24),
              ListenableBuilder(
                listenable: _controller,
                builder: (_, _) {
                  return ElevatedButton(
                    onPressed: _controller.status == AppStatus.loading
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _controller.processTransfer(
                                account: _accountController.text,
                                amount: double.tryParse(_amountController.text) ?? 0,
                              );
                            }
                          },
                    child: Text('Transfer'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String title, String message) {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }
}
