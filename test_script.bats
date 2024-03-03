#!/usr/bin/env bash

# Load the script containing the functions to be tested
load '/Users/ivylu/Desktop/bash-testing/test_script.sh'  # Modify the path to point to the actual script to be tested

# Test case 1: Test the generate_vulnerability_report function
@test "Test generate_vulnerability_report function" {
  run generate_vulnerability_report
  [ "$status" -eq 0 ]
  [ "$output" = "Generating vulnerability report for Kubeflow images..." ]
}

# Test case 2: Test the save_vulnerability_report function
@test "Test save_vulnerability_report function" {
  local vulnerability_report="This is a sample vulnerability report for Kubeflow images."
  run save_vulnerability_report "$vulnerability_report"
  [ "$status" -eq 0 ]
  [ -f "../docs/image_lists/kf_${version}_vulnerability_report.txt" ]
  [ "$(cat "../docs/image_lists/kf_${version}_vulnerability_report.txt")" = "$vulnerability_report" ]
}
