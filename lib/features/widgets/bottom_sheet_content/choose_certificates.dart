import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

class ChooseCertificates extends StatefulWidget {
  const ChooseCertificates(this.certificates, {Key? key}) : super(key: key);
  final List<DataModel> certificates;

  @override
  State<ChooseCertificates> createState() => _ChooseCertificatesState();
}

class _ChooseCertificatesState extends State<ChooseCertificates> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Text(
          'مجموعة من الشهادات الازمة تتضمن جميع التفاصيل والمتطلبات التي تطلبها المنافذ الجمركية وتتضمن سلامة جودة المنتجات المستوردة او المصدرة',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorManager.secondaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const Divider(),
        const Text(
          'حدد الشهادات المراد إستخراجها',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorManager.greyColor,
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (_, int index) => Row(
            children: [
              InkWell(
                onTap: () => widget.certificates[index]
                    .selected(!widget.certificates[index].selected.value),
                child: Obx(() => SizedBox(
                      width: 25,
                      height: 25,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Get.theme.primaryColor),
                          color: widget.certificates[index].selected.value
                              ? Get.theme.primaryColor
                              : Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
              const SizedBox(width: 20),
              Text(
                widget.certificates[index].name,
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: ColorManager.greyColor,
                ),
              )
            ],
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemCount: widget.certificates.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              bool selectAnyCertificate = false;
              for (var element in widget.certificates) {
                if (element.selected.value) {
                  selectAnyCertificate = true;
                  break;
                }
              }

              Get.back(result: selectAnyCertificate);
            },
          ),
        )
      ],
    );
  }
}
