import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/features/air_freight_service/data/models/air_freight_data.dart';
import 'package:khalsha/features/air_freight_service/domain/use_cases/add_air_freight_use_case.dart';
import 'package:khalsha/features/air_freight_service/domain/use_cases/update_air_freight_use_case.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../core/data/models/item_model.dart';
import '../../../core/service_utils.dart';
import '../../core/domain/use_cases/download_file_use_case.dart';
import '../../core/domain/use_cases/get_particular_env_data_use_case.dart';
import '../../core/inputs_style.dart';
import '../../core/presentation/routes/app_routes.dart';
import '../../core/presentation/themes/colors_manager.dart';
import '../../core/utils.dart';
import '../../injection_container.dart';
import '../map/data/model/location_details.dart';
import '../marine_shipping/marine_shipping.dart';
import '../orders/domain/entities/order_model.dart';
import '../widgets/bottom_sheet_content/choose_certificates.dart';
import '../widgets/bottom_sheet_content/choose_shipping_place.dart';
import '../widgets/custom_button.dart';
import '../widgets/headline_bottom_sheet.dart';
import '../widgets/inputs/attach_file_with_holder.dart';
import '../widgets/inputs/checker_with_holder.dart';
import '../widgets/inputs/choose_item_with_holder.dart';
import '../widgets/inputs/drop_down_input_with_holder.dart';
import '../widgets/inputs/text_field_input_with_drop_down_with_holder.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';
import '../widgets/inputs/toggle_item_with_holder.dart';
import '../widgets/service_content.dart';
import '../widgets/steps/additional_service_step_view.dart';
import '../widgets/steps/fill_data_step_view.dart';
import '../widgets/steps/order_send_successfully_step_view.dart';
import 'data/models/air_freight_item_details_model.dart';

part 'presentation/bottom_sheets/add_item_details_sheet.dart';
part 'presentation/get/bindings/binding.dart';
part 'presentation/get/controllers/controller.dart';
part 'presentation/view.dart';
