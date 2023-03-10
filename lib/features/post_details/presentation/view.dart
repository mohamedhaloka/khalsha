import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/colors_manager.dart';
import '../../widgets/back_icon.dart';
import '../../widgets/sliver_body.dart';
import 'get/controllers/controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  const PostDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).viewPadding.top;
    return SliverBody(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/dummy/big-post-image.jpg',
            fit: BoxFit.cover,
            width: Get.width,
          ),
          Container(
            color: ColorManager.primaryColor.withOpacity(.1),
          ),
          Positioned(
            top: statusBar + 20,
            left: 20,
            child: const BackIconButton(),
          )
        ],
      ),
      toolbarHeight: 0,
      padding: EdgeInsets.zero,
      collapsedHeight: 0,
      expandedHeight: 300,
      child: SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Text(
                  'الشحن الجوي للمملكة السعودية',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: ColorManager.secondaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Divider(
                  height: 40,
                  color: ColorManager.greyColor,
                ),
                Text(
                  '''من خلال شبكتها العالمية الواسعة من أربع قارات و 225 وجهة دولية و 26 وجهة محلية، تدير أسطولًا متخصصًا من سفن الشحن وتوفر سعة نقل كبيرة عبر آسيا وأفريقيا وأوروبا والولايات المتحدة الأمريكية.
ومع استمرار أعمال الشحن توسعت مع المحافظة على سمعتها كواحد من أكبر اللاعبين في العالم في سوق الشحن الجوي، عرفت بكفاءتها وموثوقيتها، وتوفير اتصالات آمنة ومريحة من خلال مراكزنا المحلية والدولية. ساعدها موقعها استراتيجيا في المملكة العربية السعودية، حيث تعتبر جسر بين الشرق والغرب من خلال مراكزها، مما يتيح لها المزيد من المرونة لاستخدام قدراتها بكفاءة وتسليم البضائع الخاصة بالعملاء مع الحد الأدنى من وقت المناولة الأرضية.

من خلال شبكتها العالمية الواسعة من أربع قارات و 225 وجهة دولية و 26 وجهة محلية، تدير أسطولًا متخصصًا من سفن الشحن وتوفر سعة نقل كبيرة عبر آسيا وأفريقيا وأوروبا والولايات المتحدة الأمريكية.
ومع استمرار أعمال الشحن توسعت مع المحافظة على سمعتها كواحد من أكبر اللاعبين في العالم في سوق الشحن الجوي، عرفت بكفاءتها وموثوقيتها، وتوفير اتصالات آمنة ومريحة من خلال مراكزنا المحلية والدولية. ساعدها موقعها استراتيجيا في المملكة العربية السعودية، حيث تعتبر جسر بين الشرق والغرب من خلال مراكزها، مما يتيح لها المزيد من المرونة لاستخدام قدراتها بكفاءة وتسليم البضائع الخاصة بالعملاء مع الحد الأدنى من وقت المناولة الأرضية.

من خلال شبكتها العالمية الواسعة من أربع قارات و 225 وجهة دولية و 26 وجهة محلية، تدير أسطولًا متخصصًا من سفن الشحن وتوفر سعة نقل كبيرة عبر آسيا وأفريقيا وأوروبا والولايات المتحدة الأمريكية.
ومع استمرار أعمال الشحن توسعت مع المحافظة على سمعتها كواحد من أكبر اللاعبين في العالم في سوق الشحن الجوي، عرفت بكفاءتها وموثوقيتها، وتوفير اتصالات آمنة ومريحة من خلال مراكزنا المحلية والدولية. ساعدها موقعها استراتيجيا في المملكة العربية السعودية، حيث تعتبر جسر بين الشرق والغرب من خلال مراكزها، مما يتيح لها المزيد من المرونة لاستخدام قدراتها بكفاءة وتسليم البضائع الخاصة بالعملاء مع الحد الأدنى من وقت المناولة الأرضية.

من خلال شبكتها العالمية الواسعة من أربع قارات و 225 وجهة دولية و 26 وجهة محلية، تدير أسطولًا متخصصًا من سفن الشحن وتوفر سعة نقل كبيرة عبر آسيا وأفريقيا وأوروبا والولايات المتحدة الأمريكية.
ومع استمرار أعمال الشحن توسعت مع المحافظة على سمعتها كواحد من أكبر اللاعبين في العالم في سوق الشحن الجوي، عرفت بكفاءتها وموثوقيتها، وتوفير اتصالات آمنة ومريحة من خلال مراكزنا المحلية والدولية. ساعدها موقعها استراتيجيا في المملكة العربية السعودية، حيث تعتبر جسر بين الشرق والغرب من خلال مراكزها، مما يتيح لها المزيد من المرونة لاستخدام قدراتها بكفاءة وتسليم البضائع الخاصة بالعملاء مع الحد الأدنى من وقت المناولة الأرضية.''',
                  style: Get.textTheme.titleSmall!.copyWith(
                    color: ColorManager.greyColor,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
