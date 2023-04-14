import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../core/data/models/item_model.dart';
import '../../core/inputs_style.dart';
import '../../core/presentation/themes/colors_manager.dart';
import '../../core/service_utils.dart';
import '../widgets/bottom_sheet_content/choose_shipping_place.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/headline_bottom_sheet.dart';
import '../widgets/inputs/attach_file_with_holder.dart';
import '../widgets/inputs/checker_with_holder.dart';
import '../widgets/inputs/choose_item_with_holder.dart';
import '../widgets/inputs/choose_number_with_holder.dart';
import '../widgets/inputs/text_field_input_with_drop_down_with_holder.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';
import '../widgets/inputs/toggle_item_with_holder.dart';
import '../widgets/service_content.dart';
import '../widgets/steps/additional_service_step_view.dart';
import '../widgets/steps/confirm_order_step_view.dart';
import '../widgets/steps/fill_data_step_view.dart';
import '../widgets/steps/order_send_successfully_step_view.dart';
import 'get/controllers/controller.dart';

part 'bottom_sheets/add_bundled_goods_marine_shipping_sheet.dart';
part 'bottom_sheets/add_parcel_marine_shipping_sheet.dart';
part 'view.dart';
