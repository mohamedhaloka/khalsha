import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/models/laboratory_data.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/models/order_item_model.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/use_case/add_laboratory_use_case.dart';
import 'package:khalsha/features/laboratory_and_standards_service/presentation/bottom_sheets/order_items_sheet.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/use_cases/download_file_use_case.dart';
import 'package:khalsha/core/domain/use_cases/get_particular_env_data_use_case.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';
import 'package:khalsha/features/widgets/bottom_sheet_content/choose_certificates.dart';
import 'package:khalsha/features/widgets/inputs/attach_file_with_holder.dart';
import 'package:khalsha/features/widgets/inputs/checker_with_holder.dart';
import 'package:khalsha/features/widgets/inputs/service_item_with_holder.dart';
import 'package:khalsha/features/widgets/inputs/text_field_input_with_holder.dart';
import 'package:khalsha/features/widgets/service_content.dart';
import 'package:khalsha/features/widgets/steps/additional_service_step_view.dart';
import 'package:khalsha/features/widgets/steps/fill_data_step_view.dart';
import 'package:khalsha/features/widgets/steps/order_send_successfully_step_view.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/use_case/update_laboratory_use_case.dart';

part 'presentation/get/bindings/binding.dart';
part 'presentation/get/controllers/controller.dart';
part 'presentation/view.dart';
