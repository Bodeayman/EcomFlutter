import 'package:flutter/material.dart';

FormFieldValidator normalValidatorFunction = (value) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter your email";
  }
  return null;
};
