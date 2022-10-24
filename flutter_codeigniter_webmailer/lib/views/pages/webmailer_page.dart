part of 'pages.dart';

class Webmailer extends StatefulWidget {
  const Webmailer({super.key});

  @override
  State<Webmailer> createState() => _WebmailerState();
}

final _webmailerKey = GlobalKey<FormState>();
final emailController = TextEditingController();
String emailValue = '';

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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Verifikasi Akun',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w700),
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
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        !EmailValidator.validate(value.toString())
                            ? 'Surel tidak sah. Silakan coba lagi.'
                            : null,
                    onChanged: (value) {
                      emailValue = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      hintText: 'johndoe@gmail.com',
                      labelText: 'Surel',
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
                        if (emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Mohon isi kolom surel terlebih dahulu.',
                              ),
                              action: SnackBarAction(
                                  label: 'Tutup', onPressed: () {}),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Mengirim verifikasi ke $emailValue. Mohon cek surel Anda.',
                              ),
                            ),
                          );
                          await EmailService.sendMail(
                                  emailController.text.toString())
                              .then(
                            (value) {
                              var result = json.decode(value.body);
                              if (result['status'] == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      result['message'],
                                    ),
                                    action: SnackBarAction(
                                        label: 'Tutup', onPressed: () {}),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      result['message'],
                                    ),
                                    action: SnackBarAction(
                                        label: 'Tutup', onPressed: () {}),
                                  ),
                                );
                              }
                            },
                          );
                        }
                      },
                      icon: const Icon(Icons.send_outlined),
                      label: const Text('Verifikasi Akun'),
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
