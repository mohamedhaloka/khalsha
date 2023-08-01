import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/extentions/format_time_extention.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/land_shipping/data/models/land_shipping_data.dart';
import 'package:khalsha/features/land_shipping/data/models/loading_unloading_locations_model.dart';
import 'package:khalsha/features/land_shipping/domain/use_cases/add_land_shipping_use_case.dart';
import 'package:khalsha/features/land_shipping/domain/use_cases/update_land_shipping_use_case.dart';
import 'package:khalsha/features/widgets/inputs/attach_file_with_holder.dart';
import 'package:khalsha/features/widgets/inputs/drop_down_input_with_holder.dart';
import 'package:khalsha/features/widgets/steps/confirm_order_step_view.dart';
import 'package:khalsha/features/widgets/stylish_text.dart';
import 'package:khalsha/injection_container.dart';

import '../../core/data/models/data_model.dart';
import '../../core/data/source/local/lang_locale.dart';
import '../../core/domain/use_cases/download_file_use_case.dart';
import '../../core/domain/use_cases/get_particular_env_data_use_case.dart';
import '../../core/inputs_style.dart';
import '../../core/presentation/routes/app_routes.dart';
import '../../core/presentation/utils/custom_date_time_picker_model.dart';
import '../../core/service_utils.dart';
import '../../core/utils.dart';
import '../map/data/model/location_details.dart';
import '../orders/domain/entities/order_model.dart';
import '../service_intro/presentation/get/controllers/controller.dart';
import '../widgets/bottom_sheet_content/dismantling_and_installation_service.dart';
import '../widgets/bottom_sheet_content/multi_items_list.dart';
import '../widgets/bottom_sheet_content/set_number_count.dart';
import '../widgets/custom_button.dart';
import '../widgets/inputs/choose_item_with_holder.dart';
import '../widgets/inputs/service_item_with_holder.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';
import '../widgets/inputs/toggle_item_with_holder.dart';
import '../widgets/inputs/yes_or_no_with_holder.dart';
import '../widgets/service_content.dart';
import '../widgets/steps/additional_service_step_view.dart';
import '../widgets/steps/fill_data_step_view.dart';
import '../widgets/steps/order_send_successfully_step_view.dart';
import '../widgets/steps/pick_locations_step_view.dart';
import 'data/models/bundled_goods_model.dart';
import 'data/models/land_shipping_service_model.dart';

part 'presentations/get/bindings/binding.dart';
part 'presentations/get/controllers/controller.dart';
part 'presentations/view.dart';
part 'presentations/widgets/bundled_goods_inputs.dart';
part 'presentations/widgets/loading_unloading_locations.dart';
part 'presentations/widgets/private_transfer_inputs.dart';
