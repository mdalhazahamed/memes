import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_memes/feature/home/domain/entities/get_memes_entity.dart';
import 'package:get_memes/feature/home/presentation/bloc/get_category_bloc.dart';
import 'package:get_memes/router/routing_variables.dart';

import '../../../../constants/app_constant.dart';
import '../../../../constants/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetMemesBloc getMemesBloc = GetMemesBloc();
  List<GetMemesEntity> memes = [];
  List<GetMemesEntity> backup = [];
  @override
  void initState() {
    getMemesBloc.add(RequestGetMemesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        //toolbarHeight: 65,
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 20,
            color: AppConstant.whiteColor,
            fontWeight: FontWeight.w300,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      //prefixIcon: Icon(Icons.search, color: Colors.grey),

                      hintText: "Search For Images",
                      hintStyle: ConstantTextStyles.subTitle14(
                        context,
                        Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: Color(0xFF38445D),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: AppConstant.primaryColor,
                          )),
                      fillColor: AppConstant.neutral5,
                      filled: true,
                    ),
                    onChanged: (value) {
                      memes = List.from(backup);
                      memes.clear();
                      for (var i = 0; i < backup.length; i++) {
                        if (backup[i].name!.toLowerCase().contains(value.toLowerCase())) {
                          setState(() {
                            memes.add(backup[i]);
                          });
                        }
                      }
                    },
                  ),
                )),
            const SizedBox(height: 10),
            BlocListener(
              child: Container(),
              bloc: getMemesBloc,
              listener: (context, state) {
                if (state is GetMemesSuccessState) {
                  memes = state.getMemesResponseEntity.memes!;
                  backup = state.getMemesResponseEntity.memes!;
                }
                ;
              },
            ),
            BlocBuilder(
                bloc: getMemesBloc,
                builder: (context, state) {
                  if (state is GetMemesSuccessState) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: memes.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Navigation.detailsPage, arguments: memes[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 0.4, color: Colors.grey),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 14),
                                  Image.network(
                                    memes[index].url.toString(),
                                  ),
                                  const SizedBox(height: 14),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppConstant.neutral20,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          memes[index].name.toString(),
                                          style: ConstantTextStyles.bodyBold16(
                                            context,
                                            Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}
