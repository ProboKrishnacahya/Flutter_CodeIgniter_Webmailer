part of 'pages.dart';

class Webmailer extends StatefulWidget {
  const Webmailer({super.key});

  @override
  State<Webmailer> createState() => _WebmailerState();
}

final _webmailerKey = GlobalKey<FormState>();
final emailController = TextEditingController();

@override
void dispose() {
  emailController.dispose();
}

class _WebmailerState extends State<Webmailer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Flutter Code Igniter Webmailer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Send Email',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Form(
              key: _webmailerKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        !EmailValidator.validate(value.toString())
                            ? 'Invalid Email. Please try again.'
                            : null,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'johndoe@gmail.com',
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await EmailService.sendMail(
                                emailController.text.toString())
                            .then(
                          (value) {
                            var result = json.decode(value.body);
                            print(result);
                          },
                        );
                      },
                      icon: const Icon(Icons.send_outlined),
                      label: const Text('Send'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
