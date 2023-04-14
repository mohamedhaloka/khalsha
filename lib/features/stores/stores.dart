import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/counter_component.dart';

import '../../core/service_utils.dart';
import '../widgets/bottom_sheet_content/choose_date_time_sheet.dart';
import '../widgets/bottom_sheet_content/multi_items_list.dart';
import '../widgets/inputs/checker_with_holder.dart';
import '../widgets/inputs/choose_item_with_holder.dart';
import '../widgets/inputs/input_holder_box.dart';
import '../widgets/inputs/service_item_with_holder.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';
import '../widgets/inputs/toggle_item_with_holder.dart';
import '../widgets/service_content.dart';
import '../widgets/steps/additional_service_step_view.dart';
import '../widgets/steps/confirm_order_step_view.dart';
import '../widgets/steps/fill_data_step_view.dart';
import '../widgets/steps/order_send_successfully_step_view.dart';
import 'get/controllers/controller.dart';

part 'steps/shipping_details_step_view.dart';
part 'view.dart';
