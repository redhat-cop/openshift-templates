#!/usr/bin/env bats

@test "amq-broker" {
  run conftest test amq-broker --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
  
}

@test "app-build" {
  run conftest test app-build --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "app-deploy" {
  run conftest test app-deploy --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "app-example-ruby" {
  run conftest test app-example-ruby --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "jenkins" {
  run conftest test jenkins --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "jenkins-s2i-build" {
  run conftest test jenkins-s2i-build --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "imagestreams" {
  run conftest test imagestreams --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "jenkins-pipelines" {
  run conftest test jenkins-pipelines --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "jobs" {
  run conftest test jobs --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "namespace" {
  run conftest test namespace --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "net-namespace" {
  run conftest test net-namespace --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "nexus" {
  run conftest test nexus --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "ocp-identity-providers" {
  run conftest test ocp-identity-providers --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "operatorhub" {
  run conftest test operatorhub --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "pact-broker" {
  run conftest test pact-broker --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "prometheus" {
  run conftest test prometheus --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "project-requests" {
  run conftest test project-requests --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "rhpam" {
  run conftest test rhpam --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "rhsso" {
  run conftest test rhsso --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "role-bindings" {
  run conftest test role-bindings --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "s2i-app-build" {
  run conftest test s2i-app-build --output tap
  if [ "$status" -ne 0 ]; then echo "$output"; fi
  [ "$status" -eq 0 ]
}

@test "scc" {
  run conftest test scc --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "secrets" {
  run conftest test secrets --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "service-accounts" {
  run conftest test service-accounts --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "sonarqube" {
  run conftest test sonarqube --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}

@test "storage" {
  run conftest test storage --output tap
  if [ "$status" -ne 0 ]; then echo "$output" | grep "not ok"; fi
  [ "$status" -eq 0 ]
}