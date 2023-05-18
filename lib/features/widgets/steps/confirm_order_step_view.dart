import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/land_shipping/land_shipping.dart';

import '../inputs/text_field_input_with_holder.dart';

class ConfirmOrderStepView
    extends GetView<AddEditLandShippingServiceController> {
  const ConfirmOrderStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/confirm-service.svg',
        ),
        const SizedBox(height: 20),
        FormBuilderField(
          builder: (FormFieldState<dynamic> field) => TextFieldInputWithHolder(
            hint: recipientNameTitle,
            controller: controller.recipientName,
            onSaved: (String? value) => field.didChange(value),
            errorText: field.errorText,
          ),
          validator: FormBuilderValidators.required(),
          name: LandShipmentInputsKeys.recipientName.name,
        ),
        FormBuilderField(
          builder: (FormFieldState<dynamic> field) => TextFieldInputWithHolder(
            hint: 'رقم الجوال',
            controller: controller.recipientMobile,
            keyboardType: TextInputType.number,
            onSaved: (String? value) => field.didChange(value),
            errorText: field.errorText,
          ),
          validator: FormBuilderValidators.required(),
          name: LandShipmentInputsKeys.recipientMobile.name,
        ),
      ],
    );
  }

  String get recipientNameTitle {
    if (controller.shippingType.value == 0) return 'اسم المستلم';
    return 'اسم الشخص المسئول';
  }
}
