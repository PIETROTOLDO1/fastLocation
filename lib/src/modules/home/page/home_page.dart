import 'package:flutter/material.dart';
import 'package:fastlocation/src/modules/home/components/search_address.dart';
import 'package:fastlocation/src/modules/home/components/search_empty.dart';
import 'package:fastlocation/src/modules/home/controller/home_controller.dart';
import 'package:fastlocation/src/routes/app_router.dart';
import 'package:fastlocation/src/shared/colors/app_colors.dart';
import 'package:fastlocation/src/shared/components/app_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void searchCep(value) async {
    try {
      Navigator.pop(context);
      await controller.getAddress(value.replaceAll('-', ''));
      setState(() {});
    } catch(_) {
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao buscar cep '$value'"))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView( 
        child: SafeArea(
          child: Center(
            child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 25,
              right: 25,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.multiple_stop, size: 35, color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Fast Location',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        ),
                    )
                  ],
                ),
                Padding(padding: const EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10
                        ),
                        child: controller.lastAddress == null ? const SearchEmpty() : SearchAddress(address: controller.lastAddress!),
                      ),
                    ),
                  ),
                ),
                AppButton(
                  label: 'Localizar endereço',
                  action: () {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          content: SizedBox(
                            height: 120,
                            child: Column(
                              children: [
                                TextFormField(
                                  enabled: true,
                                  controller:  _textEditingController,
                                  textAlign: TextAlign.start,
                                  autofocus: false,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text('Digite o CEP')
                                  ),
                                  onFieldSubmitted: (value) async => searchCep(value),
                                ),
                                AppButton(
                                  label: 'Buscar',
                                  action: () {
                                    searchCep(_textEditingController.text);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.place,
                        color: Colors.green,
                      ),
                      Text(
                        'Últimos endereços localizados', 
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                controller.lastAddress == null
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Column(
                          children: [
                            Icon(Icons.location_off, color: Colors.green, size: 50,),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Não há locais recentes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.signpost, size: 30, color: Colors.grey,),
                      title: 
                        Text(controller.lastAddress!.neighborhood, 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      subtitle: 
                        Text(controller.lastAddress!.publicPlace, 
                        style: const TextStyle(fontSize: 14),),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${controller.lastAddress!.city}/${controller.lastAddress!.state}", 
                            style: const TextStyle(fontSize: 12),),
                          Text(controller.lastAddress!.cep, 
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),)
                        ],
                      ),
                    ),
                  ),
                AppButton(
                  label: 'Histórico de endereços', 
                  action: () {
                    Navigator.of(context).pushNamed(AppRouter.history);
                  },
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 40,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        onPressed: controller.lastAddress == null
            ? null
            : () async {
              List<Location> locations = await locationFromAddress("${controller.lastAddress!.publicPlace}, ${controller.lastAddress!.neighborhood}");
              await MapLauncher.showDirections(
                mapType: MapType.google,
                destination: Coords(locations[0].latitude, locations[0].longitude),
              );
            },
        child: const Icon(
          Icons.fork_right,
          color: Colors.white,
          size: 45,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}